/*
 * pluma-window.c
 * This file is part of pluma
 *
 * Copyright (C) 2005 - Paolo Maggi
 * Copyright (C) 2012-2021 MATE Developers
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

/*
 * Modified by the pluma Team, 2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <time.h>
#include <sys/types.h>
#include <string.h>

#include <gdk/gdk.h>
#include <glib/gi18n.h>
#include <gio/gio.h>
#include <gtk/gtk.h>
#include <gtksourceview/gtksource.h>
#include <libpeas/peas-extension-set.h>

#include "pluma-ui.h"
#include "pluma-window.h"
#include "pluma-window-private.h"
#include "pluma-app.h"
#include "pluma-notebook.h"
#include "pluma-statusbar.h"
#include "pluma-utils.h"
#include "pluma-commands.h"
#include "pluma-debug.h"
#include "pluma-language-manager.h"
#include "pluma-panel.h"
#include "pluma-documents-panel.h"
#include "pluma-plugins-engine.h"
#include "pluma-window-activatable.h"
#include "pluma-enum-types.h"
#include "pluma-dirs.h"
#include "pluma-status-combo-box.h"
#include "pluma-settings.h"

#define LANGUAGE_NONE (const gchar *)"LangNone"
#define TAB_WIDTH_DATA "PlumaWindowTabWidthData"
#define LANGUAGE_DATA "PlumaWindowLanguageData"
#define FULLSCREEN_ANIMATION_SPEED 4

/* Local variables */
static gboolean cansave = TRUE;

/* Signals */
enum
{
    TAB_ADDED,
    TAB_REMOVED,
    TABS_REORDERED,
    ACTIVE_TAB_CHANGED,
    ACTIVE_TAB_STATE_CHANGED,
    LAST_SIGNAL
};

static guint signals[LAST_SIGNAL] = { 0 };

enum
{
    PROP_0,
    PROP_STATE
};

enum
{
    TARGET_URI_LIST = 100
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaWindow, pluma_window, GTK_TYPE_WINDOW)

static void    recent_manager_changed    (GtkRecentManager *manager,
                                          PlumaWindow      *window);

static void
pluma_window_get_property (GObject    *object,
                           guint       prop_id,
                           GValue     *value,
                           GParamSpec *pspec)
{
    PlumaWindow *window = PLUMA_WINDOW (object);

    switch (prop_id)
    {
        case PROP_STATE:
            g_value_set_enum (value,
                              pluma_window_get_state (window));
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
save_panes_state (PlumaWindow *window)
{
    gint pane_page;

    pluma_debug (DEBUG_WINDOW);

    if ((window->priv->window_state & GDK_WINDOW_STATE_MAXIMIZED) == 0)
        g_settings_set (window->priv->editor_settings, PLUMA_SETTINGS_WINDOW_SIZE,
                        "(ii)", window->priv->width, window->priv->height);

    g_settings_set_int (window->priv->editor_settings, PLUMA_SETTINGS_WINDOW_STATE,
                        window->priv->window_state);

    if (window->priv->side_panel_size > 0)
        g_settings_set_int (window->priv->editor_settings,
                            PLUMA_SETTINGS_SIDE_PANEL_SIZE,
                            window->priv->side_panel_size);

    pane_page = _pluma_panel_get_active_item_id (PLUMA_PANEL (window->priv->side_panel));
    if (pane_page != 0)
        g_settings_set_int (window->priv->editor_settings,
                            PLUMA_SETTINGS_SIDE_PANEL_ACTIVE_PAGE,
                            pane_page);

    if (window->priv->bottom_panel_size > 0)
        g_settings_set_int (window->priv->editor_settings,
                            PLUMA_SETTINGS_BOTTOM_PANEL_SIZE,
                            window->priv->bottom_panel_size);

    pane_page = _pluma_panel_get_active_item_id (PLUMA_PANEL (window->priv->bottom_panel));
    if (pane_page != 0)
        g_settings_set_int (window->priv->editor_settings,
                            PLUMA_SETTINGS_BOTTOM_PANEL_ACTIVE_PAGE, pane_page);
}

static void
pluma_window_dispose (GObject *object)
{
    PlumaWindow *window;

    pluma_debug (DEBUG_WINDOW);

    window = PLUMA_WINDOW (object);

    /* Stop tracking removal of panes otherwise we always
     * end up with thinking we had no pane active, since they
     * should all be removed below */
#if GLIB_CHECK_VERSION(2,62,0)
    g_clear_signal_handler (&window->priv->bottom_panel_item_removed_handler_id,
                            window->priv->bottom_panel);
#else
    if (window->priv->bottom_panel_item_removed_handler_id != 0)
    {
        g_signal_handler_disconnect (window->priv->bottom_panel,
                                     window->priv->bottom_panel_item_removed_handler_id);
        window->priv->bottom_panel_item_removed_handler_id = 0;
    }
#endif

    /* First of all, force collection so that plugins
     * really drop some of the references.
     */
    peas_engine_garbage_collect (PEAS_ENGINE (pluma_plugins_engine_get_default ()));

    /* save the panes position and make sure to deactivate plugins
     * for this window, but only once */
    if (!window->priv->dispose_has_run)
    {
        save_panes_state (window);

        /* Note that unreffing the extensions will automatically remove
           all extensions which in turn will deactivate the extension */
        g_object_unref (window->priv->extensions);

        peas_engine_garbage_collect (PEAS_ENGINE (pluma_plugins_engine_get_default ()));

        window->priv->dispose_has_run = TRUE;
    }

    if (window->priv->fullscreen_animation_timeout_id != 0)
    {
        g_source_remove (window->priv->fullscreen_animation_timeout_id);
        window->priv->fullscreen_animation_timeout_id = 0;
    }

    if (window->priv->fullscreen_controls != NULL)
    {
        gtk_widget_destroy (window->priv->fullscreen_controls);

        window->priv->fullscreen_controls = NULL;
    }

    if (window->priv->recents_handler_id != 0)
    {
        GtkRecentManager *recent_manager;

        recent_manager =  gtk_recent_manager_get_default ();
#if GLIB_CHECK_VERSION(2,62,0)
        g_clear_signal_handler (&window->priv->recents_handler_id,
                                recent_manager);
#else
        g_signal_handler_disconnect (recent_manager,
                                     window->priv->recents_handler_id);
        window->priv->recents_handler_id = 0;
#endif
    }

    if (window->priv->manager != NULL)
    {
        g_object_unref (window->priv->manager);
        window->priv->manager = NULL;
    }

    if (window->priv->message_bus != NULL)
    {
        g_object_unref (window->priv->message_bus);
        window->priv->message_bus = NULL;
    }

    if (window->priv->window_group != NULL)
    {
        g_object_unref (window->priv->window_group);
        window->priv->window_group = NULL;
    }

    /* We must free the settings after saving the panels */
    g_clear_object (&window->priv->editor_settings);

    /* Now that there have broken some reference loops,
     * force collection again.
     */
    peas_engine_garbage_collect (PEAS_ENGINE (pluma_plugins_engine_get_default ()));

    G_OBJECT_CLASS (pluma_window_parent_class)->dispose (object);
}

static void
pluma_window_finalize (GObject *object)
{
    PlumaWindow *window;

    pluma_debug (DEBUG_WINDOW);

    window = PLUMA_WINDOW (object);

    if (window->priv->default_location != NULL)
        g_object_unref (window->priv->default_location);

    G_OBJECT_CLASS (pluma_window_parent_class)->finalize (object);
}

static gboolean
pluma_window_window_state_event (GtkWidget           *widget,
                                 GdkEventWindowState *event)
{
    PlumaWindow *window = PLUMA_WINDOW (widget);

    window->priv->window_state = event->new_window_state;

    return GTK_WIDGET_CLASS (pluma_window_parent_class)->window_state_event (widget, event);
}

static gboolean
pluma_window_configure_event (GtkWidget         *widget,
                              GdkEventConfigure *event)
{
    PlumaWindow *window = PLUMA_WINDOW (widget);

    gtk_window_get_size(GTK_WINDOW (widget), &window->priv->width, &window->priv->height);

    return GTK_WIDGET_CLASS (pluma_window_parent_class)->configure_event (widget, event);
}

/*
 * GtkWindow catches keybindings for the menu items _before_ passing them to
 * the focused widget. This is unfortunate and means that pressing ctrl+V
 * in an entry on a panel ends up pasting text in the TextView.
 * Here we override GtkWindow's handler to do the same things that it
 * does, but in the opposite order and then we chain up to the grand
 * parent handler, skipping gtk_window_key_press_event.
 */
static gboolean
pluma_window_key_press_event (GtkWidget   *widget,
                              GdkEventKey *event)
{
    static gpointer grand_parent_class = NULL;
    GtkWindow *window = GTK_WINDOW (widget);
    gboolean handled = FALSE;
    /* FIXME: avoid making a new gsettings variable here */
    GSettings *settings = g_settings_new (PLUMA_SCHEMA_ID);

    if (event->state & GDK_CONTROL_MASK)
    {
        gchar     *font;
        gchar     *tempsize;
        gint       nsize;

        font = g_settings_get_string (settings, PLUMA_SETTINGS_EDITOR_FONT);
        tempsize = g_strdup (font);

        g_strreverse (tempsize);
        g_strcanon (tempsize, "1234567890", '\0');
        g_strreverse (tempsize);

        gchar tempfont [strlen (font) + 1];
        strcpy (tempfont, font);
        tempfont [strlen (font) - strlen (tempsize)] = 0;

        sscanf (tempsize, "%d", &nsize);

        if ((event->keyval == GDK_KEY_plus) || (event->keyval == GDK_KEY_KP_Add))
        {
            nsize = nsize + 1;
            sprintf (tempsize, "%d", nsize);

            if (!g_settings_get_boolean (settings, PLUMA_SETTINGS_USE_DEFAULT_FONT) && (nsize < 73))
            {
                gchar *tmp = g_strconcat (tempfont, tempsize, NULL);
                g_settings_set_string (settings, PLUMA_SETTINGS_EDITOR_FONT, tmp);
                g_free (tmp);
            }
        }
        else if ((event->keyval == GDK_KEY_minus) || (event->keyval == GDK_KEY_KP_Subtract))
        {
            nsize = nsize - 1;
            sprintf (tempsize, "%d", nsize);

            if (!g_settings_get_boolean (settings, PLUMA_SETTINGS_USE_DEFAULT_FONT) && (nsize > 5))
            {
                gchar *tmp = g_strconcat (tempfont, tempsize, NULL);
                g_settings_set_string (settings, PLUMA_SETTINGS_EDITOR_FONT, tmp);
                g_free (tmp);
            }
        }
        else if (event->keyval == GDK_KEY_y)
        {
            g_settings_set_boolean (settings, PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS,
                                    !g_settings_get_boolean (settings, PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS));
        }

        if (g_settings_get_boolean (settings, PLUMA_SETTINGS_CTRL_TABS_SWITCH_TABS))
        {
            GtkNotebook *notebook = GTK_NOTEBOOK (_pluma_window_get_notebook (PLUMA_WINDOW (window)));

            int pages = gtk_notebook_get_n_pages (notebook);
            int page_num = gtk_notebook_get_current_page (notebook);

            if (event->keyval == GDK_KEY_ISO_Left_Tab)
            {
                if (page_num != 0)
                    gtk_notebook_prev_page (notebook);
                else
                    gtk_notebook_set_current_page (notebook, (pages - 1));
                handled = TRUE;
            }

            if (event->keyval == GDK_KEY_Tab)
            {
                if (page_num != (pages -1))
                    gtk_notebook_next_page (notebook);
                else
                    gtk_notebook_set_current_page (notebook, 0);
                handled = TRUE;
            }
        }
        g_free (font);
        g_free (tempsize);
    }

    g_object_unref (settings);

    if (grand_parent_class == NULL)
        grand_parent_class = g_type_class_peek_parent (pluma_window_parent_class);

    /* handle focus widget key events */
    if (!handled)
        handled = gtk_window_propagate_key_event (window, event);

    /* handle mnemonics and accelerators */
    if (!handled)
        handled = gtk_window_activate_key (window, event);

    /* Chain up, invokes binding set */
    if (!handled)
        handled = GTK_WIDGET_CLASS (grand_parent_class)->key_press_event (widget, event);

    return handled;
}

static void
pluma_window_tab_removed (PlumaWindow *window,
                          PlumaTab    *tab)
{
    peas_engine_garbage_collect (PEAS_ENGINE (pluma_plugins_engine_get_default ()));
}

static void
pluma_window_class_init (PlumaWindowClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);
    GtkWidgetClass *widget_class = GTK_WIDGET_CLASS (klass);

    klass->tab_removed = pluma_window_tab_removed;

    object_class->dispose = pluma_window_dispose;
    object_class->finalize = pluma_window_finalize;
    object_class->get_property = pluma_window_get_property;

    widget_class->window_state_event = pluma_window_window_state_event;
    widget_class->configure_event = pluma_window_configure_event;
    widget_class->key_press_event = pluma_window_key_press_event;

    signals[TAB_ADDED] =
        g_signal_new ("tab_added",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_FIRST,
                      G_STRUCT_OFFSET (PlumaWindowClass, tab_added),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      1,
                      PLUMA_TYPE_TAB);
    signals[TAB_REMOVED] =
        g_signal_new ("tab_removed",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_FIRST,
                      G_STRUCT_OFFSET (PlumaWindowClass, tab_removed),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      1,
                      PLUMA_TYPE_TAB);
    signals[TABS_REORDERED] =
        g_signal_new ("tabs_reordered",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_FIRST,
                      G_STRUCT_OFFSET (PlumaWindowClass, tabs_reordered),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      0);
    signals[ACTIVE_TAB_CHANGED] =
        g_signal_new ("active_tab_changed",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_FIRST,
                      G_STRUCT_OFFSET (PlumaWindowClass, active_tab_changed),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      1,
                      PLUMA_TYPE_TAB);
    signals[ACTIVE_TAB_STATE_CHANGED] =
        g_signal_new ("active_tab_state_changed",
                      G_OBJECT_CLASS_TYPE (object_class),
                      G_SIGNAL_RUN_FIRST,
                      G_STRUCT_OFFSET (PlumaWindowClass, active_tab_state_changed),
                      NULL, NULL, NULL,
                      G_TYPE_NONE,
                      0);

    g_object_class_install_property (object_class,
                                     PROP_STATE,
                                     g_param_spec_flags ("state",
                                                         "State",
                                                         "The window's state",
                                                         PLUMA_TYPE_WINDOW_STATE,
                                                         PLUMA_WINDOW_STATE_NORMAL,
                                                         G_PARAM_READABLE |
                                                         G_PARAM_STATIC_STRINGS));
}

static void
menu_item_select_cb (GtkMenuItem *proxy,
                     PlumaWindow *window)
{
    GtkAction *action;
    char *message;

    action = gtk_activatable_get_related_action (GTK_ACTIVATABLE (proxy));
    g_return_if_fail (action != NULL);

    g_object_get (G_OBJECT (action), "tooltip", &message, NULL);
    if (message)
    {
        gtk_statusbar_push (GTK_STATUSBAR (window->priv->statusbar),
                            window->priv->tip_message_cid, message);
        g_free (message);
    }
}

static void
menu_item_deselect_cb (GtkMenuItem *proxy,
                       PlumaWindow *window)
{
    gtk_statusbar_pop (GTK_STATUSBAR (window->priv->statusbar),
               window->priv->tip_message_cid);
}

static void
connect_proxy_cb (GtkUIManager *manager,
                  GtkAction *action,
                  GtkWidget *proxy,
                  PlumaWindow *window)
{
    if (GTK_IS_MENU_ITEM (proxy))
    {
        g_signal_connect (proxy, "select",
                          G_CALLBACK (menu_item_select_cb), window);
        g_signal_connect (proxy, "deselect",
                          G_CALLBACK (menu_item_deselect_cb), window);
    }
}

static void
disconnect_proxy_cb (GtkUIManager *manager,
                     GtkAction    *action,
                     GtkWidget    *proxy,
                     PlumaWindow  *window)
{
    if (GTK_IS_MENU_ITEM (proxy))
    {
        g_signal_handlers_disconnect_by_func
            (proxy, G_CALLBACK (menu_item_select_cb), window);
        g_signal_handlers_disconnect_by_func
            (proxy, G_CALLBACK (menu_item_deselect_cb), window);
    }
}

static void
apply_toolbar_style (PlumaWindow *window,
                     GtkWidget   *toolbar)
{
    switch (window->priv->toolbar_style)
    {
        case PLUMA_TOOLBAR_SYSTEM:
            pluma_debug_message (DEBUG_WINDOW, "PLUMA: SYSTEM");
            gtk_toolbar_unset_style (GTK_TOOLBAR (toolbar));
            break;

        case PLUMA_TOOLBAR_ICONS:
            pluma_debug_message (DEBUG_WINDOW, "PLUMA: ICONS");
            gtk_toolbar_set_style (GTK_TOOLBAR (toolbar),
                                   GTK_TOOLBAR_ICONS);
            break;

        case PLUMA_TOOLBAR_ICONS_AND_TEXT:
            pluma_debug_message (DEBUG_WINDOW, "PLUMA: ICONS_AND_TEXT");
            gtk_toolbar_set_style (GTK_TOOLBAR (toolbar),
                                   GTK_TOOLBAR_BOTH);
            break;

        case PLUMA_TOOLBAR_ICONS_BOTH_HORIZ:
            pluma_debug_message (DEBUG_WINDOW, "PLUMA: ICONS_BOTH_HORIZ");
            gtk_toolbar_set_style (GTK_TOOLBAR (toolbar),
                                   GTK_TOOLBAR_BOTH_HORIZ);
            break;
    }
}

/* Returns TRUE if toolbar is visible */
static gboolean
set_toolbar_style (PlumaWindow *window,
                   PlumaWindow *origin)
{
    gboolean visible;
    PlumaToolbarSetting style;
    GtkAction *action;

    if (origin == NULL)
        visible = g_settings_get_boolean (window->priv->editor_settings,
                                          PLUMA_SETTINGS_TOOLBAR_VISIBLE);
    else
        visible = gtk_widget_get_visible (origin->priv->toolbar);

    /* Set visibility */
    if (visible)
        gtk_widget_show (window->priv->toolbar);
    else
        gtk_widget_hide (window->priv->toolbar);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewToolbar");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);

    /* Set style */
    if (origin == NULL)
    {
        PlumaSettings *settings;

        settings = _pluma_settings_get_singleton ();
        style = pluma_settings_get_toolbar_style (settings);
    }
    else
    {
        style = origin->priv->toolbar_style;
    }

    window->priv->toolbar_style = style;

    apply_toolbar_style (window, window->priv->toolbar);

    return visible;
}

static void
update_next_prev_doc_sensitivity (PlumaWindow *window,
                                  PlumaTab    *tab)
{
    gint         tab_number;
    GtkNotebook *notebook;
    GtkAction   *action;

    pluma_debug (DEBUG_WINDOW);

    notebook = GTK_NOTEBOOK (_pluma_window_get_notebook (window));

    tab_number = gtk_notebook_page_num (notebook, GTK_WIDGET (tab));
    g_return_if_fail (tab_number >= 0);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "DocumentsPreviousDocument");
    gtk_action_set_sensitive (action, tab_number != 0);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "DocumentsNextDocument");
    gtk_action_set_sensitive (action,
                              tab_number < gtk_notebook_get_n_pages (notebook) - 1);
}

static void
update_next_prev_doc_sensitivity_per_window (PlumaWindow *window)
{
    PlumaTab  *tab;
    GtkAction *action;

    pluma_debug (DEBUG_WINDOW);

    tab = pluma_window_get_active_tab (window);
    if (tab != NULL)
    {
        update_next_prev_doc_sensitivity (window, tab);

        return;
    }

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "DocumentsPreviousDocument");
    gtk_action_set_sensitive (action, FALSE);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "DocumentsNextDocument");
    gtk_action_set_sensitive (action, FALSE);

}

static void
received_clipboard_contents (GtkClipboard     *clipboard,
                             GtkSelectionData *selection_data,
                             PlumaWindow      *window)
{
    gboolean sens;
    GtkAction *action;

    /* getting clipboard contents is async, so we need to
     * get the current tab and its state */

    if (window->priv->active_tab != NULL)
    {
        PlumaTabState state;
        gboolean state_normal;

        state = pluma_tab_get_state (window->priv->active_tab);
        state_normal = (state == PLUMA_TAB_STATE_NORMAL);

        sens = state_normal &&
               gtk_selection_data_targets_include_text (selection_data);
    }
    else
    {
        sens = FALSE;
    }

    action = gtk_action_group_get_action (window->priv->action_group, "EditPaste");

    gtk_action_set_sensitive (action, sens);

    g_object_unref (window);
}

static void
set_paste_sensitivity_according_to_clipboard (PlumaWindow  *window,
                                              GtkClipboard *clipboard)
{
    GdkDisplay *display;

    display = gtk_clipboard_get_display (clipboard);

    if (gdk_display_supports_selection_notification (display))
    {
        gtk_clipboard_request_contents (clipboard,
                                        gdk_atom_intern_static_string ("TARGETS"),
                                        (GtkClipboardReceivedFunc) received_clipboard_contents,
                                        g_object_ref (window));
    }
    else
    {
        GtkAction *action;

        action = gtk_action_group_get_action (window->priv->action_group,
                                              "EditPaste");

        /* XFIXES extension not availbale, make
         * Paste always sensitive */
        gtk_action_set_sensitive (action, TRUE);
    }
}

static void
set_sensitivity_according_to_tab (PlumaWindow *window,
                                  PlumaTab    *tab)
{
    PlumaDocument *doc;
    PlumaView     *view;
    GtkAction     *action;
    gboolean       b;
    gboolean       state_normal;
    gboolean       editable;
    PlumaTabState  state;
    GtkClipboard  *clipboard;
    PlumaLockdownMask lockdown;
    gboolean       enable_syntax_highlighting;

    g_return_if_fail (PLUMA_TAB (tab));

    pluma_debug (DEBUG_WINDOW);

    enable_syntax_highlighting = g_settings_get_boolean (window->priv->editor_settings,
                                                         PLUMA_SETTINGS_SYNTAX_HIGHLIGHTING);

    lockdown = pluma_app_get_lockdown (pluma_app_get_default ());

    state = pluma_tab_get_state (tab);
    state_normal = (state == PLUMA_TAB_STATE_NORMAL);

    view = pluma_tab_get_view (tab);
    editable = gtk_text_view_get_editable (GTK_TEXT_VIEW (view));

    doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));

    clipboard = gtk_widget_get_clipboard (GTK_WIDGET (window),
                                          GDK_SELECTION_CLIPBOARD);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FileSave");

    if (state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) {
        gtk_text_buffer_set_modified (GTK_TEXT_BUFFER (doc), TRUE);
    }

    gtk_action_set_sensitive (action,
                              (state_normal ||
                              (state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) ||
                              (state == PLUMA_TAB_STATE_SHOWING_PRINT_PREVIEW)) &&
                              !pluma_document_get_readonly (doc) &&
                              !(lockdown & PLUMA_LOCKDOWN_SAVE_TO_DISK) &&
                              (cansave) &&
                              (editable));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FileSaveAs");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              (state == PLUMA_TAB_STATE_SAVING_ERROR) ||
                              (state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) ||
                              (state == PLUMA_TAB_STATE_SHOWING_PRINT_PREVIEW)) &&
                              !(lockdown & PLUMA_LOCKDOWN_SAVE_TO_DISK));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FileRevert");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              (state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION)) &&
                              !pluma_document_is_untitled (doc));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FilePrintPreview");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              !(lockdown & PLUMA_LOCKDOWN_PRINTING));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FilePrint");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              (state == PLUMA_TAB_STATE_SHOWING_PRINT_PREVIEW)) &&
                              !(lockdown & PLUMA_LOCKDOWN_PRINTING));

    action = gtk_action_group_get_action (window->priv->close_action_group,
                                          "FileClose");

    gtk_action_set_sensitive (action,
                              (state != PLUMA_TAB_STATE_CLOSING) &&
                              (state != PLUMA_TAB_STATE_SAVING) &&
                              (state != PLUMA_TAB_STATE_SHOWING_PRINT_PREVIEW) &&
                              (state != PLUMA_TAB_STATE_PRINTING) &&
                              (state != PLUMA_TAB_STATE_PRINT_PREVIEWING) &&
                              (state != PLUMA_TAB_STATE_SAVING_ERROR));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditUndo");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              gtk_source_buffer_can_undo (GTK_SOURCE_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditRedo");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              gtk_source_buffer_can_redo (GTK_SOURCE_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditCut");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              editable &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditCopy");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                               state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditPaste");
    if (state_normal && editable)
    {
        set_paste_sensitivity_according_to_clipboard (window, clipboard);
    }
    else
    {
        gtk_action_set_sensitive (action, FALSE);
    }

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditDelete");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              editable &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchFind");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                               state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchIncrementalSearch");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchReplace");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              editable);

    b = pluma_document_get_can_search_again (doc);
    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchFindNext");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) && b);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchFindPrevious");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) && b);

    action = gtk_action_group_get_action (window->priv->action_group,
                                         "SearchClearHighlight");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) && b);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchGoToLine");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "ViewHighlightMode");
    gtk_action_set_sensitive (action,
                              (state != PLUMA_TAB_STATE_CLOSING) &&
                              enable_syntax_highlighting);

    update_next_prev_doc_sensitivity (window, tab);

    peas_extension_set_call (window->priv->extensions, "update_state");
}

static void
language_toggled (GtkToggleAction *action,
                  PlumaWindow     *window)
{
    PlumaDocument *doc;
    GtkSourceLanguage *lang;
    const gchar *lang_id;

    if (gtk_toggle_action_get_active (action) == FALSE)
        return;

    doc = pluma_window_get_active_document (window);
    if (doc == NULL)
        return;

    lang_id = gtk_action_get_name (GTK_ACTION (action));

    if (strcmp (lang_id, LANGUAGE_NONE) == 0)
    {
        /* Normal (no highlighting) */
        lang = NULL;
    }
    else
    {
        lang = gtk_source_language_manager_get_language (pluma_get_language_manager (),
                                                         lang_id);
        if (lang == NULL)
        {
            g_warning ("Could not get language %s\n", lang_id);
        }
    }

    pluma_document_set_language (doc, lang);
}

static gchar *
escape_section_name (const gchar *name)
{
    gchar *ret;

    ret = g_markup_escape_text (name, -1);

    /* Replace '/' with '-' to avoid problems in xml paths */
    g_strdelimit (ret, "/", '-');

    return ret;
}

static void
create_language_menu_item (GtkSourceLanguage *lang,
                           gint           index,
                           guint          ui_id,
                           PlumaWindow       *window)
{
    GtkAction *section_action;
    GtkRadioAction *action;
    GtkAction *normal_action;
    GSList *group;
    const gchar *section;
    gchar *escaped_section;
    const gchar *lang_id;
    const gchar *lang_name;
    gchar *escaped_lang_name;
    gchar *tip;
    gchar *path;

    section = gtk_source_language_get_section (lang);
    escaped_section = escape_section_name (section);

    /* check if the section submenu exists or create it */
    section_action = gtk_action_group_get_action (window->priv->languages_action_group,
                                                  escaped_section);

    if (section_action == NULL)
    {
        gchar *section_name;

        section_name = pluma_utils_escape_underscores (section, -1);

        section_action = gtk_action_new (escaped_section,
                                         section_name,
                                         NULL,
                                         NULL);

        g_free (section_name);

        gtk_action_group_add_action (window->priv->languages_action_group,
                                     section_action);
        g_object_unref (section_action);

        gtk_ui_manager_add_ui (window->priv->manager,
                               ui_id,
                               "/MenuBar/ViewMenu/ViewHighlightModeMenu/LanguagesMenuPlaceholder",
                               escaped_section,
                               escaped_section,
                               GTK_UI_MANAGER_MENU,
                               FALSE);
    }

    /* now add the language item to the section */
    lang_name = gtk_source_language_get_name (lang);
    lang_id = gtk_source_language_get_id (lang);

    escaped_lang_name = pluma_utils_escape_underscores (lang_name, -1);

    tip = g_strdup_printf (_("Use %s highlight mode"), lang_name);
    path = g_strdup_printf ("/MenuBar/ViewMenu/ViewHighlightModeMenu/LanguagesMenuPlaceholder/%s",
                            escaped_section);

    action = gtk_radio_action_new (lang_id,
                                   escaped_lang_name,
                                   tip,
                                   NULL,
                                   index);

    g_free (escaped_lang_name);

    /* Action is added with a NULL accel to make the accel overridable */
    gtk_action_group_add_action_with_accel (window->priv->languages_action_group,
                                            GTK_ACTION (action),
                                            NULL);
    g_object_unref (action);

    /* add the action to the same radio group of the "Normal" action */
    normal_action = gtk_action_group_get_action (window->priv->languages_action_group,
                                                 LANGUAGE_NONE);
    group = gtk_radio_action_get_group (GTK_RADIO_ACTION (normal_action));
    gtk_radio_action_set_group (action, group);

    g_signal_connect (action,
                      "activate",
                      G_CALLBACK (language_toggled),
                      window);

    gtk_ui_manager_add_ui (window->priv->manager,
                           ui_id,
                           path,
                           lang_id,
                           lang_id,
                           GTK_UI_MANAGER_MENUITEM,
                           FALSE);

    g_free (path);
    g_free (tip);
    g_free (escaped_section);
}

static void
create_languages_menu (PlumaWindow *window)
{
    GtkRadioAction *action_none;
    GSList *languages;
    GSList *l;
    guint id;
    gint i;

    pluma_debug (DEBUG_WINDOW);

    /* add the "Plain Text" item before all the others */

    /* Translators: "Plain Text" means that no highlight mode is selected in the
     * "View->Highlight Mode" submenu and so syntax highlighting is disabled */
    action_none = gtk_radio_action_new (LANGUAGE_NONE, _("Plain Text"),
                                        _("Disable syntax highlighting"),
                                        NULL,
                                        -1);

    gtk_action_group_add_action (window->priv->languages_action_group,
                                 GTK_ACTION (action_none));
    g_object_unref (action_none);

    g_signal_connect (action_none,
                      "activate",
                      G_CALLBACK (language_toggled),
                      window);

    id = gtk_ui_manager_new_merge_id (window->priv->manager);

    gtk_ui_manager_add_ui (window->priv->manager,
                           id,
                           "/MenuBar/ViewMenu/ViewHighlightModeMenu/LanguagesMenuPlaceholder",
                           LANGUAGE_NONE,
                           LANGUAGE_NONE,
                           GTK_UI_MANAGER_MENUITEM,
                           TRUE);

    gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action_none), TRUE);

    /* now add all the known languages */
    languages = pluma_language_manager_list_languages_sorted (pluma_get_language_manager (),
                                                              FALSE);

    for (l = languages, i = 0; l != NULL; l = l->next, ++i)
    {
        create_language_menu_item (l->data,
                                   i,
                                   id,
                                   window);
    }

    g_slist_free (languages);
}

static void
update_languages_menu (PlumaWindow *window)
{
    PlumaDocument *doc;
    GList *actions;
    GList *l;
    GtkAction *action;
    GtkSourceLanguage *lang;
    const gchar *lang_id;

    doc = pluma_window_get_active_document (window);
    if (doc == NULL)
        return;

    lang = pluma_document_get_language (doc);
    if (lang != NULL)
        lang_id = gtk_source_language_get_id (lang);
    else
        lang_id = LANGUAGE_NONE;

    actions = gtk_action_group_list_actions (window->priv->languages_action_group);

    /* prevent recursion */
    for (l = actions; l != NULL; l = l->next)
    {
        g_signal_handlers_block_by_func (GTK_ACTION (l->data),
                                         G_CALLBACK (language_toggled),
                                         window);
    }

    action = gtk_action_group_get_action (window->priv->languages_action_group,
                                          lang_id);

    gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), TRUE);

    for (l = actions; l != NULL; l = l->next)
    {
        g_signal_handlers_unblock_by_func (GTK_ACTION (l->data),
                                           G_CALLBACK (language_toggled),
                                           window);
    }

    g_list_free (actions);
}

void
_pluma_recent_add (PlumaWindow *window,
                   const gchar *uri,
                   const gchar *mime)
{
    GtkRecentManager *recent_manager;
    GtkRecentData recent_data;

    static gchar *groups[2] = {
        "pluma",
        NULL
    };

    recent_manager =  gtk_recent_manager_get_default ();

    recent_data.display_name = NULL;
    recent_data.description = NULL;
    recent_data.mime_type = (gchar *) mime;
    recent_data.app_name = (gchar *) g_get_application_name ();
    recent_data.app_exec = g_strjoin (" ", g_get_prgname (), "%u", NULL);
    recent_data.groups = groups;
    recent_data.is_private = FALSE;

    gtk_recent_manager_add_full (recent_manager,
                                 uri,
                                 &recent_data);

    g_free (recent_data.app_exec);
}

void
_pluma_recent_remove (PlumaWindow *window,
                      const gchar *uri)
{
    GtkRecentManager *recent_manager;

    recent_manager =  gtk_recent_manager_get_default ();

    gtk_recent_manager_remove_item (recent_manager, uri, NULL);
}

static void
open_recent_file (const gchar *uri,
                  PlumaWindow *window)
{
    GSList *uris = NULL;

    uris = g_slist_prepend (uris, (gpointer) uri);

    if (pluma_commands_load_uris (window, uris, NULL, 0) != 1)
    {
        _pluma_recent_remove (window, uri);
    }

    g_slist_free (uris);
}

static void
recent_chooser_item_activated (GtkRecentChooser *chooser,
                               PlumaWindow      *window)
{
    gchar *uri;

    uri = gtk_recent_chooser_get_current_uri (chooser);

    open_recent_file (uri, window);

    g_free (uri);
}

static void
recents_menu_activate (GtkAction   *action,
                       PlumaWindow *window)
{
    GtkRecentInfo *info;
    const gchar *uri;

    info = g_object_get_data (G_OBJECT (action), "gtk-recent-info");
    g_return_if_fail (info != NULL);

    uri = gtk_recent_info_get_uri (info);

    open_recent_file (uri, window);
}

static gint
sort_recents_mru (GtkRecentInfo *a, GtkRecentInfo *b)
{
    return (gtk_recent_info_get_modified (b) - gtk_recent_info_get_modified (a));
}

static void    update_recent_files_menu (PlumaWindow *window);

static void
recent_manager_changed (GtkRecentManager *manager,
                        PlumaWindow      *window)
{
    /* regenerate the menu when the model changes */
    update_recent_files_menu (window);
}

/*
 * Manually construct the inline recents list in the File menu.
 * Hopefully gtk 2.12 will add support for it.
 */
static void
update_recent_files_menu (PlumaWindow *window)
{
    PlumaWindowPrivate *p = window->priv;
    GtkRecentManager *recent_manager;
    guint max_recents;
    GList *actions, *l, *items;
    GList *filtered_items = NULL;
    gint i;

    pluma_debug (DEBUG_WINDOW);

    max_recents = g_settings_get_uint (window->priv->editor_settings, PLUMA_SETTINGS_MAX_RECENTS);

    g_return_if_fail (p->recents_action_group != NULL);

    if (p->recents_menu_ui_id != 0)
        gtk_ui_manager_remove_ui (p->manager, p->recents_menu_ui_id);

    actions = gtk_action_group_list_actions (p->recents_action_group);
    for (l = actions; l != NULL; l = l->next)
    {
        g_signal_handlers_disconnect_by_func (GTK_ACTION (l->data),
                                              G_CALLBACK (recents_menu_activate),
                                              window);
         gtk_action_group_remove_action (p->recents_action_group,
                                         GTK_ACTION (l->data));
    }
    g_list_free (actions);

    p->recents_menu_ui_id = gtk_ui_manager_new_merge_id (p->manager);

    recent_manager =  gtk_recent_manager_get_default ();
    items = gtk_recent_manager_get_items (recent_manager);

    /* filter */
    for (l = items; l != NULL; l = l->next)
    {
        GtkRecentInfo *info = l->data;

        if (!gtk_recent_info_has_group (info, "pluma"))
            continue;

        filtered_items = g_list_prepend (filtered_items, info);
    }

    /* sort */
    filtered_items = g_list_sort (filtered_items,
                                  (GCompareFunc) sort_recents_mru);

    i = 0;
    for (l = filtered_items; l != NULL; l = l->next)
    {
        gchar *action_name;
        const gchar *display_name;
        gchar *escaped;
        gchar *label;
        gchar *uri;
        gchar *ruri;
        gchar *tip;
        GtkAction *action;
        GtkRecentInfo *info = l->data;

        /* clamp */
        if (i >= max_recents)
            break;

        i++;

        action_name = g_strdup_printf ("recent-info-%d", i);

        display_name = gtk_recent_info_get_display_name (info);
        escaped = pluma_utils_escape_underscores (display_name, -1);
        if (i >= 10)
            label = g_strdup_printf ("%d.  %s",
                                     i,
                                     escaped);
        else
            label = g_strdup_printf ("_%d.  %s",
                                     i,
                                     escaped);
        g_free (escaped);

        /* gtk_recent_info_get_uri_display (info) is buggy and
         * works only for local files */
        uri = pluma_utils_uri_for_display (gtk_recent_info_get_uri (info));
        ruri = pluma_utils_replace_home_dir_with_tilde (uri);
        g_free (uri);

        /* Translators: %s is a URI */
        tip = g_strdup_printf (_("Open '%s'"), ruri);
        g_free (ruri);

        action = gtk_action_new (action_name,
                                 label,
                                 tip,
                                 NULL);

        g_object_set_data_full (G_OBJECT (action),
                                "gtk-recent-info",
                                gtk_recent_info_ref (info),
                                (GDestroyNotify) gtk_recent_info_unref);

        g_signal_connect (action,
                          "activate",
                          G_CALLBACK (recents_menu_activate),
                          window);

        gtk_action_group_add_action (p->recents_action_group,
                                     action);
        g_object_unref (action);

        gtk_ui_manager_add_ui (p->manager,
                               p->recents_menu_ui_id,
                               "/MenuBar/FileMenu/FileRecentsPlaceholder",
                               action_name,
                               action_name,
                               GTK_UI_MANAGER_MENUITEM,
                               FALSE);

        g_free (action_name);
        g_free (label);
        g_free (tip);
    }

    g_list_free (filtered_items);

    g_list_free_full (items, (GDestroyNotify) gtk_recent_info_unref);
}

static void
set_non_homogeneus (GtkWidget *widget, gpointer data)
{
    gtk_tool_item_set_homogeneous (GTK_TOOL_ITEM (widget), FALSE);
}

static void
toolbar_visibility_changed (GtkWidget   *toolbar,
                            PlumaWindow *window)
{
    gboolean visible;
    GtkAction *action;

    visible = gtk_widget_get_visible (toolbar);

    g_settings_set_boolean (window->priv->editor_settings,
                            PLUMA_SETTINGS_TOOLBAR_VISIBLE, visible);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewToolbar");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);
}

static GtkWidget *
setup_toolbar_open_button (PlumaWindow *window,
                           GtkWidget *toolbar)
{
    GtkRecentManager *recent_manager;
    GtkRecentFilter *filter;
    GtkWidget *toolbar_recent_menu;
    GtkToolItem *open_button;
    GtkAction *action;
    guint max_recents;

    recent_manager = gtk_recent_manager_get_default ();

    max_recents = g_settings_get_uint (window->priv->editor_settings, PLUMA_SETTINGS_MAX_RECENTS);

    /* recent files menu tool button */
    toolbar_recent_menu = gtk_recent_chooser_menu_new_for_manager (recent_manager);

    gtk_recent_chooser_set_local_only (GTK_RECENT_CHOOSER (toolbar_recent_menu),
                                       FALSE);
    gtk_recent_chooser_set_sort_type (GTK_RECENT_CHOOSER (toolbar_recent_menu),
                                      GTK_RECENT_SORT_MRU);
    gtk_recent_chooser_set_limit (GTK_RECENT_CHOOSER (toolbar_recent_menu),
                                  max_recents);

    filter = gtk_recent_filter_new ();
    gtk_recent_filter_add_group (filter, "pluma");
    gtk_recent_chooser_set_filter (GTK_RECENT_CHOOSER (toolbar_recent_menu),
                                   filter);

    g_signal_connect (toolbar_recent_menu,
                      "item_activated",
                      G_CALLBACK (recent_chooser_item_activated),
                      window);

    /* add the custom Open button to the toolbar */
    open_button = gtk_menu_tool_button_new (gtk_image_new_from_icon_name ("document-open",
                                            GTK_ICON_SIZE_MENU),
                                            _("Open a file"));

    gtk_menu_tool_button_set_menu (GTK_MENU_TOOL_BUTTON (open_button),
                                   toolbar_recent_menu);

    gtk_menu_tool_button_set_arrow_tooltip_text (GTK_MENU_TOOL_BUTTON (open_button),
                                                 _("Open a recently used file"));

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                         "FileOpen");
    g_object_set (action,
                  "is_important", TRUE,
                  "short_label", _("Open"),
                  NULL);
    gtk_activatable_set_related_action (GTK_ACTIVATABLE (open_button),
                                        action);

    gtk_toolbar_insert (GTK_TOOLBAR (toolbar),
                        open_button,
                        1);

    return toolbar_recent_menu;
}

static void
create_menu_bar_and_toolbar (PlumaWindow *window,
                             GtkWidget   *main_box)
{
    GtkActionGroup *action_group;
    GtkAction *action;
    GtkUIManager *manager;
    GtkRecentManager *recent_manager;
    GError *error = NULL;

    pluma_debug (DEBUG_WINDOW);

    manager = gtk_ui_manager_new ();
    window->priv->manager = manager;

    gtk_window_add_accel_group (GTK_WINDOW (window),
                                gtk_ui_manager_get_accel_group (manager));

    action_group = gtk_action_group_new ("PlumaWindowAlwaysSensitiveActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    gtk_action_group_add_actions (action_group,
                                  pluma_always_sensitive_menu_entries,
                                  G_N_ELEMENTS (pluma_always_sensitive_menu_entries),
                                  window);
    gtk_action_group_add_toggle_actions (action_group,
                                         pluma_always_sensitive_toggle_menu_entries,
                                         G_N_ELEMENTS (pluma_always_sensitive_toggle_menu_entries),
                                         window);

    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    window->priv->always_sensitive_action_group = action_group;

    action_group = gtk_action_group_new ("PlumaWindowActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    gtk_action_group_add_actions (action_group,
                                  pluma_menu_entries,
                                  G_N_ELEMENTS (pluma_menu_entries),
                                  window);
    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    window->priv->action_group = action_group;

    /* set short labels to use in the toolbar */
    action = gtk_action_group_get_action (action_group, "FileSave");
    g_object_set (action, "short_label", _("Save"), NULL);
    action = gtk_action_group_get_action (action_group, "FilePrint");
    g_object_set (action, "short_label", _("Print"), NULL);
    action = gtk_action_group_get_action (action_group, "SearchFind");
    g_object_set (action, "short_label", _("Find"), NULL);
    action = gtk_action_group_get_action (action_group, "SearchReplace");
    g_object_set (action, "short_label", _("Replace"), NULL);

    /* set which actions should have priority on the toolbar */
    action = gtk_action_group_get_action (action_group, "FileSave");
    g_object_set (action, "is_important", TRUE, NULL);
    action = gtk_action_group_get_action (action_group, "EditUndo");
    g_object_set (action, "is_important", TRUE, NULL);

    action_group = gtk_action_group_new ("PlumaQuitWindowActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    gtk_action_group_add_actions (action_group,
                                  pluma_quit_menu_entries,
                                  G_N_ELEMENTS (pluma_quit_menu_entries),
                                  window);

    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    window->priv->quit_action_group = action_group;

    action_group = gtk_action_group_new ("PlumaCloseWindowActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    gtk_action_group_add_actions (action_group,
                                  pluma_close_menu_entries,
                                  G_N_ELEMENTS (pluma_close_menu_entries),
                                  window);

    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    window->priv->close_action_group = action_group;

    action_group = gtk_action_group_new ("PlumaWindowPanesActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    gtk_action_group_add_toggle_actions (action_group,
                                         pluma_panes_toggle_menu_entries,
                                         G_N_ELEMENTS (pluma_panes_toggle_menu_entries),
                                         window);

    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    window->priv->panes_action_group = action_group;

    /* now load the UI definition */
    gtk_ui_manager_add_ui_from_file (manager,
                                     PLUMA_DATADIR "/ui/pluma-ui.xml",
                                     &error);
    if (error != NULL)
    {
        g_warning ("Could not merge %s: %s",
                   PLUMA_DATADIR "/ui/pluma-ui.xml",
                   error->message);
        g_error_free (error);
    }

    /* show tooltips in the statusbar */
    g_signal_connect (manager,
                      "connect_proxy",
                      G_CALLBACK (connect_proxy_cb),
                      window);
    g_signal_connect (manager,
                      "disconnect_proxy",
                      G_CALLBACK (disconnect_proxy_cb),
                      window);

    /* recent files menu */
    action_group = gtk_action_group_new ("RecentFilesActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    window->priv->recents_action_group = action_group;
    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);

    recent_manager = gtk_recent_manager_get_default ();
    window->priv->recents_handler_id = g_signal_connect (recent_manager,
                                                         "changed",
                                                         G_CALLBACK (recent_manager_changed),
                                                         window);
    update_recent_files_menu (window);

    /* languages menu */
    action_group = gtk_action_group_new ("LanguagesActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    window->priv->languages_action_group = action_group;
    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);
    create_languages_menu (window);

    /* list of open documents menu */
    action_group = gtk_action_group_new ("DocumentsListActions");
    gtk_action_group_set_translation_domain (action_group, NULL);
    window->priv->documents_list_action_group = action_group;
    gtk_ui_manager_insert_action_group (manager, action_group, 0);
    g_object_unref (action_group);

    window->priv->menubar = gtk_ui_manager_get_widget (manager, "/MenuBar");
    gtk_box_pack_start (GTK_BOX (main_box),
                        window->priv->menubar,
                        FALSE,
                        FALSE,
                        0);

    window->priv->toolbar = gtk_ui_manager_get_widget (manager, "/ToolBar");
    gtk_style_context_add_class (gtk_widget_get_style_context (window->priv->toolbar),
                                 GTK_STYLE_CLASS_PRIMARY_TOOLBAR);
    gtk_box_pack_start (GTK_BOX (main_box),
                        window->priv->toolbar,
                        FALSE,
                        FALSE,
                        0);

    set_toolbar_style (window, NULL);

    window->priv->toolbar_recent_menu = setup_toolbar_open_button (window, window->priv->toolbar);

    gtk_container_foreach (GTK_CONTAINER (window->priv->toolbar),
                           (GtkCallback)set_non_homogeneus,
                           NULL);

    g_signal_connect_after (window->priv->toolbar, "show",
                            G_CALLBACK (toolbar_visibility_changed),
                            window);
    g_signal_connect_after (window->priv->toolbar, "hide",
                            G_CALLBACK (toolbar_visibility_changed),
                            window);
}

static void
documents_list_menu_activate (GtkToggleAction *action,
                              PlumaWindow     *window)
{
    gint n;

    if (gtk_toggle_action_get_active (action) == FALSE)
        return;

    n = gtk_radio_action_get_current_value (GTK_RADIO_ACTION (action));
    gtk_notebook_set_current_page (GTK_NOTEBOOK (window->priv->notebook), n);
}

static gchar *
get_menu_tip_for_tab (PlumaTab *tab)
{
    PlumaDocument *doc;
    gchar *uri;
    gchar *ruri;
    gchar *tip;

    doc = pluma_tab_get_document (tab);

    uri = pluma_document_get_uri_for_display (doc);
    ruri = pluma_utils_replace_home_dir_with_tilde (uri);
    g_free (uri);

    /* Translators: %s is a URI */
    tip =  g_strdup_printf (_("Activate '%s'"), ruri);
    g_free (ruri);

    return tip;
}

static void
update_documents_list_menu (PlumaWindow *window)
{
    PlumaWindowPrivate *p = window->priv;
    GList *actions, *l;
    gint n, i;
    guint id;
    GSList *group = NULL;

    pluma_debug (DEBUG_WINDOW);

    g_return_if_fail (p->documents_list_action_group != NULL);

    if (p->documents_list_menu_ui_id != 0)
        gtk_ui_manager_remove_ui (p->manager,
                                  p->documents_list_menu_ui_id);

    actions = gtk_action_group_list_actions (p->documents_list_action_group);
    for (l = actions; l != NULL; l = l->next)
    {
        g_signal_handlers_disconnect_by_func (GTK_ACTION (l->data),
                                              G_CALLBACK (documents_list_menu_activate),
                                              window);
         gtk_action_group_remove_action (p->documents_list_action_group,
                                         GTK_ACTION (l->data));
    }
    g_list_free (actions);

    n = gtk_notebook_get_n_pages (GTK_NOTEBOOK (p->notebook));

    id = (n > 0) ? gtk_ui_manager_new_merge_id (p->manager) : 0;

    for (i = 0; i < n; i++)
    {
        GtkWidget *tab;
        GtkRadioAction *action;
        gchar *action_name;
        gchar *tab_name;
        gchar *name;
        gchar *tip;
        gchar *accel;

        tab = gtk_notebook_get_nth_page (GTK_NOTEBOOK (p->notebook), i);

        /* NOTE: the action is associated to the position of the tab in
         * the notebook not to the tab itself! This is needed to work
         * around the gtk+ bug #170727: gtk leaves around the accels
         * of the action. Since the accel depends on the tab position
         * the problem is worked around, action with the same name always
         * get the same accel.
         */
        action_name = g_strdup_printf ("Tab_%d", i);
        tab_name = _pluma_tab_get_name (PLUMA_TAB (tab));
        name = pluma_utils_escape_underscores (tab_name, -1);
        tip =  get_menu_tip_for_tab (PLUMA_TAB (tab));

        /* alt + 1, 2, 3... 0 to switch to the first ten tabs */
        accel = (i < 10) ? g_strdup_printf ("<alt>%d", (i + 1) % 10) : NULL;

        action = gtk_radio_action_new (action_name,
                                       name,
                                       tip,
                                       NULL,
                                       i);

        if (group != NULL)
            gtk_radio_action_set_group (action, group);

        /* note that group changes each time we add an action, so it must be updated */
        group = gtk_radio_action_get_group (action);

        gtk_action_group_add_action_with_accel (p->documents_list_action_group,
                                                GTK_ACTION (action),
                                                accel);

        g_signal_connect (action,
                          "activate",
                          G_CALLBACK (documents_list_menu_activate),
                          window);

        gtk_ui_manager_add_ui (p->manager,
                               id,
                               "/MenuBar/DocumentsMenu/DocumentsListPlaceholder",
                               action_name, action_name,
                               GTK_UI_MANAGER_MENUITEM,
                               FALSE);

        if (PLUMA_TAB (tab) == p->active_tab)
            gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), TRUE);

        g_object_unref (action);

        g_free (action_name);
        g_free (tab_name);
        g_free (name);
        g_free (tip);
        g_free (accel);
    }

    p->documents_list_menu_ui_id = id;
}

/* Returns TRUE if status bar is visible */
static gboolean
set_statusbar_style (PlumaWindow *window,
                     PlumaWindow *origin)
{
    GtkAction *action;
    gboolean visible;

    if (origin == NULL)
        visible = g_settings_get_boolean (window->priv->editor_settings,
                                          PLUMA_SETTINGS_STATUSBAR_VISIBLE);
    else
        visible = gtk_widget_get_visible (origin->priv->statusbar);

    if (visible)
        gtk_widget_show (window->priv->statusbar);
    else
        gtk_widget_hide (window->priv->statusbar);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewStatusbar");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);

    return visible;
}

static void
statusbar_visibility_changed (GtkWidget   *statusbar,
                              PlumaWindow *window)
{
    gboolean visible;
    GtkAction *action;

    visible = gtk_widget_get_visible (statusbar);

    g_settings_set_boolean (window->priv->editor_settings,
                            PLUMA_SETTINGS_STATUSBAR_VISIBLE, visible);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewStatusbar");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);
}

static void
tab_width_combo_changed (PlumaStatusComboBox *combo,
                         GtkMenuItem     *item,
                         PlumaWindow     *window)
{
    PlumaView *view;
    guint width_data = 0;

    view = pluma_window_get_active_view (window);

    if (!view)
        return;

    width_data = GPOINTER_TO_INT (g_object_get_data (G_OBJECT (item), TAB_WIDTH_DATA));

    if (width_data == 0)
        return;

    g_signal_handler_block (view, window->priv->tab_width_id);
    gtk_source_view_set_tab_width (GTK_SOURCE_VIEW (view), width_data);
    g_signal_handler_unblock (view, window->priv->tab_width_id);
}

static void
use_spaces_toggled (GtkCheckMenuItem *item,
                    PlumaWindow      *window)
{
    PlumaView *view;

    view = pluma_window_get_active_view (window);

    g_signal_handler_block (view, window->priv->spaces_instead_of_tabs_id);
    gtk_source_view_set_insert_spaces_instead_of_tabs (GTK_SOURCE_VIEW (view),
                                                       gtk_check_menu_item_get_active (item));
    g_signal_handler_unblock (view, window->priv->spaces_instead_of_tabs_id);
}

static void
language_combo_changed (PlumaStatusComboBox *combo,
                        GtkMenuItem     *item,
                        PlumaWindow     *window)
{
    PlumaDocument *doc;
    GtkSourceLanguage *language;

    doc = pluma_window_get_active_document (window);

    if (!doc)
        return;

    language = GTK_SOURCE_LANGUAGE (g_object_get_data (G_OBJECT (item), LANGUAGE_DATA));

    g_signal_handler_block (doc, window->priv->language_changed_id);
    pluma_document_set_language (doc, language);
    g_signal_handler_unblock (doc, window->priv->language_changed_id);
}

typedef struct
{
    const gchar *label;
    guint width;
} TabWidthDefinition;

static void
fill_tab_width_combo (PlumaWindow *window)
{
    static TabWidthDefinition defs[] = {
        {"2", 2},
        {"4", 4},
        {"8", 8},
        {"", 0}, /* custom size */
        {NULL, 0}
    };

    PlumaStatusComboBox *combo = PLUMA_STATUS_COMBO_BOX (window->priv->tab_width_combo);
    guint i = 0;
    GtkWidget *item;

    while (defs[i].label != NULL)
    {
        item = gtk_menu_item_new_with_label (defs[i].label);
        g_object_set_data (G_OBJECT (item), TAB_WIDTH_DATA, GINT_TO_POINTER (defs[i].width));

        pluma_status_combo_box_add_item (combo,
                                         GTK_MENU_ITEM (item),
                                         defs[i].label);

        if (defs[i].width != 0)
            gtk_widget_show (item);

        ++i;
    }

    item = gtk_separator_menu_item_new ();
    pluma_status_combo_box_add_item (combo, GTK_MENU_ITEM (item), NULL);
    gtk_widget_show (item);

    item = gtk_check_menu_item_new_with_label (_("Use Spaces"));
    pluma_status_combo_box_add_item (combo, GTK_MENU_ITEM (item), NULL);
    gtk_widget_show (item);

    g_signal_connect (item,
                      "toggled",
                      G_CALLBACK (use_spaces_toggled),
                      window);
}

static void
fill_language_combo (PlumaWindow *window)
{
    GtkSourceLanguageManager *manager;
    GSList *languages;
    GSList *item;
    GtkWidget *menu_item;
    const gchar *name;

    manager = pluma_get_language_manager ();
    languages = pluma_language_manager_list_languages_sorted (manager, FALSE);

    name = _("Plain Text");
    menu_item = gtk_menu_item_new_with_label (name);
    gtk_widget_show (menu_item);

    g_object_set_data (G_OBJECT (menu_item), LANGUAGE_DATA, NULL);
    pluma_status_combo_box_add_item (PLUMA_STATUS_COMBO_BOX (window->priv->language_combo),
                                     GTK_MENU_ITEM (menu_item),
                                     name);

    for (item = languages; item; item = item->next)
    {
        GtkSourceLanguage *lang = GTK_SOURCE_LANGUAGE (item->data);

        name = gtk_source_language_get_name (lang);
        menu_item = gtk_menu_item_new_with_label (name);
        gtk_widget_show (menu_item);

        g_object_set_data_full (G_OBJECT (menu_item),
                                LANGUAGE_DATA,
                                g_object_ref (lang),
                                (GDestroyNotify)g_object_unref);

        pluma_status_combo_box_add_item (PLUMA_STATUS_COMBO_BOX (window->priv->language_combo),
                                         GTK_MENU_ITEM (menu_item),
                                         name);
    }

    g_slist_free (languages);
}

static void
create_statusbar (PlumaWindow *window,
                  GtkWidget   *main_box)
{
    pluma_debug (DEBUG_WINDOW);

    window->priv->statusbar = pluma_statusbar_new ();

    window->priv->generic_message_cid = gtk_statusbar_get_context_id
        (GTK_STATUSBAR (window->priv->statusbar), "generic_message");
    window->priv->tip_message_cid = gtk_statusbar_get_context_id
        (GTK_STATUSBAR (window->priv->statusbar), "tip_message");

    gtk_box_pack_end (GTK_BOX (main_box),
                      window->priv->statusbar,
                      FALSE,
                      TRUE,
                      0);

    window->priv->tab_width_combo = pluma_status_combo_box_new (_("Tab Width"));
    gtk_widget_show (window->priv->tab_width_combo);
    gtk_box_pack_end (GTK_BOX (window->priv->statusbar),
                      window->priv->tab_width_combo,
                      FALSE,
                      TRUE,
                      0);

    fill_tab_width_combo (window);

    g_signal_connect (window->priv->tab_width_combo, "changed",
                      G_CALLBACK (tab_width_combo_changed),
                      window);

    window->priv->language_combo = pluma_status_combo_box_new (NULL);
    gtk_widget_show (window->priv->language_combo);
    gtk_box_pack_end (GTK_BOX (window->priv->statusbar),
                      window->priv->language_combo,
                      FALSE,
                      TRUE,
                      0);

    fill_language_combo (window);

    g_signal_connect (window->priv->language_combo, "changed",
                      G_CALLBACK (language_combo_changed),
                      window);

    g_signal_connect_after (window->priv->statusbar, "show",
                            G_CALLBACK (statusbar_visibility_changed),
                            window);
    g_signal_connect_after (window->priv->statusbar, "hide",
                            G_CALLBACK (statusbar_visibility_changed),
                            window);

    set_statusbar_style (window, NULL);
}

static PlumaWindow *
clone_window (PlumaWindow *origin)
{
    PlumaWindow *window;
    GdkScreen *screen;
    PlumaApp  *app;
    gint panel_page;

    pluma_debug (DEBUG_WINDOW);

    app = pluma_app_get_default ();

    screen = gtk_window_get_screen (GTK_WINDOW (origin));
    window = pluma_app_create_window (app, screen);

    gtk_window_set_default_size (GTK_WINDOW (window),
                                 origin->priv->width,
                                 origin->priv->height);

    if ((origin->priv->window_state & GDK_WINDOW_STATE_MAXIMIZED) != 0)
        gtk_window_maximize (GTK_WINDOW (window));
    else
        gtk_window_unmaximize (GTK_WINDOW (window));

    if ((origin->priv->window_state & GDK_WINDOW_STATE_STICKY ) != 0)
        gtk_window_stick (GTK_WINDOW (window));
    else
        gtk_window_unstick (GTK_WINDOW (window));

    /* set the panes size, the paned position will be set when
     * they are mapped */
    window->priv->side_panel_size = origin->priv->side_panel_size;
    window->priv->bottom_panel_size = origin->priv->bottom_panel_size;

    panel_page = _pluma_panel_get_active_item_id (PLUMA_PANEL (origin->priv->side_panel));
    _pluma_panel_set_active_item_by_id (PLUMA_PANEL (window->priv->side_panel), panel_page);

    panel_page = _pluma_panel_get_active_item_id (PLUMA_PANEL (origin->priv->bottom_panel));
    _pluma_panel_set_active_item_by_id (PLUMA_PANEL (window->priv->bottom_panel), panel_page);

    if (gtk_widget_get_visible (origin->priv->side_panel))
        gtk_widget_show (window->priv->side_panel);
    else
        gtk_widget_hide (window->priv->side_panel);

    if (gtk_widget_get_visible (origin->priv->bottom_panel))
        gtk_widget_show (window->priv->bottom_panel);
    else
        gtk_widget_hide (window->priv->bottom_panel);

    set_statusbar_style (window, origin);
    set_toolbar_style (window, origin);

    return window;
}

static void
update_cursor_position_statusbar (GtkTextBuffer *buffer,
                                  PlumaWindow   *window)
{
    gint row, col;
    GtkTextIter iter;
    PlumaView *view;

    pluma_debug (DEBUG_WINDOW);

     if (buffer != GTK_TEXT_BUFFER (pluma_window_get_active_document (window)))
         return;

     view = pluma_window_get_active_view (window);

    gtk_text_buffer_get_iter_at_mark (buffer,
                                      &iter,
                                      gtk_text_buffer_get_insert (buffer));

    row = gtk_text_iter_get_line (&iter);

    col = gtk_source_view_get_visual_column (GTK_SOURCE_VIEW(view), &iter);

    pluma_statusbar_set_cursor_position (PLUMA_STATUSBAR (window->priv->statusbar),
                                         row + 1,
                                         col + 1);
}

static void
update_overwrite_mode_statusbar (GtkTextView *view,
                                 PlumaWindow *window)
{
    if (view != GTK_TEXT_VIEW (pluma_window_get_active_view (window)))
        return;

    /* Note that we have to use !gtk_text_view_get_overwrite since we
       are in the in the signal handler of "toggle overwrite" that is
       G_SIGNAL_RUN_LAST
    */
    pluma_statusbar_set_overwrite (PLUMA_STATUSBAR (window->priv->statusbar),
                                   !gtk_text_view_get_overwrite (view));
}

#define MAX_TITLE_LENGTH 100

static void
set_title (PlumaWindow *window)
{
    PlumaDocument *doc = NULL;
    gchar *name;
    gchar *dirname = NULL;
    gchar *title = NULL;
    gint len;
    GtkAction *action;

    if (window->priv->active_tab == NULL)
    {
        gtk_window_set_title (GTK_WINDOW (window), "Pluma");
        return;
    }

    doc = pluma_tab_get_document (window->priv->active_tab);
    g_return_if_fail (doc != NULL);

    name = pluma_document_get_short_name_for_display (doc);

    len = g_utf8_strlen (name, -1);

    /* if the name is awfully long, truncate it and be done with it,
     * otherwise also show the directory (ellipsized if needed)
     */
    if (len > MAX_TITLE_LENGTH)
    {
        gchar *tmp;

        tmp = pluma_utils_str_middle_truncate (name, MAX_TITLE_LENGTH);
        g_free (name);
        name = tmp;
    }
    else
    {
        GFile *file;

        file = pluma_document_get_location (doc);
        if (file != NULL)
        {
            gchar *str;

            str = pluma_utils_location_get_dirname_for_display (file);
            g_object_unref (file);

            /* use the remaining space for the dir, but use a min of 20 chars
             * so that we do not end up with a dirname like "(a...b)".
             * This means that in the worst case when the filename is long 99
             * we have a title long 99 + 20, but I think it's a rare enough
             * case to be acceptable. It's justa darn title afterall :)
             */
            dirname = pluma_utils_str_middle_truncate (str, MAX (20, MAX_TITLE_LENGTH - len));
            g_free (str);
        }
    }

    if (gtk_text_buffer_get_modified (GTK_TEXT_BUFFER (doc)))
    {
        gchar *tmp_name;

        tmp_name = g_strdup_printf ("*%s", name);
        g_free (name);

        name = tmp_name;
        cansave = TRUE;
    }
    else
        cansave = FALSE;

    if (pluma_document_get_readonly (doc))
    {
        if (dirname != NULL)
            title = g_strdup_printf ("%s [%s] (%s) - Pluma",
                                     name,
                                     _("Read-Only"),
                                     dirname);
        else
            title = g_strdup_printf ("%s [%s] - Pluma",
                                     name,
                                     _("Read-Only"));
    }
    else
    {
        if (dirname != NULL)
            title = g_strdup_printf ("%s (%s) - Pluma",
                                     name,
                                     dirname);
        else
            title = g_strdup_printf ("%s - Pluma",
                                     name);
    }

    action = gtk_action_group_get_action (window->priv->action_group, "FileSave");
    gtk_action_set_sensitive (action, cansave);

    gtk_window_set_title (GTK_WINDOW (window), title);

    g_free (dirname);
    g_free (name);
    g_free (title);
}

#undef MAX_TITLE_LENGTH

static void
set_tab_width_item_blocked (PlumaWindow *window,
                            GtkMenuItem *item)
{
    g_signal_handlers_block_by_func (window->priv->tab_width_combo,
                                     tab_width_combo_changed,
                                     window);

    pluma_status_combo_box_set_item (PLUMA_STATUS_COMBO_BOX (window->priv->tab_width_combo),
                                     item);

    g_signal_handlers_unblock_by_func (window->priv->tab_width_combo,
                                       tab_width_combo_changed,
                                       window);
}

static void
spaces_instead_of_tabs_changed (GObject     *object,
                                GParamSpec  *pspec,
                                PlumaWindow *window)
{
    PlumaView *view = PLUMA_VIEW (object);
    gboolean active = gtk_source_view_get_insert_spaces_instead_of_tabs (GTK_SOURCE_VIEW (view));
    GList *children = pluma_status_combo_box_get_items (PLUMA_STATUS_COMBO_BOX (window->priv->tab_width_combo));
    GtkCheckMenuItem *item;

    item = GTK_CHECK_MENU_ITEM (g_list_last (children)->data);

    gtk_check_menu_item_set_active (item, active);

    g_list_free (children);
}

static void
tab_width_changed (GObject     *object,
                   GParamSpec  *pspec,
                   PlumaWindow *window)
{
    GList *items;
    GList *item;
    PlumaStatusComboBox *combo = PLUMA_STATUS_COMBO_BOX (window->priv->tab_width_combo);
    guint new_tab_width;
    gboolean found = FALSE;

    items = pluma_status_combo_box_get_items (combo);

    new_tab_width = gtk_source_view_get_tab_width (GTK_SOURCE_VIEW (object));

    for (item = items; item; item = item->next)
    {
        guint tab_width = GPOINTER_TO_INT (g_object_get_data (G_OBJECT (item->data), TAB_WIDTH_DATA));

        if (tab_width == new_tab_width)
        {
            set_tab_width_item_blocked (window, GTK_MENU_ITEM (item->data));
            found = TRUE;
        }

        if (GTK_IS_SEPARATOR_MENU_ITEM (item->next->data))
        {
            if (!found)
            {
                /* Set for the last item the custom thing */
                gchar *text;

                text = g_strdup_printf ("%u", new_tab_width);
                pluma_status_combo_box_set_item_text (combo,
                                                      GTK_MENU_ITEM (item->data),
                                                      text);

                gtk_label_set_text (GTK_LABEL (gtk_bin_get_child (GTK_BIN (item->data))),
                                    text);

                set_tab_width_item_blocked (window, GTK_MENU_ITEM (item->data));
                gtk_widget_show (GTK_WIDGET (item->data));
            }
            else
            {
                gtk_widget_hide (GTK_WIDGET (item->data));
            }

            break;
        }
    }

    g_list_free (items);
}

static void
language_changed (GObject     *object,
                  GParamSpec  *pspec,
                  PlumaWindow *window)
{
    GList *items;
    GList *item;
    PlumaStatusComboBox *combo = PLUMA_STATUS_COMBO_BOX (window->priv->language_combo);
    GtkSourceLanguage *new_language;
    const gchar *new_id;

    items = pluma_status_combo_box_get_items (combo);

    new_language = gtk_source_buffer_get_language (GTK_SOURCE_BUFFER (object));

    if (new_language)
        new_id = gtk_source_language_get_id (new_language);
    else
        new_id = NULL;

    for (item = items; item; item = item->next)
    {
        GtkSourceLanguage *lang = g_object_get_data (G_OBJECT (item->data), LANGUAGE_DATA);

        if ((new_id == NULL && lang == NULL) ||
            (new_id != NULL && lang != NULL && strcmp (gtk_source_language_get_id (lang), new_id) == 0))
        {
            g_signal_handlers_block_by_func (window->priv->language_combo,
                                             language_combo_changed,
                                             window);

            pluma_status_combo_box_set_item (PLUMA_STATUS_COMBO_BOX (window->priv->language_combo),
                                             GTK_MENU_ITEM (item->data));

            g_signal_handlers_unblock_by_func (window->priv->language_combo,
                                               language_combo_changed,
                                               window);
        }
    }

    g_list_free (items);
}

static void
notebook_switch_page (GtkNotebook     *book,
                      GtkWidget       *pg,
                      gint             page_num,
                      PlumaWindow     *window)
{
    PlumaView *view;
    PlumaTab *tab;
    GtkAction *action;
    gchar *action_name;

    /* CHECK: I don't know why but it seems notebook_switch_page is called
    two times every time the user change the active tab */

    tab = PLUMA_TAB (gtk_notebook_get_nth_page (book, page_num));
    if (tab == window->priv->active_tab)
        return;

    if (window->priv->active_tab)
    {
#if GLIB_CHECK_VERSION(2,62,0)
        PlumaView *active_tab_view;

        active_tab_view = pluma_tab_get_view (window->priv->active_tab);
        g_clear_signal_handler (&window->priv->tab_width_id,
                                active_tab_view);
        g_clear_signal_handler (&window->priv->spaces_instead_of_tabs_id,
                                active_tab_view);
#else
        if (window->priv->tab_width_id)
        {
            g_signal_handler_disconnect (pluma_tab_get_view (window->priv->active_tab),
                                         window->priv->tab_width_id);

            window->priv->tab_width_id = 0;
        }

        if (window->priv->spaces_instead_of_tabs_id)
        {
            g_signal_handler_disconnect (pluma_tab_get_view (window->priv->active_tab),
                                         window->priv->spaces_instead_of_tabs_id);

            window->priv->spaces_instead_of_tabs_id = 0;
        }
#endif
    }

    /* set the active tab */
    window->priv->active_tab = tab;

    set_title (window);
    set_sensitivity_according_to_tab (window, tab);

    /* activate the right item in the documents menu */
    action_name = g_strdup_printf ("Tab_%d", page_num);
    action = gtk_action_group_get_action (window->priv->documents_list_action_group,
                                          action_name);

    /* sometimes the action doesn't exist yet, and the proper action
     * is set active during the documents list menu creation
     * CHECK: would it be nicer if active_tab was a property and we monitored the notify signal?
     */
    if (action != NULL)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), TRUE);

    g_free (action_name);

    /* update the syntax menu */
    update_languages_menu (window);

    view = pluma_tab_get_view (tab);

    /* sync the statusbar */
    update_cursor_position_statusbar (GTK_TEXT_BUFFER (pluma_tab_get_document (tab)),
                                      window);
    pluma_statusbar_set_overwrite (PLUMA_STATUSBAR (window->priv->statusbar),
                                   gtk_text_view_get_overwrite (GTK_TEXT_VIEW (view)));

    gtk_widget_show (window->priv->tab_width_combo);
    gtk_widget_show (window->priv->language_combo);

    window->priv->tab_width_id = g_signal_connect (view,
                                                   "notify::tab-width",
                                                   G_CALLBACK (tab_width_changed),
                                                   window);
    window->priv->spaces_instead_of_tabs_id = g_signal_connect (view,
                                                                "notify::insert-spaces-instead-of-tabs",
                                                                G_CALLBACK (spaces_instead_of_tabs_changed),
                                                                window);

    window->priv->language_changed_id = g_signal_connect (pluma_tab_get_document (tab),
                                                          "notify::language",
                                                          G_CALLBACK (language_changed),
                                                          window);

    /* call it for the first time */
    tab_width_changed (G_OBJECT (view), NULL, window);
    spaces_instead_of_tabs_changed (G_OBJECT (view), NULL, window);
    language_changed (G_OBJECT (pluma_tab_get_document (tab)), NULL, window);

    g_signal_emit (G_OBJECT (window),
                   signals[ACTIVE_TAB_CHANGED],
                   0,
                   window->priv->active_tab);
}

static void
set_sensitivity_according_to_window_state (PlumaWindow *window)
{
    GtkAction *action;
    PlumaLockdownMask lockdown;

    lockdown = pluma_app_get_lockdown (pluma_app_get_default ());

    /* We disable File->Quit/SaveAll/CloseAll while printing to avoid to have two
       operations (save and print/print preview) that uses the message area at
       the same time (may be we can remove this limitation in the future) */
    /* We disable File->Quit/CloseAll if state is saving since saving cannot be
       cancelled (may be we can remove this limitation in the future) */
    gtk_action_group_set_sensitive (window->priv->quit_action_group,
                                    !(window->priv->state & PLUMA_WINDOW_STATE_SAVING) &&
                                    !(window->priv->state & PLUMA_WINDOW_STATE_PRINTING));

    gtk_action_group_set_sensitive (window->priv->close_action_group,
                                    !(window->priv->state & PLUMA_WINDOW_STATE_SAVING) &&
                                    !(window->priv->state & PLUMA_WINDOW_STATE_PRINTING));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "FileCloseAll");
    gtk_action_set_sensitive (action,
                              !(window->priv->state & PLUMA_WINDOW_STATE_SAVING) &&
                              !(window->priv->state & PLUMA_WINDOW_STATE_PRINTING));

    action = gtk_action_group_get_action (window->priv->action_group,
                          "FileSaveAll");
    gtk_action_set_sensitive (action,
                              !(window->priv->state & PLUMA_WINDOW_STATE_PRINTING) &&
                              !(lockdown & PLUMA_LOCKDOWN_SAVE_TO_DISK));

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "FileNew");
    gtk_action_set_sensitive (action,
                              !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "FileOpen");
    gtk_action_set_sensitive (action,
                              !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    gtk_action_group_set_sensitive (window->priv->recents_action_group,
                                    !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    pluma_notebook_set_close_buttons_sensitive (PLUMA_NOTEBOOK (window->priv->notebook),
                                                !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    pluma_notebook_set_tab_drag_and_drop_enabled (PLUMA_NOTEBOOK (window->priv->notebook),
                                                  !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    if ((window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION) != 0)
    {
        /* TODO: If we really care, Find could be active
         * when in SAVING_SESSION state */

        if (gtk_action_group_get_sensitive (window->priv->action_group))
            gtk_action_group_set_sensitive (window->priv->action_group, FALSE);

        if (gtk_action_group_get_sensitive (window->priv->quit_action_group))
            gtk_action_group_set_sensitive (window->priv->quit_action_group, FALSE);

        if (gtk_action_group_get_sensitive (window->priv->close_action_group))
            gtk_action_group_set_sensitive (window->priv->close_action_group, FALSE);
    }
    else
    {
        if (!gtk_action_group_get_sensitive (window->priv->action_group))
            gtk_action_group_set_sensitive (window->priv->action_group, window->priv->num_tabs > 0);

        if (!gtk_action_group_get_sensitive (window->priv->quit_action_group))
            gtk_action_group_set_sensitive (window->priv->quit_action_group, window->priv->num_tabs > 0);

        if (!gtk_action_group_get_sensitive (window->priv->close_action_group))
            gtk_action_group_set_sensitive (window->priv->close_action_group, window->priv->num_tabs > 0);
    }
}

static void
update_tab_autosave (GtkWidget *widget,
                     gpointer   data)
{
    PlumaTab *tab = PLUMA_TAB (widget);
    gboolean *enabled = (gboolean *) data;

    pluma_tab_set_auto_save_enabled (tab, *enabled);
}

void
_pluma_window_set_lockdown (PlumaWindow       *window,
                            PlumaLockdownMask  lockdown)
{
    PlumaTab *tab;
    GtkAction *action;
    gboolean autosave;

    /* start/stop autosave in each existing tab */
    autosave = g_settings_get_boolean (window->priv->editor_settings, PLUMA_SETTINGS_AUTO_SAVE);
    gtk_container_foreach (GTK_CONTAINER (window->priv->notebook),
                           update_tab_autosave,
                           &autosave);

    /* update menues wrt the current active tab */
    tab = pluma_window_get_active_tab (window);

    set_sensitivity_according_to_tab (window, tab);

    action = gtk_action_group_get_action (window->priv->action_group,
                                         "FileSaveAll");
    gtk_action_set_sensitive (action,
                              !(window->priv->state & PLUMA_WINDOW_STATE_PRINTING) &&
                              !(lockdown & PLUMA_LOCKDOWN_SAVE_TO_DISK));

}

static void
analyze_tab_state (PlumaTab    *tab,
                   PlumaWindow *window)
{
    PlumaTabState ts;

    ts = pluma_tab_get_state (tab);

    switch (ts)
    {
        case PLUMA_TAB_STATE_LOADING:
        case PLUMA_TAB_STATE_REVERTING:
            window->priv->state |= PLUMA_WINDOW_STATE_LOADING;
            break;

        case PLUMA_TAB_STATE_SAVING:
            window->priv->state |= PLUMA_WINDOW_STATE_SAVING;
            break;

        case PLUMA_TAB_STATE_PRINTING:
        case PLUMA_TAB_STATE_PRINT_PREVIEWING:
            window->priv->state |= PLUMA_WINDOW_STATE_PRINTING;
            break;

        case PLUMA_TAB_STATE_LOADING_ERROR:
        case PLUMA_TAB_STATE_REVERTING_ERROR:
        case PLUMA_TAB_STATE_SAVING_ERROR:
        case PLUMA_TAB_STATE_GENERIC_ERROR:
            window->priv->state |= PLUMA_WINDOW_STATE_ERROR;
            ++window->priv->num_tabs_with_error;
        default:
            /* NOP */
            break;
    }
}

static void
update_window_state (PlumaWindow *window)
{
    PlumaWindowState old_ws;
    gint old_num_of_errors;

    pluma_debug_message (DEBUG_WINDOW, "Old state: %x", window->priv->state);

    old_ws = window->priv->state;
    old_num_of_errors = window->priv->num_tabs_with_error;

    window->priv->state = old_ws & PLUMA_WINDOW_STATE_SAVING_SESSION;

    window->priv->num_tabs_with_error = 0;

    gtk_container_foreach (GTK_CONTAINER (window->priv->notebook),
                           (GtkCallback)analyze_tab_state,
                           window);

    pluma_debug_message (DEBUG_WINDOW, "New state: %x", window->priv->state);

    if (old_ws != window->priv->state)
    {
        set_sensitivity_according_to_window_state (window);

        pluma_statusbar_set_window_state (PLUMA_STATUSBAR (window->priv->statusbar),
                                          window->priv->state,
                                          window->priv->num_tabs_with_error);

        g_object_notify (G_OBJECT (window), "state");
    }
    else if (old_num_of_errors != window->priv->num_tabs_with_error)
    {
        pluma_statusbar_set_window_state (PLUMA_STATUSBAR (window->priv->statusbar),
                                          window->priv->state,
                                          window->priv->num_tabs_with_error);
    }
}

static void
sync_state (PlumaTab    *tab,
            GParamSpec  *pspec,
            PlumaWindow *window)
{
    pluma_debug (DEBUG_WINDOW);

    update_window_state (window);

    if (tab != window->priv->active_tab)
        return;

    set_sensitivity_according_to_tab (window, tab);

    g_signal_emit (G_OBJECT (window), signals[ACTIVE_TAB_STATE_CHANGED], 0);
}

static void
sync_name (PlumaTab    *tab,
           GParamSpec  *pspec,
           PlumaWindow *window)
{
    GtkAction *action;
    gchar *action_name;
    gchar *tab_name;
    gchar *escaped_name;
    gchar *tip;
    gint n;
    PlumaDocument *doc;

    if (tab == window->priv->active_tab)
    {
        set_title (window);

        doc = pluma_tab_get_document (tab);
        action = gtk_action_group_get_action (window->priv->action_group,
                                              "FileRevert");
        gtk_action_set_sensitive (action, !pluma_document_is_untitled (doc));
    }

    /* sync the item in the documents list menu */
    n = gtk_notebook_page_num (GTK_NOTEBOOK (window->priv->notebook), GTK_WIDGET (tab));

    action_name = g_strdup_printf ("Tab_%d", n);
    action = gtk_action_group_get_action (window->priv->documents_list_action_group,
                                          action_name);
    g_free (action_name);
    g_return_if_fail (action != NULL);

    tab_name = _pluma_tab_get_name (tab);
    escaped_name = pluma_utils_escape_underscores (tab_name, -1);
    tip =  get_menu_tip_for_tab (tab);

    g_object_set (action, "label", escaped_name, NULL);
    g_object_set (action, "tooltip", tip, NULL);

    g_free (tab_name);
    g_free (escaped_name);
    g_free (tip);

    peas_extension_set_call (window->priv->extensions, "update_state");
}

static PlumaWindow *
get_drop_window (GtkWidget *widget)
{
    GtkWidget *target_window;

    target_window = gtk_widget_get_toplevel (widget);
    g_return_val_if_fail (PLUMA_IS_WINDOW (target_window), NULL);

    if ((PLUMA_WINDOW(target_window)->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION) != 0)
        return NULL;

    return PLUMA_WINDOW (target_window);
}

static void
load_uris_from_drop (PlumaWindow  *window,
                     gchar       **uri_list)
{
    GSList *uris = NULL;
    gint i;

    if (uri_list == NULL)
        return;

    for (i = 0; uri_list[i] != NULL; ++i)
    {
        uris = g_slist_prepend (uris, uri_list[i]);
    }

    uris = g_slist_reverse (uris);
    pluma_commands_load_uris (window,
                              uris,
                              NULL,
                              0);

    g_slist_free (uris);
}

/* Handle drops on the PlumaWindow */
static void
drag_data_received_cb (GtkWidget    *widget,
                       GdkDragContext   *context,
                       gint          x,
                       gint          y,
                       GtkSelectionData *selection_data,
                       guint         info,
                       guint         timestamp,
                       gpointer      data)
{
    PlumaWindow *window;
    gchar **uri_list;

    window = get_drop_window (widget);

    if (window == NULL)
        return;

    if (info == TARGET_URI_LIST)
    {
        uri_list = pluma_utils_drop_get_uris(selection_data);
        load_uris_from_drop (window, uri_list);
        g_strfreev (uri_list);
    }
}

/* Handle drops on the PlumaView */
static void
drop_uris_cb (GtkWidget    *widget,
              gchar       **uri_list)
{
    PlumaWindow *window;

    window = get_drop_window (widget);

    if (window == NULL)
        return;

    load_uris_from_drop (window, uri_list);
}

static void
fullscreen_controls_show (PlumaWindow *window)
{
    GdkScreen *screen;
    GdkDisplay *display;
    GdkRectangle fs_rect;
    gint w, h;

    screen = gtk_window_get_screen (GTK_WINDOW (window));
    display = gdk_screen_get_display (screen);

    gdk_monitor_get_geometry (gdk_display_get_monitor_at_window (display,
                              gtk_widget_get_window (GTK_WIDGET (window))),
                              &fs_rect);

    gtk_window_get_size (GTK_WINDOW (window->priv->fullscreen_controls), &w, &h);

    gtk_window_resize (GTK_WINDOW (window->priv->fullscreen_controls),
                       fs_rect.width, h);

    gtk_window_move (GTK_WINDOW (window->priv->fullscreen_controls),
                     fs_rect.x, fs_rect.y - h + 1);

    gtk_widget_show_all (window->priv->fullscreen_controls);
}

static gboolean
run_fullscreen_animation (gpointer data)
{
    PlumaWindow *window = PLUMA_WINDOW (data);
    GdkScreen *screen;
    GdkDisplay *display;
    GdkRectangle fs_rect;
    gint x, y;

    screen = gtk_window_get_screen (GTK_WINDOW (window));
    display = gdk_screen_get_display (screen);

    gdk_monitor_get_geometry (gdk_display_get_monitor_at_window (display,
                              gtk_widget_get_window (GTK_WIDGET (window))),
                              &fs_rect);

    gtk_window_get_position (GTK_WINDOW (window->priv->fullscreen_controls),
                             &x,
                             &y);

    if (window->priv->fullscreen_animation_enter)
    {
        if (y == fs_rect.y)
        {
            window->priv->fullscreen_animation_timeout_id = 0;
            return FALSE;
        }
        else
        {
            gtk_window_move (GTK_WINDOW (window->priv->fullscreen_controls),
                             x, y + 1);
            return TRUE;
        }
    }
    else
    {
        gint w, h;

        gtk_window_get_size (GTK_WINDOW (window->priv->fullscreen_controls),
                             &w, &h);

        if (y == fs_rect.y - h + 1)
        {
            window->priv->fullscreen_animation_timeout_id = 0;
            return FALSE;
        }
        else
        {
            gtk_window_move (GTK_WINDOW (window->priv->fullscreen_controls),
                             x, y - 1);
            return TRUE;
        }
    }
}

static void
show_hide_fullscreen_toolbar (PlumaWindow *window,
                              gboolean     show,
                              gint     height)
{
    GtkSettings *settings;
    gboolean enable_animations;

    settings = gtk_widget_get_settings (GTK_WIDGET (window));
    g_object_get (G_OBJECT (settings),
                  "gtk-enable-animations",
                  &enable_animations,
                  NULL);

    if (enable_animations)
    {
        window->priv->fullscreen_animation_enter = show;

        if (window->priv->fullscreen_animation_timeout_id == 0)
        {
            window->priv->fullscreen_animation_timeout_id =
                g_timeout_add (FULLSCREEN_ANIMATION_SPEED,
                               (GSourceFunc) run_fullscreen_animation,
                               window);
        }
    }
    else
    {
        GdkRectangle fs_rect;
        GdkScreen *screen;
        GdkDisplay *display;

        screen = gtk_window_get_screen (GTK_WINDOW (window));
        display = gdk_screen_get_display (screen);

        gdk_monitor_get_geometry (gdk_display_get_monitor_at_window (display,
                                  gtk_widget_get_window (GTK_WIDGET (window))),
                                  &fs_rect);

        if (show)
            gtk_window_move (GTK_WINDOW (window->priv->fullscreen_controls),
                             fs_rect.x, fs_rect.y);
        else
            gtk_window_move (GTK_WINDOW (window->priv->fullscreen_controls),
                             fs_rect.x, fs_rect.y - height + 1);
    }

}

static gboolean
on_fullscreen_controls_enter_notify_event (GtkWidget    *widget,
                                           GdkEventCrossing *event,
                                           PlumaWindow      *window)
{
    show_hide_fullscreen_toolbar (window, TRUE, 0);

    return FALSE;
}

static gboolean
on_fullscreen_controls_leave_notify_event (GtkWidget    *widget,
                                           GdkEventCrossing *event,
                                           PlumaWindow      *window)
{
    GdkDevice *device;
    gint w, h;
    gint x, y;

    device = gdk_event_get_device ((GdkEvent *)event);

    gtk_window_get_size (GTK_WINDOW (window->priv->fullscreen_controls), &w, &h);
    gdk_device_get_position (device, NULL, &x, &y);

    /* gtk seems to emit leave notify when clicking on tool items,
     * work around it by checking the coordinates
     */
    if (y >= h)
    {
        show_hide_fullscreen_toolbar (window, FALSE, h);
    }

    return FALSE;
}

static void
fullscreen_controls_build (PlumaWindow *window)
{
    PlumaWindowPrivate *priv = window->priv;
    GtkWidget *toolbar;
    GtkAction *action;

    if (priv->fullscreen_controls != NULL)
        return;

    priv->fullscreen_controls = gtk_window_new (GTK_WINDOW_POPUP);

    gtk_window_set_transient_for (GTK_WINDOW (priv->fullscreen_controls),
                                  &window->window);

    /* popup toolbar */
    toolbar = gtk_ui_manager_get_widget (priv->manager, "/FullscreenToolBar");
    gtk_container_add (GTK_CONTAINER (priv->fullscreen_controls), toolbar);

    action = gtk_action_group_get_action (priv->always_sensitive_action_group,
                                          "LeaveFullscreen");
    g_object_set (action, "is-important", TRUE, NULL);

    setup_toolbar_open_button (window, toolbar);

    gtk_container_foreach (GTK_CONTAINER (toolbar),
                           (GtkCallback)set_non_homogeneus,
                           NULL);

    /* Set the toolbar style */
    gtk_toolbar_set_style (GTK_TOOLBAR (toolbar), GTK_TOOLBAR_BOTH_HORIZ);

    g_signal_connect (priv->fullscreen_controls, "enter-notify-event",
                      G_CALLBACK (on_fullscreen_controls_enter_notify_event),
                      window);
    g_signal_connect (priv->fullscreen_controls, "leave-notify-event",
                      G_CALLBACK (on_fullscreen_controls_leave_notify_event),
                      window);
}

static void
can_search_again (PlumaDocument *doc,
                  GParamSpec    *pspec,
                  PlumaWindow   *window)
{
    gboolean sensitive;
    GtkAction *action;

    if (doc != pluma_window_get_active_document (window))
        return;

    sensitive = pluma_document_get_can_search_again (doc);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchFindNext");
    gtk_action_set_sensitive (action, sensitive);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchFindPrevious");
    gtk_action_set_sensitive (action, sensitive);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "SearchClearHighlight");
    gtk_action_set_sensitive (action, sensitive);
}

static void
can_undo (PlumaDocument *doc,
          GParamSpec    *pspec,
          PlumaWindow   *window)
{
    GtkAction *action;
    gboolean sensitive;

    sensitive = gtk_source_buffer_can_undo (GTK_SOURCE_BUFFER (doc));

    if (doc != pluma_window_get_active_document (window))
        return;

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditUndo");
    gtk_action_set_sensitive (action, sensitive);
}

static void
can_redo (PlumaDocument *doc,
          GParamSpec    *pspec,
          PlumaWindow   *window)
{
    GtkAction *action;
    gboolean sensitive;

    sensitive = gtk_source_buffer_can_redo (GTK_SOURCE_BUFFER (doc));

    if (doc != pluma_window_get_active_document (window))
        return;

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditRedo");
    gtk_action_set_sensitive (action, sensitive);
}

static void
selection_changed (PlumaDocument *doc,
                   GParamSpec    *pspec,
                   PlumaWindow   *window)
{
    PlumaTab *tab;
    PlumaView *view;
    GtkAction *action;
    PlumaTabState state;
    gboolean state_normal;
    gboolean editable;

    pluma_debug (DEBUG_WINDOW);

    if (doc != pluma_window_get_active_document (window))
        return;

    tab = pluma_tab_get_from_document (doc);
    state = pluma_tab_get_state (tab);
    state_normal = (state == PLUMA_TAB_STATE_NORMAL);

    view = pluma_tab_get_view (tab);
    editable = gtk_text_view_get_editable (GTK_TEXT_VIEW (view));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditCut");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              editable &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditCopy");
    gtk_action_set_sensitive (action,
                              (state_normal ||
                              state == PLUMA_TAB_STATE_EXTERNALLY_MODIFIED_NOTIFICATION) &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "EditDelete");
    gtk_action_set_sensitive (action,
                              state_normal &&
                              editable &&
                              gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc)));

    peas_extension_set_call (window->priv->extensions, "update_state");
}

static void
sync_languages_menu (PlumaDocument *doc,
                     GParamSpec    *pspec,
                     PlumaWindow   *window)
{
    update_languages_menu (window);
    peas_extension_set_call (window->priv->extensions, "update_state");
}

static void
readonly_changed (PlumaDocument *doc,
                  GParamSpec    *pspec,
                  PlumaWindow   *window)
{
    set_sensitivity_according_to_tab (window, window->priv->active_tab);

    sync_name (window->priv->active_tab, NULL, window);

    peas_extension_set_call (window->priv->extensions, "update_state");
}

static void
editable_changed (PlumaView  *view,
                  GParamSpec  *arg1,
                  PlumaWindow *window)
{
    peas_extension_set_call (window->priv->extensions, "update_state");
}

static void
update_sensitivity_according_to_open_tabs (PlumaWindow *window)
{
    GtkAction *action;

    /* Set sensitivity */
    gtk_action_group_set_sensitive (window->priv->action_group,
                                    window->priv->num_tabs != 0);

    action = gtk_action_group_get_action (window->priv->action_group,
                                          "DocumentsMoveToNewWindow");
    gtk_action_set_sensitive (action, window->priv->num_tabs > 1);
}

static void
notebook_tab_added (PlumaNotebook *notebook,
                    PlumaTab      *tab,
                    PlumaWindow   *window)
{
    PlumaView *view;
    PlumaDocument *doc;

    pluma_debug (DEBUG_WINDOW);

    g_return_if_fail ((window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION) == 0);

    ++window->priv->num_tabs;

    update_sensitivity_according_to_open_tabs (window);

    view = pluma_tab_get_view (tab);
    doc = pluma_tab_get_document (tab);

    /* IMPORTANT: remember to disconnect the signal in notebook_tab_removed
     * if a new signal is connected here */

    g_signal_connect (tab,
                      "notify::name",
                      G_CALLBACK (sync_name),
                      window);
    g_signal_connect (tab,
                      "notify::state",
                      G_CALLBACK (sync_state),
                      window);

    g_signal_connect (doc,
                      "cursor-moved",
                      G_CALLBACK (update_cursor_position_statusbar),
                      window);
    g_signal_connect (doc,
                      "notify::can-search-again",
                      G_CALLBACK (can_search_again),
                      window);
    g_signal_connect (doc,
                      "notify::can-undo",
                      G_CALLBACK (can_undo),
                      window);
    g_signal_connect (doc,
                      "notify::can-redo",
                      G_CALLBACK (can_redo),
                      window);
    g_signal_connect (doc,
                      "notify::has-selection",
                      G_CALLBACK (selection_changed),
                      window);
    g_signal_connect (doc,
                      "notify::language",
                      G_CALLBACK (sync_languages_menu),
                      window);
    g_signal_connect (doc,
                      "notify::read-only",
                      G_CALLBACK (readonly_changed),
                      window);
    g_signal_connect (view,
                      "toggle_overwrite",
                      G_CALLBACK (update_overwrite_mode_statusbar),
                      window);
    g_signal_connect (view,
                      "notify::editable",
                      G_CALLBACK (editable_changed),
                      window);

    update_documents_list_menu (window);

    g_signal_connect (view,
                      "drop_uris",
                      G_CALLBACK (drop_uris_cb),
                      NULL);

    update_window_state (window);

    g_signal_emit (G_OBJECT (window), signals[TAB_ADDED], 0, tab);
}

static void
notebook_tab_removed (PlumaNotebook *notebook,
                      PlumaTab      *tab,
                      PlumaWindow   *window)
{
    PlumaView     *view;
    PlumaDocument *doc;

    pluma_debug (DEBUG_WINDOW);

    g_return_if_fail ((window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION) == 0);

    --window->priv->num_tabs;

    view = pluma_tab_get_view (tab);
    doc = pluma_tab_get_document (tab);

    g_signal_handlers_disconnect_by_func (tab,
                                          G_CALLBACK (sync_name),
                                          window);
    g_signal_handlers_disconnect_by_func (tab,
                                          G_CALLBACK (sync_state),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (update_cursor_position_statusbar),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (can_search_again),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (can_undo),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (can_redo),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (selection_changed),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (sync_languages_menu),
                                          window);
    g_signal_handlers_disconnect_by_func (doc,
                                          G_CALLBACK (readonly_changed),
                                          window);
    g_signal_handlers_disconnect_by_func (view,
                                          G_CALLBACK (update_overwrite_mode_statusbar),
                                          window);
    g_signal_handlers_disconnect_by_func (view,
                                          G_CALLBACK (editable_changed),
                                          window);
    g_signal_handlers_disconnect_by_func (view,
                                          G_CALLBACK (drop_uris_cb),
                                          NULL);

#if GLIB_CHECK_VERSION(2,62,0)
    if (tab == pluma_window_get_active_tab (window))
    {
       g_clear_signal_handler (&window->priv->tab_width_id, view);
       g_clear_signal_handler (&window->priv->spaces_instead_of_tabs_id, view);
       g_clear_signal_handler (&window->priv->language_changed_id, doc);
    }
#else
    if (window->priv->tab_width_id && tab == pluma_window_get_active_tab (window))
    {
        g_signal_handler_disconnect (view, window->priv->tab_width_id);
        window->priv->tab_width_id = 0;
    }

    if (window->priv->spaces_instead_of_tabs_id && tab == pluma_window_get_active_tab (window))
    {
        g_signal_handler_disconnect (view, window->priv->spaces_instead_of_tabs_id);
        window->priv->spaces_instead_of_tabs_id = 0;
    }

    if (window->priv->language_changed_id && tab == pluma_window_get_active_tab (window))
    {
        g_signal_handler_disconnect (doc, window->priv->language_changed_id);
        window->priv->language_changed_id = 0;
    }
#endif

    g_return_if_fail (window->priv->num_tabs >= 0);
    if (window->priv->num_tabs == 0)
    {
        window->priv->active_tab = NULL;

        set_title (window);

        /* Remove line and col info */
        pluma_statusbar_set_cursor_position (PLUMA_STATUSBAR (window->priv->statusbar),
                                             -1,
                                             -1);

        pluma_statusbar_clear_overwrite (PLUMA_STATUSBAR (window->priv->statusbar));

        /* hide the combos */
        gtk_widget_hide (window->priv->tab_width_combo);
        gtk_widget_hide (window->priv->language_combo);
    }

    if (!window->priv->removing_tabs)
    {
        update_documents_list_menu (window);
        update_next_prev_doc_sensitivity_per_window (window);
    }
    else
    {
        if (window->priv->num_tabs == 0)
        {
            update_documents_list_menu (window);
            update_next_prev_doc_sensitivity_per_window (window);
        }
    }

    update_sensitivity_according_to_open_tabs (window);

    if (window->priv->num_tabs == 0)
    {
        peas_extension_set_call (window->priv->extensions, "update_state");
    }

    update_window_state (window);

    g_signal_emit (G_OBJECT (window), signals[TAB_REMOVED], 0, tab);
}

static void
notebook_tabs_reordered (PlumaNotebook *notebook,
                         PlumaWindow   *window)
{
    update_documents_list_menu (window);
    update_next_prev_doc_sensitivity_per_window (window);

    g_signal_emit (G_OBJECT (window), signals[TABS_REORDERED], 0);
}

static void
notebook_tab_detached (PlumaNotebook *notebook,
                       PlumaTab      *tab,
                       PlumaWindow   *window)
{
    PlumaWindow *new_window;

    new_window = clone_window (window);

    pluma_notebook_move_tab (notebook,
                             PLUMA_NOTEBOOK (_pluma_window_get_notebook (new_window)),
                             tab, 0);

    gtk_window_set_position (GTK_WINDOW (new_window), GTK_WIN_POS_MOUSE);

    gtk_widget_show (GTK_WIDGET (new_window));
}

static void
notebook_tab_close_request (PlumaNotebook *notebook,
                            PlumaTab      *tab,
                            GtkWindow     *window)
{
    /* Note: we are destroying the tab before the default handler
     * seems to be ok, but we need to keep an eye on this. */
    _pluma_cmd_file_close_tab (tab, PLUMA_WINDOW (window));
}

static gboolean
show_notebook_popup_menu (GtkNotebook    *notebook,
                          PlumaWindow    *window,
                          GdkEventButton *event)
{
    GtkWidget *menu;
//    GtkAction *action;

    menu = gtk_ui_manager_get_widget (window->priv->manager, "/NotebookPopup");
    g_return_val_if_fail (menu != NULL, FALSE);

// CHECK do we need this?
#if 0
    /* allow extensions to sync when showing the popup */
    action = gtk_action_group_get_action (window->priv->action_group,
                          "NotebookPopupAction");
    g_return_val_if_fail (action != NULL, FALSE);
    gtk_action_activate (action);
#endif

    GtkWidget *tab;
    GtkWidget *tab_label;

    tab = GTK_WIDGET (pluma_window_get_active_tab (window));
    g_return_val_if_fail (tab != NULL, FALSE);

    tab_label = gtk_notebook_get_tab_label (notebook, tab);

    gtk_menu_popup_at_widget (GTK_MENU (menu),
                              tab_label,
                              GDK_GRAVITY_SOUTH_WEST,
                              GDK_GRAVITY_NORTH_WEST,
                              (const GdkEvent*) event);

    gtk_menu_shell_select_first (GTK_MENU_SHELL (menu), FALSE);

    return TRUE;
}

static gboolean
notebook_button_press_event (GtkNotebook    *notebook,
                             GdkEventButton *event,
                             PlumaWindow    *window)
{
    if (event->type == GDK_BUTTON_PRESS)
    {
        if (event->button == 3)
            return show_notebook_popup_menu (notebook, window, event);

        else if (event->button == 2)
        {
            PlumaTab *tab;
            tab = pluma_window_get_active_tab (window);
            notebook_tab_close_request (PLUMA_NOTEBOOK (notebook), tab, GTK_WINDOW (window));
        }
    }
    else if ((event->type == GDK_2BUTTON_PRESS) && (event->button == 1))
    {
        pluma_window_create_tab (window, TRUE);
    }

    return FALSE;
}

static gboolean
notebook_scroll_event (GtkNotebook    *notebook,
                       GdkEventScroll *event,
                       PlumaWindow    *window)
{
    if (event->direction == GDK_SCROLL_UP || event->direction == GDK_SCROLL_LEFT)
    {
        gtk_notebook_prev_page (notebook);
    }
    else if (event->direction == GDK_SCROLL_DOWN || event->direction == GDK_SCROLL_RIGHT)
    {
        gtk_notebook_next_page (notebook);
    }

    return FALSE;
}

static gboolean
notebook_popup_menu (GtkNotebook *notebook,
                     PlumaWindow *window)
{
    /* Only respond if the notebook is the actual focus */
    if (PLUMA_IS_NOTEBOOK (gtk_window_get_focus (GTK_WINDOW (window))))
    {
        return show_notebook_popup_menu (notebook, window, NULL);
    }

    return FALSE;
}

static void
side_panel_size_allocate (GtkWidget     *widget,
                          GtkAllocation *allocation,
                          PlumaWindow   *window)
{
    window->priv->side_panel_size = allocation->width;
}

static void
bottom_panel_size_allocate (GtkWidget     *widget,
                            GtkAllocation *allocation,
                            PlumaWindow   *window)
{
    window->priv->bottom_panel_size = allocation->height;
}

static void
hpaned_restore_position (GtkWidget   *widget,
                         PlumaWindow *window)
{
    gint pos;

    pluma_debug_message (DEBUG_WINDOW,
                         "Restoring hpaned position: side panel size %d",
                         window->priv->side_panel_size);

    pos = MAX (100, window->priv->side_panel_size);
    gtk_paned_set_position (GTK_PANED (window->priv->hpaned), pos);

    /* start monitoring the size */
    g_signal_connect (window->priv->side_panel,
                      "size-allocate",
                      G_CALLBACK (side_panel_size_allocate),
                      window);

    /* run this only once */
    g_signal_handlers_disconnect_by_func (widget, hpaned_restore_position, window);
}

static void
vpaned_restore_position (GtkWidget   *widget,
                         PlumaWindow *window)
{
    GtkAllocation allocation;
    gint pos;

    gtk_widget_get_allocation (widget, &allocation);

    pluma_debug_message (DEBUG_WINDOW,
                         "Restoring vpaned position: bottom panel size %d",
                         window->priv->bottom_panel_size);

    pos = allocation.height - MAX (50, window->priv->bottom_panel_size);
    gtk_paned_set_position (GTK_PANED (window->priv->vpaned), pos);

    /* start monitoring the size */
    g_signal_connect (window->priv->bottom_panel,
                      "size-allocate",
                      G_CALLBACK (bottom_panel_size_allocate),
                      window);

    /* run this only once */
    g_signal_handlers_disconnect_by_func (widget, vpaned_restore_position, window);
}

static void
side_panel_visibility_changed (GtkWidget   *side_panel,
                               PlumaWindow *window)
{
    gboolean   visible;
    GtkAction *action;

    visible = gtk_widget_get_visible (side_panel);

    if (!g_settings_get_boolean (window->priv->editor_settings, "show-tabs-with-side-pane"))
    {
        if (visible)
            gtk_notebook_set_show_tabs (GTK_NOTEBOOK (window->priv->notebook), FALSE);
        else
            gtk_notebook_set_show_tabs (GTK_NOTEBOOK (window->priv->notebook),
                                        g_settings_get_boolean (window->priv->editor_settings, "show-single-tab") ||
                                        (gtk_notebook_get_n_pages (GTK_NOTEBOOK (window->priv->notebook)) > 1));
    }
    else
        gtk_notebook_set_show_tabs (GTK_NOTEBOOK (window->priv->notebook),
                                    g_settings_get_boolean (window->priv->editor_settings, "show-single-tab") ||
                                    (gtk_notebook_get_n_pages (GTK_NOTEBOOK (window->priv->notebook)) > 1));

    g_settings_set_boolean (window->priv->editor_settings,
                            PLUMA_SETTINGS_SIDE_PANE_VISIBLE,
                            visible);

    action = gtk_action_group_get_action (window->priv->panes_action_group,
                                          "ViewSidePane");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);

    /* focus the document */
    if (!visible && window->priv->active_tab != NULL)
        gtk_widget_grab_focus (GTK_WIDGET (pluma_tab_get_view (PLUMA_TAB (window->priv->active_tab))));
}

static void
create_side_panel (PlumaWindow *window)
{
    GtkWidget *documents_panel;

    pluma_debug (DEBUG_WINDOW);

    window->priv->side_panel = pluma_panel_new (GTK_ORIENTATION_VERTICAL);

    gtk_paned_pack1 (GTK_PANED (window->priv->hpaned),
                     window->priv->side_panel,
                     FALSE,
                     FALSE);

    g_signal_connect_after (window->priv->side_panel,
                            "show",
                            G_CALLBACK (side_panel_visibility_changed),
                            window);
    g_signal_connect_after (window->priv->side_panel,
                            "hide",
                            G_CALLBACK (side_panel_visibility_changed),
                            window);

    documents_panel = pluma_documents_panel_new (window);
    pluma_panel_add_item_with_icon (PLUMA_PANEL (window->priv->side_panel),
                                    documents_panel,
                                    _("Documents"),
                                    "text-x-generic");
}

static void
bottom_panel_visibility_changed (PlumaPanel  *bottom_panel,
                                 PlumaWindow *window)
{
    gboolean visible;
    GtkAction *action;

    visible = gtk_widget_get_visible (GTK_WIDGET (bottom_panel));

    g_settings_set_boolean (window->priv->editor_settings,
                            PLUMA_SETTINGS_BOTTOM_PANE_VISIBLE,
                            visible);

    action = gtk_action_group_get_action (window->priv->panes_action_group,
                                          "ViewBottomPane");

    if (gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action)) != visible)
        gtk_toggle_action_set_active (GTK_TOGGLE_ACTION (action), visible);

    /* focus the document */
    if (!visible && window->priv->active_tab != NULL)
        gtk_widget_grab_focus (GTK_WIDGET (pluma_tab_get_view (PLUMA_TAB (window->priv->active_tab))));
}

static void
bottom_panel_item_removed (PlumaPanel  *panel,
                           GtkWidget   *item,
                           PlumaWindow *window)
{
    if (pluma_panel_get_n_items (panel) == 0)
    {
        GtkAction *action;

        gtk_widget_hide (GTK_WIDGET (panel));

        action = gtk_action_group_get_action (window->priv->panes_action_group,
                                              "ViewBottomPane");
        gtk_action_set_sensitive (action, FALSE);
    }
}

static void
bottom_panel_item_added (PlumaPanel  *panel,
             GtkWidget   *item,
             PlumaWindow *window)
{
    /* if it's the first item added, set the menu item
     * sensitive and if needed show the panel */
    if (pluma_panel_get_n_items (panel) == 1)
    {
        GtkAction *action;
        gboolean show;

        action = gtk_action_group_get_action (window->priv->panes_action_group,
                                              "ViewBottomPane");
        gtk_action_set_sensitive (action, TRUE);

        show = gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action));
        if (show)
            gtk_widget_show (GTK_WIDGET (panel));
    }
}

static void
create_bottom_panel (PlumaWindow *window)
{
    pluma_debug (DEBUG_WINDOW);

    window->priv->bottom_panel = pluma_panel_new (GTK_ORIENTATION_HORIZONTAL);

    gtk_paned_pack2 (GTK_PANED (window->priv->vpaned),
                     window->priv->bottom_panel,
                     FALSE,
                     FALSE);

    g_signal_connect_after (window->priv->bottom_panel,
                            "show",
                            G_CALLBACK (bottom_panel_visibility_changed),
                            window);
    g_signal_connect_after (window->priv->bottom_panel,
                            "hide",
                            G_CALLBACK (bottom_panel_visibility_changed),
                            window);
}

static void
init_panels_visibility (PlumaWindow *window)
{
    gint active_page;
    gboolean side_pane_visible;
    gboolean bottom_pane_visible;

    pluma_debug (DEBUG_WINDOW);

    /* side pane */
    active_page = g_settings_get_int (window->priv->editor_settings,
                                      PLUMA_SETTINGS_SIDE_PANEL_ACTIVE_PAGE);
    _pluma_panel_set_active_item_by_id (PLUMA_PANEL (window->priv->side_panel),
                                        active_page);

    side_pane_visible = g_settings_get_boolean (window->priv->editor_settings,
                                                PLUMA_SETTINGS_SIDE_PANE_VISIBLE);
    bottom_pane_visible = g_settings_get_boolean (window->priv->editor_settings,
                                                  PLUMA_SETTINGS_BOTTOM_PANE_VISIBLE);

    if (side_pane_visible)

    {
        gtk_widget_show (window->priv->side_panel);
    }

    /* bottom pane, it can be empty */
    if (pluma_panel_get_n_items (PLUMA_PANEL (window->priv->bottom_panel)) > 0)
    {
        active_page = g_settings_get_int (window->priv->editor_settings,
                                          PLUMA_SETTINGS_BOTTOM_PANEL_ACTIVE_PAGE);
        _pluma_panel_set_active_item_by_id (PLUMA_PANEL (window->priv->bottom_panel),
                                            active_page);

        if (bottom_pane_visible)
        {
            gtk_widget_show (window->priv->bottom_panel);
        }
    }
    else
    {
        GtkAction *action;
        action = gtk_action_group_get_action (window->priv->panes_action_group,
                                              "ViewBottomPane");
        gtk_action_set_sensitive (action, FALSE);
    }

    /* start track sensitivity after the initial state is set */
    window->priv->bottom_panel_item_removed_handler_id =
        g_signal_connect (window->priv->bottom_panel,
                          "item_removed",
                          G_CALLBACK (bottom_panel_item_removed),
                          window);

    g_signal_connect (window->priv->bottom_panel,
                      "item_added",
                      G_CALLBACK (bottom_panel_item_added),
                      window);
}

static void
clipboard_owner_change (GtkClipboard    *clipboard,
                        GdkEventOwnerChange *event,
                        PlumaWindow     *window)
{
    set_paste_sensitivity_according_to_clipboard (window, clipboard);
}

static void
window_realized (GtkWidget *window,
                 gpointer  *data)
{
    GtkClipboard *clipboard;

    clipboard = gtk_widget_get_clipboard (window, GDK_SELECTION_CLIPBOARD);

    g_signal_connect (clipboard,
                      "owner_change",
                      G_CALLBACK (clipboard_owner_change),
                      window);
}

static void
window_unrealized (GtkWidget *window,
                   gpointer  *data)
{
    GtkClipboard *clipboard;

    clipboard = gtk_widget_get_clipboard (window, GDK_SELECTION_CLIPBOARD);

    g_signal_handlers_disconnect_by_func (clipboard,
                                          G_CALLBACK (clipboard_owner_change),
                                          window);
}

static void
check_window_is_active (PlumaWindow *window,
                        GParamSpec *property,
                        gpointer useless)
{
    if (window->priv->window_state & GDK_WINDOW_STATE_FULLSCREEN)
    {
        if (gtk_window_is_active (GTK_WINDOW (window)))
        {
            gtk_widget_show (window->priv->fullscreen_controls);
        }
        else
        {
            gtk_widget_hide (window->priv->fullscreen_controls);
        }
    }
}

static void
connect_notebook_signals (PlumaWindow *window,
                          GtkWidget   *notebook)
{
    g_signal_connect (notebook,
                      "switch-page",
                      G_CALLBACK (notebook_switch_page),
                      window);
    g_signal_connect (notebook,
                      "tab-added",
                      G_CALLBACK (notebook_tab_added),
                      window);
    g_signal_connect (notebook,
                      "tab-removed",
                      G_CALLBACK (notebook_tab_removed),
                      window);
    g_signal_connect (notebook,
                      "tabs-reordered",
                      G_CALLBACK (notebook_tabs_reordered),
                      window);
    g_signal_connect (notebook,
                      "tab-detached",
                      G_CALLBACK (notebook_tab_detached),
                      window);
    g_signal_connect (notebook,
                      "tab-close-request",
                      G_CALLBACK (notebook_tab_close_request),
                      window);
    g_signal_connect (notebook,
                      "button-press-event",
                      G_CALLBACK (notebook_button_press_event),
                      window);
    g_signal_connect (notebook,
                      "popup-menu",
                      G_CALLBACK (notebook_popup_menu),
                      window);
    g_signal_connect (notebook,
                      "scroll-event",
                      G_CALLBACK (notebook_scroll_event),
                      window);
}

static void
add_notebook (PlumaWindow *window,
          GtkWidget   *notebook)
{
    gtk_paned_pack1 (GTK_PANED (window->priv->vpaned),
                     notebook,
                     TRUE,
                     TRUE);

    gtk_widget_show (notebook);

    gtk_widget_add_events (notebook, GDK_SCROLL_MASK);
    connect_notebook_signals (window, notebook);
}

static void
on_extension_added (PeasExtensionSet *extensions,
                    PeasPluginInfo   *info,
                    PeasExtension    *exten,
                    PlumaWindow      *window)
{
    peas_extension_call (exten, "activate", window);
}

static void
on_extension_removed (PeasExtensionSet *extensions,
                      PeasPluginInfo   *info,
                      PeasExtension    *exten,
                      PlumaWindow      *window)
{
    peas_extension_call (exten, "deactivate", window);

    /* Ensure update of ui manager, because we suspect it does something
     * with expected static strings in the type module (when unloaded the
     * strings don't exist anymore, and ui manager updates in an idle
     * func) */
    gtk_ui_manager_ensure_update (window->priv->manager);
}

static void
pluma_window_init (PlumaWindow *window)
{
    GtkWidget *main_box;
    GtkTargetList *tl;

    pluma_debug (DEBUG_WINDOW);

    window->priv = pluma_window_get_instance_private (window);
    window->priv->active_tab = NULL;
    window->priv->num_tabs = 0;
    window->priv->removing_tabs = FALSE;
    window->priv->state = PLUMA_WINDOW_STATE_NORMAL;
    window->priv->dispose_has_run = FALSE;
    window->priv->fullscreen_controls = NULL;
    window->priv->fullscreen_animation_timeout_id = 0;
    window->priv->editor_settings = g_settings_new (PLUMA_SCHEMA_ID);

    window->priv->message_bus = pluma_message_bus_new ();

    window->priv->window_group = gtk_window_group_new ();
    gtk_window_group_add_window (window->priv->window_group, GTK_WINDOW (window));

    GtkStyleContext *context;

    context = gtk_widget_get_style_context (GTK_WIDGET (window));
    gtk_style_context_add_class (context, "pluma-window");

    main_box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
    gtk_container_add (GTK_CONTAINER (window), main_box);
    gtk_widget_show (main_box);

    /* Add menu bar and toolbar bar */
    create_menu_bar_and_toolbar (window, main_box);

    /* Add status bar */
    create_statusbar (window, main_box);

    /* Add the main area */
    pluma_debug_message (DEBUG_WINDOW, "Add main area");
    window->priv->hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
    gtk_box_pack_start (GTK_BOX (main_box),
                        window->priv->hpaned,
                        TRUE,
                        TRUE,
                        0);

    window->priv->vpaned = gtk_paned_new (GTK_ORIENTATION_VERTICAL);
      gtk_paned_pack2 (GTK_PANED (window->priv->hpaned),
                       window->priv->vpaned,
                       TRUE,
                       FALSE);

    pluma_debug_message (DEBUG_WINDOW, "Create pluma notebook");
    window->priv->notebook = pluma_notebook_new ();
    add_notebook (window, window->priv->notebook);

    /* side and bottom panels */
      create_side_panel (window);
    create_bottom_panel (window);

    /* panes' state must be restored after panels have been mapped,
     * since the bottom pane position depends on the size of the vpaned. */
    window->priv->side_panel_size = g_settings_get_int (window->priv->editor_settings,
                                                        PLUMA_SETTINGS_SIDE_PANEL_SIZE);
    window->priv->bottom_panel_size = g_settings_get_int (window->priv->editor_settings,
                                                          PLUMA_SETTINGS_BOTTOM_PANEL_SIZE);

    g_signal_connect_after (window->priv->hpaned,
                            "map",
                            G_CALLBACK (hpaned_restore_position),
                            window);
    g_signal_connect_after (window->priv->vpaned,
                            "map",
                            G_CALLBACK (vpaned_restore_position),
                            window);

    gtk_widget_show (window->priv->hpaned);
    gtk_widget_show (window->priv->vpaned);

    /* Drag and drop support, set targets to NULL because we add the
       default uri_targets below */
    gtk_drag_dest_set (GTK_WIDGET (window),
                       GTK_DEST_DEFAULT_MOTION |
                       GTK_DEST_DEFAULT_HIGHLIGHT |
                       GTK_DEST_DEFAULT_DROP,
                       NULL,
                       0,
                       GDK_ACTION_COPY);

    /* Add uri targets */
    tl = gtk_drag_dest_get_target_list (GTK_WIDGET (window));

    if (tl == NULL)
    {
        tl = gtk_target_list_new (NULL, 0);
        gtk_drag_dest_set_target_list (GTK_WIDGET (window), tl);
        gtk_target_list_unref (tl);
    }

    gtk_target_list_add_uri_targets (tl, TARGET_URI_LIST);

    /* connect instead of override, so that we can
     * share the cb code with the view */
    g_signal_connect (window,
                      "drag_data_received",
                      G_CALLBACK (drag_data_received_cb),
                      NULL);

    /* we can get the clipboard only after the widget
     * is realized */
    g_signal_connect (window,
                      "realize",
                      G_CALLBACK (window_realized),
                      NULL);
    g_signal_connect (window,
                      "unrealize",
                      G_CALLBACK (window_unrealized),
                      NULL);

    /* Check if the window is active for fullscreen */
    g_signal_connect (window,
                      "notify::is-active",
                      G_CALLBACK (check_window_is_active),
                      NULL);

    pluma_debug_message (DEBUG_WINDOW, "Update plugins ui");

    window->priv->extensions = peas_extension_set_new (PEAS_ENGINE (pluma_plugins_engine_get_default ()),
                                                       PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                       "window",
                                                       window,
                                                       NULL);

    g_signal_connect (window->priv->extensions, "extension-added",
                      G_CALLBACK (on_extension_added),
                      window);
    g_signal_connect (window->priv->extensions, "extension-removed",
                      G_CALLBACK (on_extension_removed),
                      window);

    peas_extension_set_call (window->priv->extensions, "activate");

     /* set visibility of panes.
      * This needs to be done after plugins activatation */
    init_panels_visibility (window);

    update_sensitivity_according_to_open_tabs (window);

    pluma_debug_message (DEBUG_WINDOW, "END");
}

/**
 * pluma_window_get_active_view:
 * @window: a #PlumaWindow
 *
 * Gets the active #PlumaView.
 *
 * Returns: (transfer none): the active #PlumaView
 */
PlumaView *
pluma_window_get_active_view (PlumaWindow *window)
{
    PlumaView *view;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    if (window->priv->active_tab == NULL)
        return NULL;

    view = pluma_tab_get_view (PLUMA_TAB (window->priv->active_tab));

    return view;
}

/**
 * pluma_window_get_active_document:
 * @window: a #PlumaWindow
 *
 * Gets the active #PlumaDocument.
 *
 * Returns: (transfer none): the active #PlumaDocument
 */
PlumaDocument *
pluma_window_get_active_document (PlumaWindow *window)
{
    PlumaView *view;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    view = pluma_window_get_active_view (window);
    if (view == NULL)
        return NULL;

    return PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));
}

GtkWidget *
_pluma_window_get_notebook (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return window->priv->notebook;
}

/**
 * pluma_window_create_tab:
 * @window: a #PlumaWindow
 * @jump_to: %TRUE to set the new #PlumaTab as active
 *
 * Creates a new #PlumaTab and adds the new tab to the #PlumaNotebook.
 * In case @jump_to is %TRUE the #PlumaNotebook switches to that new #PlumaTab.
 *
 * Returns: (transfer none): a new #PlumaTab
 */
PlumaTab *
pluma_window_create_tab (PlumaWindow *window,
                         gboolean     jump_to)
{
    PlumaTab *tab;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    tab = PLUMA_TAB (_pluma_tab_new ());
    gtk_widget_show (GTK_WIDGET (tab));

    pluma_notebook_add_tab (PLUMA_NOTEBOOK (window->priv->notebook),
                            tab,
                            -1,
                            jump_to);

    if (!gtk_widget_get_visible (GTK_WIDGET (window)))
    {
        gtk_window_present (GTK_WINDOW (window));
    }

    return tab;
}

/**
 * pluma_window_create_tab_from_uri:
 * @window: a #PlumaWindow
 * @uri: the uri of the document
 * @encoding: a #PlumaEncoding
 * @line_pos: the line position to visualize
 * @create: %TRUE to create a new document in case @uri does exist
 * @jump_to: %TRUE to set the new #PlumaTab as active
 *
 * Creates a new #PlumaTab loading the document specified by @uri.
 * In case @jump_to is %TRUE the #PlumaNotebook swithes to that new #PlumaTab.
 * Whether @create is %TRUE, creates a new empty document if location does
 * not refer to an existing file
 *
 * Returns: (transfer none): a new #PlumaTab
 */
PlumaTab *
pluma_window_create_tab_from_uri (PlumaWindow         *window,
                                  const gchar         *uri,
                                  const PlumaEncoding *encoding,
                                  gint                 line_pos,
                                  gboolean             create,
                                  gboolean             jump_to)
{
    GtkWidget *tab;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);
    g_return_val_if_fail (uri != NULL, NULL);

    tab = _pluma_tab_new_from_uri (uri,
                                   encoding,
                                   line_pos,
                                   create);
    if (tab == NULL)
        return NULL;

    gtk_widget_show (tab);

    pluma_notebook_add_tab (PLUMA_NOTEBOOK (window->priv->notebook),
                            PLUMA_TAB (tab),
                            -1,
                            jump_to);

    if (!gtk_widget_get_visible (GTK_WIDGET (window)))
    {
        gtk_window_present (GTK_WINDOW (window));
    }

    return PLUMA_TAB (tab);
}

/**
 * pluma_window_get_active_tab:
 * @window: a PlumaWindow
 *
 * Gets the active #PlumaTab in the @window.
 *
 * Returns: (transfer none): the active #PlumaTab in the @window.
 */
PlumaTab *
pluma_window_get_active_tab (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return (window->priv->active_tab == NULL) ?
                NULL : PLUMA_TAB (window->priv->active_tab);
}

static void
add_document (PlumaTab *tab, GList **res)
{
    PlumaDocument *doc;

    doc = pluma_tab_get_document (tab);

    *res = g_list_prepend (*res, doc);
}

/**
 * pluma_window_get_documents:
 * @window: a #PlumaWindow
 *
 * Gets a newly allocated list with all the documents in the window.
 * This list must be freed.
 *
 * Returns: (element-type Pluma.Document) (transfer container): a newly
 * allocated list with all the documents in the window
 */
GList *
pluma_window_get_documents (PlumaWindow *window)
{
    GList *res = NULL;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    gtk_container_foreach (GTK_CONTAINER (window->priv->notebook),
                           (GtkCallback)add_document,
                           &res);

    res = g_list_reverse (res);

    return res;
}

static void
add_view (PlumaTab *tab, GList **res)
{
    PlumaView *view;

    view = pluma_tab_get_view (tab);

    *res = g_list_prepend (*res, view);
}

/**
 * pluma_window_get_views:
 * @window: a #PlumaWindow
 *
 * Gets a list with all the views in the window. This list must be freed.
 *
 * Returns: (element-type Pluma.View) (transfer container): a newly allocated
 * list with all the views in the window
 */
GList *
pluma_window_get_views (PlumaWindow *window)
{
    GList *res = NULL;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    gtk_container_foreach (GTK_CONTAINER (window->priv->notebook),
                           (GtkCallback)add_view,
                           &res);

    res = g_list_reverse (res);

    return res;
}

/**
 * pluma_window_close_tab:
 * @window: a #PlumaWindow
 * @tab: the #PlumaTab to close
 *
 * Closes the @tab.
 */
void
pluma_window_close_tab (PlumaWindow *window,
            PlumaTab    *tab)
{
    g_return_if_fail (PLUMA_IS_WINDOW (window));
    g_return_if_fail (PLUMA_IS_TAB (tab));
    g_return_if_fail ((pluma_tab_get_state (tab) != PLUMA_TAB_STATE_SAVING) &&
                      (pluma_tab_get_state (tab) != PLUMA_TAB_STATE_SHOWING_PRINT_PREVIEW));

    pluma_notebook_remove_tab (PLUMA_NOTEBOOK (window->priv->notebook), tab);
}

/**
 * pluma_window_close_all_tabs:
 * @window: a #PlumaWindow
 *
 * Closes all opened tabs.
 */
void
pluma_window_close_all_tabs (PlumaWindow *window)
{
    g_return_if_fail (PLUMA_IS_WINDOW (window));
    g_return_if_fail (!(window->priv->state & PLUMA_WINDOW_STATE_SAVING) &&
                      !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    window->priv->removing_tabs = TRUE;

    pluma_notebook_remove_all_tabs (PLUMA_NOTEBOOK (window->priv->notebook));

    window->priv->removing_tabs = FALSE;
}

/**
 * pluma_window_close_tabs:
 * @window: a #PlumaWindow
 * @tabs: (element-type Pluma.Tab): a list of #PlumaTab
 *
 * Closes all tabs specified by @tabs.
 */
void
pluma_window_close_tabs (PlumaWindow *window,
             const GList *tabs)
{
    g_return_if_fail (PLUMA_IS_WINDOW (window));
    g_return_if_fail (!(window->priv->state & PLUMA_WINDOW_STATE_SAVING) &&
                      !(window->priv->state & PLUMA_WINDOW_STATE_SAVING_SESSION));

    if (tabs == NULL)
        return;

    window->priv->removing_tabs = TRUE;

    while (tabs != NULL)
    {
        if (tabs->next == NULL)
            window->priv->removing_tabs = FALSE;

        pluma_notebook_remove_tab (PLUMA_NOTEBOOK (window->priv->notebook),
                                   PLUMA_TAB (tabs->data));

        tabs = g_list_next (tabs);
    }

    g_return_if_fail (window->priv->removing_tabs == FALSE);
}

PlumaWindow *
_pluma_window_move_tab_to_new_window (PlumaWindow *window,
                                      PlumaTab    *tab)
{
    PlumaWindow *new_window;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);
    g_return_val_if_fail (PLUMA_IS_TAB (tab), NULL);
    g_return_val_if_fail (gtk_notebook_get_n_pages (GTK_NOTEBOOK (window->priv->notebook)) > 1,
                          NULL);

    new_window = clone_window (window);

    pluma_notebook_move_tab (PLUMA_NOTEBOOK (window->priv->notebook),
                             PLUMA_NOTEBOOK (new_window->priv->notebook),
                             tab,
                             -1);

    gtk_widget_show (GTK_WIDGET (new_window));

    return new_window;
}

/**
 * pluma_window_set_active_tab:
 * @window: a #PlumaWindow
 * @tab: a #PlumaTab
 *
 * Switches to the tab that matches with @tab.
 */
void
pluma_window_set_active_tab (PlumaWindow *window,
                             PlumaTab    *tab)
{
    gint page_num;

    g_return_if_fail (PLUMA_IS_WINDOW (window));
    g_return_if_fail (PLUMA_IS_TAB (tab));

    page_num = gtk_notebook_page_num (GTK_NOTEBOOK (window->priv->notebook),
                                      GTK_WIDGET (tab));
    g_return_if_fail (page_num != -1);

    gtk_notebook_set_current_page (GTK_NOTEBOOK (window->priv->notebook),
                                   page_num);
}

/**
 * pluma_window_get_group:
 * @window: a #PlumaWindow
 *
 * Gets the #GtkWindowGroup in which @window resides.
 *
 * Returns: (transfer none): the #GtkWindowGroup
 */
GtkWindowGroup *
pluma_window_get_group (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return window->priv->window_group;
}

gboolean
_pluma_window_is_removing_tabs (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), FALSE);

    return window->priv->removing_tabs;
}

/**
 * pluma_window_get_ui_manager:
 * @window: a #PlumaWindow
 *
 * Gets the #GtkUIManager associated with the @window.
 *
 * Returns: (transfer none): the #GtkUIManager of the @window.
 */
GtkUIManager *
pluma_window_get_ui_manager (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return window->priv->manager;
}

/**
 * pluma_window_get_side_panel:
 * @window: a #PlumaWindow
 *
 * Gets the side #PlumaPanel of the @window.
 *
 * Returns: (transfer none): the side #PlumaPanel.
 */
PlumaPanel *
pluma_window_get_side_panel (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return PLUMA_PANEL (window->priv->side_panel);
}

/**
 * pluma_window_get_bottom_panel:
 * @window: a #PlumaWindow
 *
 * Gets the bottom #PlumaPanel of the @window.
 *
 * Returns: (transfer none): the bottom #PlumaPanel.
 */
PlumaPanel *
pluma_window_get_bottom_panel (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return PLUMA_PANEL (window->priv->bottom_panel);
}

/**
 * pluma_window_get_statusbar:
 * @window: a #PlumaWindow
 *
 * Gets the #PlumaStatusbar of the @window.
 *
 * Returns: (transfer none): the #PlumaStatusbar of the @window.
 */
GtkWidget *
pluma_window_get_statusbar (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), 0);

    return window->priv->statusbar;
}

/**
 * pluma_window_get_state:
 * @window: a #PlumaWindow
 *
 * Retrieves the state of the @window.
 *
 * Returns: the current #PlumaWindowState of the @window.
 */
PlumaWindowState
pluma_window_get_state (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), PLUMA_WINDOW_STATE_NORMAL);

    return window->priv->state;
}

GFile *
_pluma_window_get_default_location (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return window->priv->default_location != NULL ?
           g_object_ref (window->priv->default_location) : NULL;
}

void
_pluma_window_set_default_location (PlumaWindow *window,
                                    GFile       *location)
{
    GFile *dir;

    g_return_if_fail (PLUMA_IS_WINDOW (window));
    g_return_if_fail (G_IS_FILE (location));

    dir = g_file_get_parent (location);
    g_return_if_fail (dir != NULL);

    if (window->priv->default_location != NULL)
        g_object_unref (window->priv->default_location);

    window->priv->default_location = dir;
}

/**
 * pluma_window_get_unsaved_documents:
 * @window: a #PlumaWindow
 *
 * Gets the list of documents that need to be saved before closing the window.
 *
 * Returns: (element-type Pluma.Document) (transfer container): a list of
 * #PlumaDocument that need to be saved before closing the window
 */
GList *
pluma_window_get_unsaved_documents (PlumaWindow *window)
{
    GList *unsaved_docs = NULL;
    GList *tabs;
    GList *l;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    tabs = gtk_container_get_children (GTK_CONTAINER (window->priv->notebook));

    l = tabs;
    while (l != NULL)
    {
        PlumaTab *tab;

        tab = PLUMA_TAB (l->data);

        if (!_pluma_tab_can_close (tab))
        {
            PlumaDocument *doc;

            doc = pluma_tab_get_document (tab);
            unsaved_docs = g_list_prepend (unsaved_docs, doc);
        }

        l = g_list_next (l);
    }

    g_list_free (tabs);

    return g_list_reverse (unsaved_docs);
}

void
_pluma_window_set_saving_session_state (PlumaWindow *window,
                                        gboolean     saving_session)
{
    PlumaWindowState old_state;

    g_return_if_fail (PLUMA_IS_WINDOW (window));

    old_state = window->priv->state;

    if (saving_session)
        window->priv->state |= PLUMA_WINDOW_STATE_SAVING_SESSION;
    else
        window->priv->state &= ~PLUMA_WINDOW_STATE_SAVING_SESSION;

    if (old_state != window->priv->state)
    {
        set_sensitivity_according_to_window_state (window);

        g_object_notify (G_OBJECT (window), "state");
    }
}

static void
hide_notebook_tabs_on_fullscreen (GtkNotebook    *notebook,
                                  GParamSpec    *pspec,
                                  PlumaWindow    *window)
{
    gtk_notebook_set_show_tabs (notebook, FALSE);
}

void
_pluma_window_fullscreen (PlumaWindow *window)
{
    g_return_if_fail (PLUMA_IS_WINDOW (window));

    if (_pluma_window_is_fullscreen (window))
        return;

    /* Go to fullscreen mode and hide bars */
    gtk_window_fullscreen (&window->window);
    gtk_notebook_set_show_tabs (GTK_NOTEBOOK (window->priv->notebook), FALSE);
    g_signal_connect (window->priv->notebook, "notify::show-tabs",
                      G_CALLBACK (hide_notebook_tabs_on_fullscreen), window);

    gtk_widget_hide (window->priv->menubar);

    g_signal_handlers_block_by_func (window->priv->toolbar,
                                     toolbar_visibility_changed,
                                     window);
    gtk_widget_hide (window->priv->toolbar);

    g_signal_handlers_block_by_func (window->priv->statusbar,
                                     statusbar_visibility_changed,
                                     window);
    gtk_widget_hide (window->priv->statusbar);

    fullscreen_controls_build (window);
    fullscreen_controls_show (window);
}

void
_pluma_window_unfullscreen (PlumaWindow *window)
{
    gboolean visible;
    GtkAction *action;

    g_return_if_fail (PLUMA_IS_WINDOW (window));

    if (!_pluma_window_is_fullscreen (window))
        return;

    /* Unfullscreen and show bars */
    gtk_window_unfullscreen (&window->window);
    g_signal_handlers_disconnect_by_func (window->priv->notebook,
                                          hide_notebook_tabs_on_fullscreen,
                                          window);
    gtk_notebook_set_show_tabs (GTK_NOTEBOOK (window->priv->notebook), TRUE);
    gtk_widget_show (window->priv->menubar);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewToolbar");
    visible = gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action));
    if (visible)
        gtk_widget_show (window->priv->toolbar);
    g_signal_handlers_unblock_by_func (window->priv->toolbar,
                                       toolbar_visibility_changed,
                                       window);

    action = gtk_action_group_get_action (window->priv->always_sensitive_action_group,
                                          "ViewStatusbar");
    visible = gtk_toggle_action_get_active (GTK_TOGGLE_ACTION (action));
    if (visible)
        gtk_widget_show (window->priv->statusbar);
    g_signal_handlers_unblock_by_func (window->priv->statusbar,
                                       statusbar_visibility_changed,
                                       window);

    gtk_widget_hide (window->priv->fullscreen_controls);
}

gboolean
_pluma_window_is_fullscreen (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), FALSE);

    return window->priv->window_state & GDK_WINDOW_STATE_FULLSCREEN;
}

/**
 * pluma_window_get_tab_from_location:
 * @window: a #PlumaWindow
 * @location: a #GFile
 *
 * Gets the #PlumaTab that matches with the given @location.
 *
 * Returns: (transfer none): the #PlumaTab that matches with the given @location.
 */
PlumaTab *
pluma_window_get_tab_from_location (PlumaWindow *window,
                                    GFile       *location)
{
    GList *tabs;
    GList *l;
    PlumaTab *ret = NULL;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);
    g_return_val_if_fail (G_IS_FILE (location), NULL);

    tabs = gtk_container_get_children (GTK_CONTAINER (window->priv->notebook));

    for (l = tabs; l != NULL; l = g_list_next (l))
    {
        PlumaDocument *d;
        PlumaTab *t;
        GFile *f;

        t = PLUMA_TAB (l->data);
        d = pluma_tab_get_document (t);

        f = pluma_document_get_location (d);

        if ((f != NULL))
        {
            gboolean found = g_file_equal (location, f);

            g_object_unref (f);

            if (found)
            {
                ret = t;
                break;
            }
        }
    }

    g_list_free (tabs);

    return ret;
}

/**
 * pluma_window_get_message_bus:
 * @window: a #PlumaWindow
 *
 * Gets the #PlumaMessageBus associated with @window. The returned reference
 * is owned by the window and should not be unreffed.
 *
 * Return value: (transfer none): the #PlumaMessageBus associated with @window
 */
PlumaMessageBus    *
pluma_window_get_message_bus (PlumaWindow *window)
{
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    return window->priv->message_bus;
}

