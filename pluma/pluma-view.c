/*
 * pluma-view.c
 * This file is part of pluma
 *
 * Copyright (C) 1998, 1999 Alex Roberts, Evan Lawrence
 * Copyright (C) 2000, 2002 Chema Celorio, Paolo Maggi
 * Copyright (C) 2003-2005 Paolo Maggi
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
 * Modified by the pluma Team, 1998-2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <string.h>
#include <stdlib.h>

#include <gtk/gtk.h>
#include <gdk/gdkkeysyms.h>
#include <libpeas/peas-extension-set.h>

#include <glib/gi18n.h>

#include "pluma-view.h"
#include "pluma-view-activatable.h"
#include "pluma-plugins-engine.h"
#include "pluma-debug.h"
#include "pluma-pango.h"
#include "pluma-utils.h"
#include "pluma-settings.h"

#define PLUMA_VIEW_SCROLL_MARGIN 0.02
#define PLUMA_VIEW_SEARCH_DIALOG_TIMEOUT (30*1000) /* 30 seconds */

#define MIN_SEARCH_COMPLETION_KEY_LEN 3

/* Local variables */
static gboolean middle_or_right_down = FALSE;

typedef enum
{
    GOTO_LINE,
    SEARCH
} SearchMode;

enum
{
    TARGET_URI_LIST = 100
};

struct _PlumaViewPrivate
{
    GSettings   *editor_settings;
    GSettings   *interface_settings;

    SearchMode   search_mode;

    GtkTextIter  start_search_iter;

    /* used to restore the search state if an
     * incremental search is cancelled
     */
    gchar       *old_search_text;
    guint        old_search_flags;

    /* used to remeber the state of the last
     * incremental search (the document search
     * state may be changed by the search dialog)
     */
    guint        search_flags;
    gboolean     wrap_around;

    GtkWidget   *search_window;
    GtkWidget   *search_entry;

    guint        typeselect_flush_timeout;
    guint        search_entry_changed_id;

    gboolean     disable_popdown;

    GtkTextBuffer        *current_buffer;

    GtkCssProvider       *css_provider;
    PangoFontDescription *font_desc;

    PeasExtensionSet     *extensions;
};

/* The search entry completion is shared among all the views */
GtkListStore *search_completion_model = NULL;

static void    pluma_view_dispose               (GObject          *object);

static void    pluma_view_finalize              (GObject          *object);

static gint    pluma_view_focus_out             (GtkWidget        *widget,
                                                 GdkEventFocus    *event);

static gboolean pluma_view_scroll_event         (GtkWidget        *widget,
                                                 GdkEventScroll   *event);

static gboolean pluma_view_drag_motion          (GtkWidget        *widget,
                                                 GdkDragContext   *context,
                                                 gint              x,
                                                 gint              y,
                                                 guint             timestamp);

static void     pluma_view_drag_data_received   (GtkWidget        *widget,
                                                 GdkDragContext   *context,
                                                 gint              x,
                                                 gint              y,
                                                 GtkSelectionData *selection_data,
                                                 guint             info,
                                                 guint             timestamp);

static gboolean pluma_view_drag_drop            (GtkWidget        *widget,
                                                 GdkDragContext   *context,
                                                 gint              x,
                                                 gint              y,
                                                 guint             timestamp);

static void        pluma_view_realize               (GtkWidget *widget);

static void        pluma_view_unrealize             (GtkWidget *widget);

static gboolean    pluma_view_button_press_event    (GtkWidget        *widget,
                                                     GdkEventButton   *event);

static gboolean    pluma_view_button_release_event  (GtkWidget        *widget,
                                                     GdkEventButton   *event);

static void    pluma_view_populate_popup     (GtkTextView      *text_view,
                                              GtkWidget        *widget);

static gboolean start_interactive_search     (PlumaView        *view);

static gboolean start_interactive_goto_line  (PlumaView        *view);

static gboolean reset_searched_text          (PlumaView        *view);

static void    hide_search_window            (PlumaView        *view,
                                              gboolean          cancel);

static gboolean    pluma_view_draw           (GtkWidget        *widget,
                                              cairo_t          *cr);

static void     search_highlight_updated_cb  (PlumaDocument    *doc,
                                              GtkTextIter      *start,
                                              GtkTextIter      *end,
                                              PlumaView        *view);

static void    pluma_view_delete_from_cursor (GtkTextView     *text_view,
                                              GtkDeleteType    type,
                                              gint             count);

G_DEFINE_TYPE_WITH_PRIVATE (PlumaView, pluma_view, GTK_SOURCE_TYPE_VIEW)

/* Signals */
enum
{
    START_INTERACTIVE_SEARCH,
    START_INTERACTIVE_GOTO_LINE,
    RESET_SEARCHED_TEXT,
    DROP_URIS,
    LAST_SIGNAL
};

static guint view_signals [LAST_SIGNAL] = { 0 };

typedef enum
{
    PLUMA_SEARCH_ENTRY_NORMAL,
    PLUMA_SEARCH_ENTRY_NOT_FOUND
} PlumaSearchEntryState;

static void
document_read_only_notify_handler (PlumaDocument *document,
                                   GParamSpec    *pspec,
                                   PlumaView     *view)
{
    pluma_debug (DEBUG_VIEW);

    gtk_text_view_set_editable (GTK_TEXT_VIEW (view),
                                !pluma_document_get_readonly (document));
}

static gboolean
pluma_view_scroll_event (GtkWidget      *widget,
                         GdkEventScroll *event)
{
    if (event->direction == GDK_SCROLL_UP)
    {
        event->delta_x = 0;
        event->delta_y = -1;
    }
    else if (event->direction == GDK_SCROLL_DOWN)
    {
        event->delta_x = 0;
        event->delta_y = 1;
    }
    else if (event->direction == GDK_SCROLL_LEFT)
    {
        event->delta_x = -1;
        event->delta_y = 0;
    }
    else if (event->direction == GDK_SCROLL_RIGHT)
    {
        event->delta_x = 1;
        event->delta_y = 0;
    }

    event->direction = GDK_SCROLL_SMOOTH;

    return FALSE;
}

static void
pluma_view_class_init (PlumaViewClass *klass)
{
    GObjectClass     *object_class = G_OBJECT_CLASS (klass);
    GtkWidgetClass   *widget_class = GTK_WIDGET_CLASS (klass);
    GtkTextViewClass *text_view_class = GTK_TEXT_VIEW_CLASS (klass);

    GtkBindingSet    *binding_set;

    object_class->dispose = pluma_view_dispose;
    object_class->finalize = pluma_view_finalize;

    widget_class->focus_out_event = pluma_view_focus_out;
    widget_class->draw = pluma_view_draw;
    widget_class->scroll_event = pluma_view_scroll_event;

    /*
     * Override the gtk_text_view_drag_motion and drag_drop
     * functions to get URIs
     *
     * If the mime type is text/uri-list, then we will accept
     * the potential drop, or request the data (depending on the
     * function).
     *
     * If the drag context has any other mime type, then pass the
     * information onto the GtkTextView's standard handlers.
     * (widget_class->function_name).
     *
     * See bug #89881 for details
     */
    widget_class->drag_motion = pluma_view_drag_motion;
    widget_class->drag_data_received = pluma_view_drag_data_received;
    widget_class->drag_drop = pluma_view_drag_drop;
    widget_class->button_press_event = pluma_view_button_press_event;
    widget_class->button_release_event = pluma_view_button_release_event;

    widget_class->realize = pluma_view_realize;
    widget_class->unrealize = pluma_view_unrealize;

    text_view_class->populate_popup = pluma_view_populate_popup;
    klass->start_interactive_search = start_interactive_search;
    klass->start_interactive_goto_line = start_interactive_goto_line;
    klass->reset_searched_text = reset_searched_text;

    text_view_class->delete_from_cursor = pluma_view_delete_from_cursor;

    view_signals[START_INTERACTIVE_SEARCH] =
            g_signal_new ("start_interactive_search",
                          G_TYPE_FROM_CLASS (object_class),
                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
                          G_STRUCT_OFFSET (PlumaViewClass, start_interactive_search),
                          NULL, NULL, NULL,
                          G_TYPE_BOOLEAN, 0);

    view_signals[START_INTERACTIVE_GOTO_LINE] =
            g_signal_new ("start_interactive_goto_line",
                          G_TYPE_FROM_CLASS (object_class),
                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
                          G_STRUCT_OFFSET (PlumaViewClass, start_interactive_goto_line),
                          NULL, NULL, NULL,
                          G_TYPE_BOOLEAN, 0);

    view_signals[RESET_SEARCHED_TEXT] =
            g_signal_new ("reset_searched_text",
                          G_TYPE_FROM_CLASS (object_class),
                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
                          G_STRUCT_OFFSET (PlumaViewClass, reset_searched_text),
                          NULL, NULL, NULL,
                          G_TYPE_BOOLEAN, 0);

    /* A new signal DROP_URIS has been added to allow plugins to intercept
     * the default dnd behaviour of 'text/uri-list'. PlumaView now handles
     * dnd in the default handlers of drag_drop, drag_motion and
     * drag_data_received. The view emits drop_uris from drag_data_received
     * if valid uris have been dropped. Plugins should connect to
     * drag_motion, drag_drop and drag_data_received to change this
     * default behaviour. They should _NOT_ use this signal because this
     * will not prevent pluma from loading the uri
     */
    view_signals[DROP_URIS] =
            g_signal_new ("drop_uris",
                          G_TYPE_FROM_CLASS (object_class),
                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
                          G_STRUCT_OFFSET (PlumaViewClass, drop_uris),
                          NULL, NULL, NULL,
                          G_TYPE_NONE, 1, G_TYPE_STRV);

    binding_set = gtk_binding_set_by_class (klass);

    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_k,
                                  GDK_CONTROL_MASK,
                                  "start_interactive_search", 0);

    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_i,
                                  GDK_CONTROL_MASK,
                                  "start_interactive_goto_line", 0);

    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_k,
                                  GDK_CONTROL_MASK | GDK_SHIFT_MASK,
                                  "reset_searched_text", 0);

    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_d,
                                  GDK_CONTROL_MASK,
                                  "delete_from_cursor", 2,
                                  G_TYPE_ENUM, GTK_DELETE_PARAGRAPHS,
                                  G_TYPE_INT, 1);

    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_u,
                                  GDK_CONTROL_MASK,
                                  "change_case", 1,
                                  G_TYPE_ENUM, GTK_SOURCE_CHANGE_CASE_UPPER);
    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_l,
                                  GDK_CONTROL_MASK,
                                  "change_case", 1,
                                  G_TYPE_ENUM, GTK_SOURCE_CHANGE_CASE_LOWER);
    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_u,
                                  GDK_MOD1_MASK,
                                  "change_case", 1,
                                  G_TYPE_ENUM, GTK_SOURCE_CHANGE_CASE_TOGGLE);
    gtk_binding_entry_add_signal (binding_set,
                                  GDK_KEY_l,
                                  GDK_MOD1_MASK,
                                  "change_case", 1,
                                  G_TYPE_ENUM, GTK_SOURCE_CHANGE_CASE_TITLE);
}

static void
current_buffer_removed (PlumaView *view)
{
    if (view->priv->current_buffer)
    {
        g_signal_handlers_disconnect_by_func (view->priv->current_buffer,
                                              document_read_only_notify_handler,
                                              view);
        g_signal_handlers_disconnect_by_func (view->priv->current_buffer,
                                              search_highlight_updated_cb,
                                              view);

        g_object_unref (view->priv->current_buffer);
        view->priv->current_buffer = NULL;
    }
}

static void
on_notify_buffer_cb (PlumaView  *view,
                     GParamSpec *arg1,
                     gpointer    userdata)
{
    GtkTextBuffer *buffer;

    current_buffer_removed (view);
    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));

    if (buffer == NULL || !PLUMA_IS_DOCUMENT (buffer))
        return;

    view->priv->current_buffer = g_object_ref (buffer);
    g_signal_connect (buffer,
                      "notify::read-only",
                      G_CALLBACK (document_read_only_notify_handler),
                      view);

    gtk_text_view_set_editable (GTK_TEXT_VIEW (view),
                                !pluma_document_get_readonly (PLUMA_DOCUMENT (buffer)));

    g_signal_connect (buffer,
                      "search_highlight_updated",
                      G_CALLBACK (search_highlight_updated_cb),
                      view);
}

#ifdef GTK_SOURCE_VERSION_3_24
void
pluma_set_source_space_drawer_by_level (GtkSourceView *view,
                                        gint level,
                                        GtkSourceSpaceTypeFlags type)
{
    GtkSourceSpaceLocationFlags locs[] = {GTK_SOURCE_SPACE_LOCATION_LEADING,
                                          GTK_SOURCE_SPACE_LOCATION_INSIDE_TEXT,
                                          GTK_SOURCE_SPACE_LOCATION_TRAILING};
    /* this array links the level to the location */
    GtkSourceSpaceLocationFlags levels[] =
                    {0,
                     GTK_SOURCE_SPACE_LOCATION_TRAILING,
                     GTK_SOURCE_SPACE_LOCATION_INSIDE_TEXT |
                     GTK_SOURCE_SPACE_LOCATION_TRAILING |
                     GTK_SOURCE_SPACE_LOCATION_LEADING
                    };

    gint i;

    GtkSourceSpaceDrawer *drawer = gtk_source_view_get_space_drawer (view);

    if (level >= G_N_ELEMENTS(levels) || level < 0)
        level = 0;

    for (i = 0 ; i < G_N_ELEMENTS(locs) ; i++ ) {
        GtkSourceSpaceTypeFlags f;
        f = gtk_source_space_drawer_get_types_for_locations (drawer,
                                                             locs[i]);
        if (locs[i] & levels[level])
            f |= type;
        else
            f &= ~type;
        gtk_source_space_drawer_set_types_for_locations (drawer, locs[i], f);
    }
}
#endif

#ifdef GTK_SOURCE_VERSION_3_24
static void
pluma_set_source_space_drawer (GSettings *settings, GtkSourceView *view)
{
    pluma_set_source_space_drawer_by_level (view,
                                            g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_SPACE),
                                            GTK_SOURCE_SPACE_TYPE_SPACE);
    pluma_set_source_space_drawer_by_level (view,
                                            g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_TAB),
                                            GTK_SOURCE_SPACE_TYPE_TAB);
    pluma_set_source_space_drawer_by_level (view,
                                            g_settings_get_boolean (settings, PLUMA_SETTINGS_DRAWER_NEWLINE) ? 2 : 0,
                                            GTK_SOURCE_SPACE_TYPE_NEWLINE);
    pluma_set_source_space_drawer_by_level (view,
                                            g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_NBSP),
                                            GTK_SOURCE_SPACE_TYPE_NBSP);
    gtk_source_space_drawer_set_enable_matrix (gtk_source_view_get_space_drawer (view),
                                               TRUE);

}
#else
static void
pluma_set_source_space_drawer (GSettings *settings, GtkSourceView *view)
{
    GtkSourceDrawSpacesFlags flags = 0;

    if (g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_SPACE) > 0)
        flags |= GTK_SOURCE_DRAW_SPACES_SPACE;
    if (g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_TAB) > 0)
        flags |= GTK_SOURCE_DRAW_SPACES_TAB;
    if (g_settings_get_boolean (settings, PLUMA_SETTINGS_DRAWER_NEWLINE))
        flags |= GTK_SOURCE_DRAW_SPACES_NEWLINE;
    if (g_settings_get_enum (settings, PLUMA_SETTINGS_DRAWER_NBSP) > 0)
        flags |= GTK_SOURCE_DRAW_SPACES_NBSP;

    flags |= GTK_SOURCE_DRAW_SPACES_TRAILING |
             GTK_SOURCE_DRAW_SPACES_TEXT     |
             GTK_SOURCE_DRAW_SPACES_LEADING;

    gtk_source_view_set_draw_spaces (view, flags);
}
#endif

static void
pluma_view_init (PlumaView *view)
{
    PlumaSettings *settings;
    GtkTargetList *tl;
    gboolean use_default_font;
    gboolean display_line_numbers;
    gboolean auto_indent;
    gboolean insert_spaces;
    gboolean display_right_margin;
    gboolean hl_current_line;
    guint tabs_size;
    guint right_margin_position;
    GtkWrapMode wrap_mode;
    GtkSourceSmartHomeEndType smart_home_end;
    GtkStyleContext *context;

    pluma_debug (DEBUG_VIEW);

    view->priv = pluma_view_get_instance_private (view);

    settings = _pluma_settings_get_singleton ();
    view->priv->editor_settings = g_settings_new (PLUMA_SCHEMA_ID);
    view->priv->interface_settings = g_settings_new ("org.mate.interface");

    view->priv->css_provider = gtk_css_provider_new ();
    context = gtk_widget_get_style_context (GTK_WIDGET (view));
    gtk_style_context_add_class (context, "pluma-view");

    gtk_style_context_add_provider (context,
                                    GTK_STYLE_PROVIDER (view->priv->css_provider),
                                    GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);


    /* Get setting values */
    use_default_font = g_settings_get_boolean (view->priv->editor_settings,
                                               PLUMA_SETTINGS_USE_DEFAULT_FONT);

    /*
     * Set tab, fonts, wrap mode, colors, etc. according
     * to preferences
     */
    if (!use_default_font)
    {
        gchar *editor_font;

        editor_font = g_settings_get_string (view->priv->editor_settings,
                                             PLUMA_SETTINGS_EDITOR_FONT);

        pluma_view_set_font (view, FALSE, editor_font);

        g_free (editor_font);
    }
    else
    {
        pluma_view_set_font (view, TRUE, NULL);
    }

    display_line_numbers = g_settings_get_boolean (view->priv->editor_settings, PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS);
    auto_indent = g_settings_get_boolean (view->priv->editor_settings, PLUMA_SETTINGS_AUTO_INDENT);
    tabs_size = g_settings_get_uint (view->priv->editor_settings, PLUMA_SETTINGS_TABS_SIZE);
    insert_spaces = g_settings_get_boolean (view->priv->editor_settings, PLUMA_SETTINGS_INSERT_SPACES);
    display_right_margin = g_settings_get_boolean (view->priv->editor_settings, PLUMA_SETTINGS_DISPLAY_RIGHT_MARGIN);
    right_margin_position = g_settings_get_uint (view->priv->editor_settings, PLUMA_SETTINGS_RIGHT_MARGIN_POSITION);
    hl_current_line = g_settings_get_boolean (view->priv->editor_settings, PLUMA_SETTINGS_HIGHLIGHT_CURRENT_LINE);

    wrap_mode = pluma_settings_get_wrap_mode (view->priv->editor_settings, PLUMA_SETTINGS_WRAP_MODE);

    smart_home_end = pluma_settings_get_smart_home_end (settings);

    g_object_set (G_OBJECT (view),
                  "wrap_mode", wrap_mode,
                  "show_line_numbers", display_line_numbers,
                  "auto_indent", auto_indent,
                  "tab_width", tabs_size,
                  "insert_spaces_instead_of_tabs", insert_spaces,
                  "show_right_margin", display_right_margin,
                  "right_margin_position", right_margin_position,
                  "highlight_current_line", hl_current_line,
                  "smart_home_end", smart_home_end,
                  "indent_on_tab", TRUE,
                  NULL);

    g_settings_bind (view->priv->editor_settings,
                     PLUMA_SETTINGS_BACKGROUND_PATTERN,
                     view,
                     "background-pattern",
                     G_SETTINGS_BIND_DEFAULT);

    pluma_set_source_space_drawer (view->priv->editor_settings, GTK_SOURCE_VIEW (view));

    view->priv->typeselect_flush_timeout = 0;
    view->priv->wrap_around = TRUE;

    /* Drag and drop support */
    tl = gtk_drag_dest_get_target_list (GTK_WIDGET (view));

    if (tl != NULL)
        gtk_target_list_add_uri_targets (tl, TARGET_URI_LIST);

    view->priv->extensions =
            peas_extension_set_new (PEAS_ENGINE (pluma_plugins_engine_get_default ()),
                                    PLUMA_TYPE_VIEW_ACTIVATABLE,
                                    "view", view,
                                    NULL);


    /* Act on buffer change */
    g_signal_connect (view,
                      "notify::buffer",
                      G_CALLBACK (on_notify_buffer_cb),
                      NULL);
}

static void
pluma_view_dispose (GObject *object)
{
    PlumaView *view;

    view = PLUMA_VIEW (object);

    if (view->priv->extensions != NULL)
    {
        g_object_unref (view->priv->extensions);
        view->priv->extensions = NULL;
    }

    if (view->priv->search_window != NULL)
    {
        gtk_widget_destroy (view->priv->search_window);
        view->priv->search_window = NULL;
        view->priv->search_entry = NULL;

        if (view->priv->typeselect_flush_timeout != 0)
        {
            g_source_remove (view->priv->typeselect_flush_timeout);
            view->priv->typeselect_flush_timeout = 0;
        }
    }

    g_clear_object (&view->priv->editor_settings);
    g_clear_object (&view->priv->interface_settings);

    /* Disconnect notify buffer because the destroy of the textview will
       set the buffer to NULL, and we call get_buffer in the notify which
       would reinstate a GtkTextBuffer which we don't want */
    current_buffer_removed (view);
    g_signal_handlers_disconnect_by_func (view, on_notify_buffer_cb, NULL);

    g_clear_object (&view->priv->css_provider);
    g_clear_pointer (&view->priv->font_desc, pango_font_description_free);

    (* G_OBJECT_CLASS (pluma_view_parent_class)->dispose) (object);
}

static void
pluma_view_finalize (GObject *object)
{
    PlumaView *view;

    view = PLUMA_VIEW (object);

    current_buffer_removed (view);

    g_free (view->priv->old_search_text);

    (* G_OBJECT_CLASS (pluma_view_parent_class)->finalize) (object);
}

static gint
pluma_view_focus_out (GtkWidget *widget, GdkEventFocus *event)
{
    PlumaView *view = PLUMA_VIEW (widget);

    gtk_widget_queue_draw (widget);

    /* hide interactive search dialog */
    if (view->priv->search_window != NULL)
        hide_search_window (view, FALSE);

    (* GTK_WIDGET_CLASS (pluma_view_parent_class)->focus_out_event) (widget, event);

    return FALSE;
}

/**
 * pluma_view_new:
 * @doc: a #PlumaDocument
 *
 * Creates a new #PlumaView object displaying the @doc document.
 * @doc cannot be %NULL.
 *
 * Return value: a new #PlumaView
 **/
GtkWidget *
pluma_view_new (PlumaDocument *doc)
{
    GtkWidget *view;

    pluma_debug_message (DEBUG_VIEW, "START");

    g_return_val_if_fail (PLUMA_IS_DOCUMENT (doc), NULL);

    view = GTK_WIDGET (g_object_new (PLUMA_TYPE_VIEW, "buffer", doc, NULL));

    pluma_debug_message (DEBUG_VIEW, "END: %d", G_OBJECT (view)->ref_count);

    gtk_widget_show_all (view);

    return view;
}

void
pluma_view_cut_clipboard (PlumaView *view)
{
    GtkTextBuffer *buffer;
    GtkClipboard *clipboard;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    clipboard = gtk_widget_get_clipboard (GTK_WIDGET (view),
                          GDK_SELECTION_CLIPBOARD);

    /* FIXME: what is default editability of a buffer? */
      gtk_text_buffer_cut_clipboard (buffer,
                                     clipboard,
                                     !pluma_document_get_readonly (PLUMA_DOCUMENT (buffer)));

    gtk_text_view_scroll_to_mark (GTK_TEXT_VIEW (view),
                                  gtk_text_buffer_get_insert (buffer),
                                  PLUMA_VIEW_SCROLL_MARGIN,
                                  FALSE,
                                  0.0,
                                  0.0);
}

void
pluma_view_copy_clipboard (PlumaView *view)
{
    GtkTextBuffer *buffer;
    GtkClipboard *clipboard;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    clipboard = gtk_widget_get_clipboard (GTK_WIDGET (view), GDK_SELECTION_CLIPBOARD);

    gtk_text_buffer_copy_clipboard (buffer, clipboard);

    /* on copy do not scroll, we are already on screen */
}

void
pluma_view_paste_clipboard (PlumaView *view)
{
    GtkTextBuffer *buffer;
    GtkClipboard *clipboard;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    clipboard = gtk_widget_get_clipboard (GTK_WIDGET (view), GDK_SELECTION_CLIPBOARD);

    /* FIXME: what is default editability of a buffer? */
    gtk_text_buffer_paste_clipboard (buffer,
                                     clipboard,
                                     NULL,
                                     !pluma_document_get_readonly (PLUMA_DOCUMENT (buffer)));

    gtk_text_view_scroll_to_mark (GTK_TEXT_VIEW (view),
                                  gtk_text_buffer_get_insert (buffer),
                                  PLUMA_VIEW_SCROLL_MARGIN,
                                  FALSE,
                                  0.0,
                                  0.0);
}

/**
 * pluma_view_delete_selection:
 * @view: a #PlumaView
 *
 * Deletes the text currently selected in the #GtkTextBuffer associated
 * to the view and scroll to the cursor position.
 **/
void
pluma_view_delete_selection (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    /* FIXME: what is default editability of a buffer? */
    gtk_text_buffer_delete_selection (buffer,
                                      TRUE,
                                      !pluma_document_get_readonly (PLUMA_DOCUMENT (buffer)));

    gtk_text_view_scroll_to_mark (GTK_TEXT_VIEW (view),
                                  gtk_text_buffer_get_insert (buffer),
                                  PLUMA_VIEW_SCROLL_MARGIN,
                                  FALSE,
                                  0.0,
                                  0.0);
}

void
pluma_view_upper_case_selection (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;
    GtkTextIter start, end;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, &start, &end))
    {
        gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_UPPER, &start, &end);
    }
}

void
pluma_view_lower_case_selection (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;
    GtkTextIter start, end;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, &start, &end))
    {
        gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_LOWER, &start, &end);
    }
}

void
pluma_view_invert_case_selection (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;
    GtkTextIter start, end;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, &start, &end))
    {
        gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_TOGGLE, &start, &end);
    }
}

void
pluma_view_title_case_selection (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;
    GtkTextIter start, end;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, &start, &end))
    {
        gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_TITLE, &start, &end);
    }
}

/**
 * pluma_view_select_all:
 * @view: a #PlumaView
 *
 * Selects all the text displayed in the @view.
 **/
void
pluma_view_select_all (PlumaView *view)
{
    GtkTextBuffer *buffer = NULL;
    GtkTextIter start, end;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    gtk_text_buffer_get_bounds (buffer, &start, &end);
    gtk_text_buffer_select_range (buffer, &start, &end);
}

/**
 * pluma_view_scroll_to_cursor:
 * @view: a #PlumaView
 *
 * Scrolls the @view to the cursor position.
 **/
void
pluma_view_scroll_to_cursor (PlumaView *view)
{
    GtkTextBuffer* buffer = NULL;

    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));
    g_return_if_fail (buffer != NULL);

    gtk_text_view_scroll_to_mark (GTK_TEXT_VIEW (view),
                                  gtk_text_buffer_get_insert (buffer),
                                  0.25,
                                  FALSE,
                                  0.0,
                                  0.0);
}

static void
update_css_provider (PlumaView *view)
{
    gchar *str;
    gchar *css;

    g_assert (PLUMA_IS_VIEW (view));
    g_assert (view->priv->font_desc != NULL);

    str = pluma_pango_font_description_to_css (view->priv->font_desc);
    css = g_strdup_printf ("textview { %s }", str ? str : "");
    gtk_css_provider_load_from_data (view->priv->css_provider, css, -1, NULL);

    g_free (css);
    g_free (str);
}

/* FIXME this is an issue for introspection */
/**
 * pluma_view_set_font:
 * @view: a #PlumaView
 * @def: whether to reset the default font
 * @font_name: the name of the font to use
 *
 * If @def is #TRUE, resets the font of the @view to the default font
 * otherwise sets it to @font_name.
 **/
void
pluma_view_set_font (PlumaView   *view,
                     gboolean     def,
                     const gchar *font_name)
{
    pluma_debug (DEBUG_VIEW);

    g_return_if_fail (PLUMA_IS_VIEW (view));

    g_clear_pointer (&view->priv->font_desc, pango_font_description_free);

    if (def)
    {
        PlumaSettings *settings;
        gchar *font;

        settings = _pluma_settings_get_singleton ();
        font = pluma_settings_get_system_font (settings);
        view->priv->font_desc = pango_font_description_from_string (font);
        g_free (font);
    }
    else
    {
        g_return_if_fail (font_name != NULL);

        view->priv->font_desc = pango_font_description_from_string (font_name);
    }

    g_return_if_fail (view->priv->font_desc != NULL);

    update_css_provider (view);
}

static void
add_search_completion_entry (const gchar *str)
{
    gchar        *text;
    gboolean      valid;
    GtkTreeModel *model;
    GtkTreeIter   iter;

    if (str == NULL)
        return;

    text = pluma_utils_unescape_search_text (str);

    if (g_utf8_strlen (text, -1) < MIN_SEARCH_COMPLETION_KEY_LEN)
    {
        g_free (text);
        return;
    }

    g_return_if_fail (GTK_IS_TREE_MODEL (search_completion_model));

    model = GTK_TREE_MODEL (search_completion_model);

    /* Get the first iter in the list */
    valid = gtk_tree_model_get_iter_first (model, &iter);

    while (valid)
    {
        /* Walk through the list, reading each row */
        gchar *str_data;

        gtk_tree_model_get (model,
                            &iter,
                            0,
                            &str_data,
                            -1);

        if (strcmp (text, str_data) == 0)
        {
            g_free (text);
            g_free (str_data);
            gtk_list_store_move_after (GTK_LIST_STORE (model),
                                       &iter,
                                       NULL);

            return;
        }

        g_free (str_data);

        valid = gtk_tree_model_iter_next (model, &iter);
    }

    gtk_list_store_prepend (GTK_LIST_STORE (model), &iter);
    gtk_list_store_set (GTK_LIST_STORE (model),
                        &iter,
                        0,
                        text,
                        -1);

    g_free (text);
}

static void
set_entry_state (GtkWidget             *entry,
                 PlumaSearchEntryState  state)
{
    GtkStyleContext *context = gtk_widget_get_style_context (GTK_WIDGET (entry));

    if (state == PLUMA_SEARCH_ENTRY_NOT_FOUND)
    {
        gtk_style_context_add_class (context, GTK_STYLE_CLASS_ERROR);
    }
    else /* reset */
    {
        gtk_style_context_remove_class (context, GTK_STYLE_CLASS_ERROR);
    }
}

static gboolean
run_search (PlumaView        *view,
            const gchar      *entry_text,
            gboolean          search_backward,
            gboolean          wrap_around,
            gboolean          typing)
{
    GtkTextIter    start_iter;
    GtkTextIter    match_start;
    GtkTextIter    match_end;
    gboolean       found = FALSE;
    PlumaDocument *doc;

    g_return_val_if_fail (view->priv->search_mode == SEARCH, FALSE);

    doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));

    start_iter = view->priv->start_search_iter;

    if (*entry_text != '\0')
    {
        if (!search_backward)
        {
            if (!typing)
            {
                /* forward and _NOT_ typing */
                gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc),
                                                      &start_iter,
                                                      &match_end);

                gtk_text_iter_order (&match_end, &start_iter);
            }

            /* run search */
            found = pluma_document_search_forward (doc,
                                                   &start_iter,
                                                   NULL,
                                                   &match_start,
                                                   &match_end);
        }
        else if (!typing)
        {
            /* backward and not typing */
            gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc),
                                                  &start_iter,
                                                  &match_end);

            /* run search */
            found = pluma_document_search_backward (doc,
                                                    NULL,
                                                    &start_iter,
                                                    &match_start,
                                                    &match_end);
        }
        else
        {
            /* backward (while typing) */
            g_return_val_if_reached (FALSE);

        }

        if (!found && wrap_around)
        {
            if (!search_backward)
                found = pluma_document_search_forward (doc,
                                                       NULL,
                                                       NULL, /* FIXME: set the end_inter */
                                                       &match_start,
                                                       &match_end);
            else
                found = pluma_document_search_backward (doc,
                                                        NULL, /* FIXME: set the start_inter */
                                                        NULL,
                                                        &match_start,
                                                        &match_end);
        }
    }
    else
    {
        gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc),
                                              &start_iter,
                                              NULL);
    }

    if (found)
    {
        gtk_text_buffer_place_cursor (GTK_TEXT_BUFFER (doc), &match_start);

        gtk_text_buffer_move_mark_by_name (GTK_TEXT_BUFFER (doc),
                                           "selection_bound",
                                           &match_end);
    }
    else
    {
        if (typing)
        {
            gtk_text_buffer_place_cursor (GTK_TEXT_BUFFER (doc),
                                          &view->priv->start_search_iter);
        }
    }

    if (found || (*entry_text == '\0'))
    {
        pluma_view_scroll_to_cursor (view);

        set_entry_state (view->priv->search_entry,
                         PLUMA_SEARCH_ENTRY_NORMAL);
    }
    else
    {
        set_entry_state (view->priv->search_entry,
                         PLUMA_SEARCH_ENTRY_NOT_FOUND);
    }

    return found;
}

/* Cut and paste from gtkwindow.c */
static void
send_focus_change (GtkWidget *widget,
                   gboolean   in)
{
    GdkEvent *fevent = gdk_event_new (GDK_FOCUS_CHANGE);

    g_object_ref (widget);

    fevent->focus_change.type = GDK_FOCUS_CHANGE;
    fevent->focus_change.window = g_object_ref (gtk_widget_get_window (widget));
    fevent->focus_change.in = in;

    gtk_widget_event (widget, fevent);

    g_object_notify (G_OBJECT (widget), "has-focus");

    g_object_unref (widget);
    gdk_event_free (fevent);
}

static void
hide_search_window (PlumaView *view, gboolean cancel)
{
    if (view->priv->disable_popdown)
        return;

    if (view->priv->search_entry_changed_id != 0)
    {
        g_signal_handler_disconnect (view->priv->search_entry,
                                     view->priv->search_entry_changed_id);
        view->priv->search_entry_changed_id = 0;
    }

    if (view->priv->typeselect_flush_timeout != 0)
    {
        g_source_remove (view->priv->typeselect_flush_timeout);
        view->priv->typeselect_flush_timeout = 0;
    }

    /* send focus-in event */
    send_focus_change (GTK_WIDGET (view->priv->search_entry), FALSE);
    gtk_text_view_set_cursor_visible (GTK_TEXT_VIEW (view), TRUE);
    gtk_widget_hide (view->priv->search_window);

    if (cancel)
    {
        GtkTextBuffer *buffer;

        buffer = GTK_TEXT_BUFFER (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));
        gtk_text_buffer_place_cursor (buffer, &view->priv->start_search_iter);

        pluma_view_scroll_to_cursor (view);
    }

    /* make sure a focus event is sent for the edit area */
    send_focus_change (GTK_WIDGET (view), TRUE);
}

static gboolean
search_entry_flush_timeout (PlumaView *view)
{
    view->priv->typeselect_flush_timeout = 0;
    hide_search_window (view, FALSE);

    return FALSE;
}

static void
update_search_window_position (PlumaView *view)
{
    gint x, y;
    gint view_x, view_y;
    GdkWindow *view_window = gtk_widget_get_window (GTK_WIDGET (view));

    gtk_widget_realize (view->priv->search_window);

    gdk_window_get_origin (view_window, &view_x, &view_y);

    x = MAX (12, view_x + 12);
    y = MAX (12, view_y - 12);

    gtk_window_move (GTK_WINDOW (view->priv->search_window), x, y);
}

static gboolean
search_window_delete_event (GtkWidget   *widget,
                            GdkEventAny *event,
                            PlumaView   *view)
{
    hide_search_window (view, FALSE);

    return TRUE;
}

static gboolean
search_window_button_press_event (GtkWidget      *widget,
                                  GdkEventButton *event,
                                  PlumaView      *view)
{
    hide_search_window (view, FALSE);

    gtk_propagate_event (GTK_WIDGET (view), (GdkEvent *)event);

    return FALSE;
}

static void
search_again (PlumaView *view,
              gboolean   search_backward)
{
    const gchar *entry_text;

    g_return_if_fail (view->priv->search_mode == SEARCH);

    /* SEARCH mode */
    /* renew the flush timeout */
    if (view->priv->typeselect_flush_timeout != 0)
    {
        g_source_remove (view->priv->typeselect_flush_timeout);
        view->priv->typeselect_flush_timeout =
            g_timeout_add (PLUMA_VIEW_SEARCH_DIALOG_TIMEOUT,
                           (GSourceFunc)search_entry_flush_timeout,
                           view);
    }

    entry_text = gtk_entry_get_text (GTK_ENTRY (view->priv->search_entry));

    add_search_completion_entry (entry_text);

    run_search (view,
                entry_text,
                search_backward,
                view->priv->wrap_around,
                FALSE);
}

static gboolean
search_window_scroll_event (GtkWidget      *widget,
                            GdkEventScroll *event,
                            PlumaView      *view)
{
    gboolean retval = FALSE;

    if (view->priv->search_mode == GOTO_LINE)
        return retval;

    /* SEARCH mode */
    if (event->direction == GDK_SCROLL_UP)
    {
        search_again (view, TRUE);
        retval = TRUE;
    }
    else if (event->direction == GDK_SCROLL_DOWN)
    {
        search_again (view, FALSE);
        retval = TRUE;
    }

    return retval;
}

static gboolean
search_window_key_press_event (GtkWidget   *widget,
                               GdkEventKey *event,
                               PlumaView   *view)
{
    gboolean retval = FALSE;
    guint modifiers;

    modifiers = gtk_accelerator_get_default_mod_mask ();

    /* Close window */
    if (event->keyval == GDK_KEY_Tab)
    {
        hide_search_window (view, FALSE);
        retval = TRUE;
    }

    /* Close window and cancel the search */
    if (event->keyval == GDK_KEY_Escape)
    {
        if (view->priv->search_mode == SEARCH)
        {
            PlumaDocument *doc;

            /* restore document search so that Find Next does the right thing */
            doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));
            pluma_document_set_search_text (doc,
                                            view->priv->old_search_text,
                                            view->priv->old_search_flags);

        }

        hide_search_window (view, TRUE);
        retval = TRUE;
    }

    if (view->priv->search_mode == GOTO_LINE)
        return retval;

    /* SEARCH mode */

    /* select previous matching iter */
    if (event->keyval == GDK_KEY_Up || event->keyval == GDK_KEY_KP_Up)
    {
        search_again (view, TRUE);
        retval = TRUE;
    }

    if (((event->state & modifiers) == (GDK_CONTROL_MASK | GDK_SHIFT_MASK)) &&
        (event->keyval == GDK_KEY_g || event->keyval == GDK_KEY_G))
    {
        search_again (view, TRUE);
        retval = TRUE;
    }

    /* select next matching iter */
    if (event->keyval == GDK_KEY_Down || event->keyval == GDK_KEY_KP_Down)
    {
        search_again (view, FALSE);
        retval = TRUE;
    }

    if (((event->state & modifiers) == GDK_CONTROL_MASK) &&
        (event->keyval == GDK_KEY_g || event->keyval == GDK_KEY_G))
    {
        search_again (view, FALSE);
        retval = TRUE;
    }

    return retval;
}

static void
search_entry_activate (GtkEntry  *entry,
                       PlumaView *view)
{
    hide_search_window (view, FALSE);
}

static void
wrap_around_menu_item_toggled (GtkCheckMenuItem *checkmenuitem,
                               PlumaView        *view)
{
    view->priv->wrap_around = gtk_check_menu_item_get_active (checkmenuitem);
}

static void
match_entire_word_menu_item_toggled (GtkCheckMenuItem *checkmenuitem,
                                     PlumaView        *view)
{
    PLUMA_SEARCH_SET_ENTIRE_WORD (view->priv->search_flags,
                                  gtk_check_menu_item_get_active (checkmenuitem));
}

static void
match_case_menu_item_toggled (GtkCheckMenuItem *checkmenuitem,
                              PlumaView        *view)
{
    PLUMA_SEARCH_SET_CASE_SENSITIVE (view->priv->search_flags,
                                     gtk_check_menu_item_get_active (checkmenuitem));
}

static void
parse_escapes_menu_item_toggled (GtkCheckMenuItem *checkmenuitem,
                                 PlumaView        *view)
{
    PLUMA_SEARCH_SET_PARSE_ESCAPES (view->priv->search_flags,
                                    gtk_check_menu_item_get_active (checkmenuitem));
}

static gboolean
real_search_enable_popdown (gpointer data)
{
    PlumaView *view = (PlumaView *)data;

    view->priv->disable_popdown = FALSE;

    return FALSE;
}

static void
search_enable_popdown (GtkWidget *widget,
                       PlumaView *view)
{
    g_timeout_add (200, real_search_enable_popdown, view);

    /* renew the flush timeout */
    if (view->priv->typeselect_flush_timeout != 0)
        g_source_remove (view->priv->typeselect_flush_timeout);

    view->priv->typeselect_flush_timeout =
        g_timeout_add (PLUMA_VIEW_SEARCH_DIALOG_TIMEOUT,
                       (GSourceFunc)search_entry_flush_timeout,
                       view);
}

static void
search_entry_populate_popup (GtkEntry  *entry,
                             GtkMenu   *menu,
                             PlumaView *view)
{
    GtkWidget *menu_item;

    view->priv->disable_popdown = TRUE;
    g_signal_connect (menu, "hide",
                      G_CALLBACK (search_enable_popdown), view);

    if (view->priv->search_mode == GOTO_LINE)
        return;

    /* separator */
    menu_item = gtk_menu_item_new ();
    gtk_menu_shell_prepend (GTK_MENU_SHELL (menu), menu_item);
    gtk_widget_show (menu_item);

    /* create "Wrap Around" menu item. */
    menu_item = gtk_check_menu_item_new_with_mnemonic (_("_Wrap Around"));
    g_signal_connect (G_OBJECT (menu_item), "toggled",
                      G_CALLBACK (wrap_around_menu_item_toggled),
                      view);
    gtk_menu_shell_prepend (GTK_MENU_SHELL (menu), menu_item);
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (menu_item),
                                    view->priv->wrap_around);
    gtk_widget_show (menu_item);

    /* create "Match Entire Word Only" menu item. */
    menu_item = gtk_check_menu_item_new_with_mnemonic (_("Match _Entire Word Only"));
    g_signal_connect (G_OBJECT (menu_item), "toggled",
                      G_CALLBACK (match_entire_word_menu_item_toggled),
                      view);
    gtk_menu_shell_prepend (GTK_MENU_SHELL (menu), menu_item);
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (menu_item),
                                    PLUMA_SEARCH_IS_ENTIRE_WORD (view->priv->search_flags));
    gtk_widget_show (menu_item);

    /* create "Match Case" menu item. */
    menu_item = gtk_check_menu_item_new_with_mnemonic (_("_Match Case"));
    g_signal_connect (G_OBJECT (menu_item), "toggled",
                      G_CALLBACK (match_case_menu_item_toggled),
                      view);
    gtk_menu_shell_prepend (GTK_MENU_SHELL (menu), menu_item);
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (menu_item),
                                    PLUMA_SEARCH_IS_CASE_SENSITIVE (view->priv->search_flags));
    gtk_widget_show (menu_item);

    /* create "Parse escapes" menu item. */
    menu_item = gtk_check_menu_item_new_with_mnemonic (_("_Parse escape sequences (e.g. \n)"));
    g_signal_connect (G_OBJECT (menu_item), "toggled",
                      G_CALLBACK (parse_escapes_menu_item_toggled),
                      view);
    gtk_menu_shell_prepend (GTK_MENU_SHELL (menu), menu_item);
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (menu_item),
                                    PLUMA_SEARCH_IS_PARSE_ESCAPES (view->priv->search_flags));
    gtk_widget_show (menu_item);
}

static void
search_entry_insert_text (GtkEditable *editable,
                          const gchar *text,
                          gint         length,
                          gint        *position,
                          PlumaView   *view)
{
    if (view->priv->search_mode == GOTO_LINE)
    {
        gunichar c;
        const gchar *p;
        const gchar *end;
        const gchar *next;

        p = text;
        end = text + length;

        if (p == end)
            return;

        c = g_utf8_get_char (p);

        if (((c == '-' || c == '+') && *position == 0) ||
            (c == ':' && *position != 0))
        {
            gchar *s = NULL;

            if (c == ':')
            {
                s = gtk_editable_get_chars (editable, 0, -1);
                s = g_utf8_strchr (s, -1, ':');
            }

            if (s == NULL || s == p)
            {
                next = g_utf8_next_char (p);
                p = next;
            }

            g_free (s);
        }

        while (p != end)
        {
            next = g_utf8_next_char (p);

            c = g_utf8_get_char (p);

            if (!g_unichar_isdigit (c)) {
                g_signal_stop_emission_by_name (editable, "insert_text");
                gtk_widget_error_bell (view->priv->search_entry);
                break;
            }

            p = next;
        }
    }
    else
    {
        /* SEARCH mode */
        static gboolean  insert_text = FALSE;
        gchar           *escaped_text;
        gint             new_len;

        pluma_debug_message (DEBUG_SEARCH, "Text: %s", text);

        /* To avoid recursive behavior */
        if (insert_text)
            return;

        escaped_text = pluma_utils_escape_search_text (text);

        pluma_debug_message (DEBUG_SEARCH, "Escaped Text: %s", escaped_text);

        new_len = strlen (escaped_text);

        if (new_len == length)
        {
            g_free (escaped_text);
            return;
        }

        insert_text = TRUE;

        g_signal_stop_emission_by_name (editable, "insert_text");

        gtk_editable_insert_text (editable, escaped_text, new_len, position);

        insert_text = FALSE;

        g_free (escaped_text);
    }
}

static void
customize_for_search_mode (PlumaView *view)
{
    if (view->priv->search_mode == SEARCH)
    {
        gtk_entry_set_icon_from_icon_name (GTK_ENTRY (view->priv->search_entry),
                                           GTK_ENTRY_ICON_PRIMARY,
                                           "edit-find");

        gtk_widget_set_tooltip_text (view->priv->search_entry,
                                     _("String you want to search for"));
    }
    else
    {
        gtk_entry_set_icon_from_icon_name (GTK_ENTRY (view->priv->search_entry),
                                           GTK_ENTRY_ICON_PRIMARY,
                                           "go-jump");

        gtk_widget_set_tooltip_text (view->priv->search_entry,
                                     _("Line you want to move the cursor to"));
    }
}

static gboolean
completion_func (GtkEntryCompletion *completion,
                 const char         *key,
                 GtkTreeIter        *iter,
                 gpointer            data)
{
    gchar *item = NULL;
    gboolean ret = FALSE;
    GtkTreeModel *model;
    PlumaViewPrivate *priv = (PlumaViewPrivate *)data;
    const gchar *real_key;

    if (priv->search_mode == GOTO_LINE)
        return FALSE;

    real_key = gtk_entry_get_text (GTK_ENTRY (gtk_entry_completion_get_entry (completion)));

    if (g_utf8_strlen (real_key, -1) <= MIN_SEARCH_COMPLETION_KEY_LEN)
        return FALSE;

    model = gtk_entry_completion_get_model (completion);
    g_return_val_if_fail (gtk_tree_model_get_column_type (model, 0) == G_TYPE_STRING,
                          FALSE);

    gtk_tree_model_get (model,
                        iter,
                        0,
                        &item,
                        -1);

    if (item == NULL)
        return FALSE;

    if (PLUMA_SEARCH_IS_CASE_SENSITIVE (priv->search_flags))
    {
        if (!strncmp (real_key, item, strlen (real_key)))
            ret = TRUE;
    }
    else
    {
        gchar *normalized_string;
        gchar *case_normalized_string;

        normalized_string = g_utf8_normalize (item, -1, G_NORMALIZE_ALL);
        case_normalized_string = g_utf8_casefold (normalized_string, -1);

        if (!strncmp (key, case_normalized_string, strlen (key)))
            ret = TRUE;

        g_free (normalized_string);
        g_free (case_normalized_string);

    }

    g_free (item);

    return ret;
}

static void
ensure_search_window (PlumaView *view)
{
    GtkWidget          *frame;
    GtkWidget          *vbox;
    GtkWidget          *toplevel;
    GtkEntryCompletion *completion;
    GtkWindowGroup     *group;
    GtkWindowGroup     *search_group;

    toplevel = gtk_widget_get_toplevel (GTK_WIDGET (view));
    group = gtk_window_get_group (GTK_WINDOW (toplevel));
    if (view->priv->search_window != NULL)
        search_group = gtk_window_get_group (GTK_WINDOW (view->priv->search_window));

    if (view->priv->search_window != NULL)
    {
        if (group)
            gtk_window_group_add_window (group,
                                         GTK_WINDOW (view->priv->search_window));
        else if (search_group)
             gtk_window_group_remove_window (search_group,
                                             GTK_WINDOW (view->priv->search_window));

        customize_for_search_mode (view);

        return;
    }

    view->priv->search_window = gtk_window_new (GTK_WINDOW_POPUP);

    if (group)
        gtk_window_group_add_window (group,
                                     GTK_WINDOW (view->priv->search_window));

    gtk_window_set_modal (GTK_WINDOW (view->priv->search_window), TRUE);

    g_signal_connect (view->priv->search_window, "delete_event",
                      G_CALLBACK (search_window_delete_event),
                      view);
    g_signal_connect (view->priv->search_window, "key_press_event",
                      G_CALLBACK (search_window_key_press_event),
                      view);
    g_signal_connect (view->priv->search_window, "button_press_event",
                      G_CALLBACK (search_window_button_press_event),
                      view);
    g_signal_connect (view->priv->search_window, "scroll_event",
                      G_CALLBACK (search_window_scroll_event),
                      view);

    frame = gtk_frame_new (NULL);
    gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_ETCHED_IN);
    gtk_widget_show (frame);
    gtk_container_add (GTK_CONTAINER (view->priv->search_window), frame);

    vbox = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_show (vbox);
    gtk_container_add (GTK_CONTAINER (frame), vbox);
    gtk_container_set_border_width (GTK_CONTAINER (vbox), 3);

    /* add entry */
    view->priv->search_entry = gtk_entry_new ();
    gtk_widget_show (view->priv->search_entry);

    g_signal_connect (view->priv->search_entry, "populate_popup",
                      G_CALLBACK (search_entry_populate_popup),
                      view);
    g_signal_connect (view->priv->search_entry, "activate",
                      G_CALLBACK (search_entry_activate),
                      view);
    g_signal_connect (view->priv->search_entry,
                      "insert_text",
                      G_CALLBACK (search_entry_insert_text),
                      view);

    gtk_container_add (GTK_CONTAINER (vbox),
                       view->priv->search_entry);

    if (search_completion_model == NULL)
    {
        /* Create a tree model and use it as the completion model */
        search_completion_model = gtk_list_store_new (1, G_TYPE_STRING);
    }

    /* Create the completion object for the search entry */
    completion = gtk_entry_completion_new ();
    gtk_entry_completion_set_model (completion,
                                    GTK_TREE_MODEL (search_completion_model));

    /* Use model column 0 as the text column */
    gtk_entry_completion_set_text_column (completion, 0);

    gtk_entry_completion_set_minimum_key_length (completion,
                                                 MIN_SEARCH_COMPLETION_KEY_LEN);

    gtk_entry_completion_set_popup_completion (completion, FALSE);
    gtk_entry_completion_set_inline_completion (completion, TRUE);

    gtk_entry_completion_set_match_func (completion,
                                         completion_func,
                                         view->priv,
                                         NULL);

    /* Assign the completion to the entry */
    gtk_entry_set_completion (GTK_ENTRY (view->priv->search_entry),
                              completion);
    g_object_unref (completion);

    gtk_widget_realize (view->priv->search_entry);

    customize_for_search_mode (view);
}

static gboolean
get_selected_text (GtkTextBuffer *doc, gchar **selected_text, gint *len)
{
    GtkTextIter start, end;

    g_return_val_if_fail (selected_text != NULL, FALSE);
    g_return_val_if_fail (*selected_text == NULL, FALSE);

    if (!gtk_text_buffer_get_selection_bounds (doc, &start, &end))
    {
        if (len != NULL)
            len = 0;

        return FALSE;
    }

    *selected_text = gtk_text_buffer_get_slice (doc, &start, &end, TRUE);

    if (len != NULL)
        *len = g_utf8_strlen (*selected_text, -1);

    return TRUE;
}

static void
init_search_entry (PlumaView *view)
{
    GtkTextBuffer *buffer;

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));

    if (view->priv->search_mode == GOTO_LINE)
    {
        gint   line;
        gchar *line_str;

        line = gtk_text_iter_get_line (&view->priv->start_search_iter);

        line_str = g_strdup_printf ("%d", line + 1);

        gtk_entry_set_text (GTK_ENTRY (view->priv->search_entry),
                            line_str);

        g_free (line_str);

        return;
    }
    else
    {
        /* SEARCH mode */
        gboolean  selection_exists;
        gchar    *find_text = NULL;
        gchar    *old_find_text;
        guint     old_find_flags = 0;
        gint      sel_len = 0;

        old_find_text = pluma_document_get_search_text (PLUMA_DOCUMENT (buffer),
                                                        &old_find_flags);
        if (old_find_text != NULL)
        {
            g_free (view->priv->old_search_text);
            view->priv->old_search_text = old_find_text;
            add_search_completion_entry (old_find_text);
        }

        if (old_find_flags != 0)
        {
            view->priv->old_search_flags = old_find_flags;
        }

        selection_exists = get_selected_text (buffer,
                                              &find_text,
                                              &sel_len);

        if (selection_exists  && (find_text != NULL) && (sel_len <= 160))
        {
            gtk_entry_set_text (GTK_ENTRY (view->priv->search_entry), find_text);
        }
        else
        {
            gtk_entry_set_text (GTK_ENTRY (view->priv->search_entry), "");
        }

        g_free (find_text);
    }
}

static void
search_init (GtkWidget *entry,
             PlumaView *view)
{
    PlumaDocument *doc;
    const gchar *entry_text;

    /* renew the flush timeout */
    if (view->priv->typeselect_flush_timeout != 0)
    {
        g_source_remove (view->priv->typeselect_flush_timeout);
        view->priv->typeselect_flush_timeout =
            g_timeout_add (PLUMA_VIEW_SEARCH_DIALOG_TIMEOUT,
                           (GSourceFunc)search_entry_flush_timeout,
                           view);
    }

    doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));

    entry_text = gtk_entry_get_text (GTK_ENTRY (entry));

    if (view->priv->search_mode == SEARCH)
    {
        gchar *search_text;
        guint  search_flags;

        search_text = pluma_document_get_search_text (doc, &search_flags);

        if ((search_text == NULL) ||
            (strcmp (search_text, entry_text) != 0) ||
             search_flags != view->priv->search_flags)
        {
            pluma_document_set_search_text (doc,
                                            entry_text,
                                            view->priv->search_flags);
        }

        g_free (search_text);

        run_search (view,
                    entry_text,
                    FALSE,
                    view->priv->wrap_around,
                    TRUE);
    }
    else
    {
        if (*entry_text != '\0')
        {
            gboolean moved, moved_offset;
            gint line;
            gint offset_line = 0;
            gint line_offset = 0;
            gchar **split_text = NULL;
            const gchar *text;

            split_text = g_strsplit (entry_text, ":", -1);

            if (g_strv_length (split_text) > 1)
            {
                text = split_text[0];
            }
            else
            {
                text = entry_text;
            }

            if (*text == '-')
            {
                gint cur_line = gtk_text_iter_get_line (&view->priv->start_search_iter);

                if (*(text + 1) != '\0')
                    offset_line = MAX (atoi (text + 1), 0);

                line = MAX (cur_line - offset_line, 0);
            }
            else if (*entry_text == '+')
            {
                gint cur_line = gtk_text_iter_get_line (&view->priv->start_search_iter);

                if (*(text + 1) != '\0')
                    offset_line = MAX (atoi (text + 1), 0);

                line = cur_line + offset_line;
            }
            else
            {
                line = MAX (atoi (text) - 1, 0);
            }

            if (split_text[1] != NULL)
            {
                line_offset = atoi (split_text[1]);
            }

            g_strfreev (split_text);

            moved = pluma_document_goto_line (doc, line);
            moved_offset = pluma_document_goto_line_offset (doc, line, line_offset);

            pluma_view_scroll_to_cursor (view);

            if (!moved || !moved_offset)
                set_entry_state (view->priv->search_entry,
                                 PLUMA_SEARCH_ENTRY_NOT_FOUND);
            else
                set_entry_state (view->priv->search_entry,
                                 PLUMA_SEARCH_ENTRY_NORMAL);
        }
    }
}

static gboolean
start_interactive_search_real (PlumaView *view)
{
    GtkTextBuffer *buffer;

    if ((view->priv->search_window != NULL) &&
        gtk_widget_get_visible (view->priv->search_window))
        return TRUE;

    if (!gtk_widget_has_focus (GTK_WIDGET (view)))
        return FALSE;

    buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));

    if (view->priv->search_mode == SEARCH)
        gtk_text_buffer_get_selection_bounds (buffer, &view->priv->start_search_iter, NULL);
    else
        gtk_text_buffer_get_iter_at_mark (buffer,
                                          &view->priv->start_search_iter,
                                          gtk_text_buffer_get_insert (buffer));

    ensure_search_window (view);

    /* done, show it */
    update_search_window_position (view);
    gtk_widget_show (view->priv->search_window);

    if (view->priv->search_entry_changed_id == 0)
    {
          view->priv->search_entry_changed_id =
          g_signal_connect (view->priv->search_entry,
                            "changed",
                            G_CALLBACK (search_init),
                            view);
    }

    init_search_entry (view);

    view->priv->typeselect_flush_timeout =
        g_timeout_add (PLUMA_VIEW_SEARCH_DIALOG_TIMEOUT,
                       (GSourceFunc) search_entry_flush_timeout,
                       view);

    gtk_text_view_set_cursor_visible (GTK_TEXT_VIEW (view), FALSE);
    gtk_widget_grab_focus (view->priv->search_entry);

    send_focus_change (view->priv->search_entry, TRUE);

    return TRUE;
}

static gboolean
reset_searched_text (PlumaView *view)
{
    PlumaDocument *doc;

    doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (GTK_TEXT_VIEW (view)));

    pluma_document_set_search_text (doc, "", PLUMA_SEARCH_DONT_SET_FLAGS);

    return TRUE;
}

static gboolean
start_interactive_search (PlumaView *view)
{
    view->priv->search_mode = SEARCH;

    return start_interactive_search_real (view);
}

static gboolean
start_interactive_goto_line (PlumaView *view)
{
    view->priv->search_mode = GOTO_LINE;

    return start_interactive_search_real (view);
}

static gboolean
pluma_view_draw (GtkWidget *widget,
                 cairo_t   *cr)
{
    GtkTextView *text_view;
    PlumaDocument *doc;
    GdkWindow *window;

    text_view = GTK_TEXT_VIEW (widget);

    doc = PLUMA_DOCUMENT (gtk_text_view_get_buffer (text_view));
    window = gtk_text_view_get_window (text_view, GTK_TEXT_WINDOW_TEXT);

    if (gtk_cairo_should_draw_window (cr, window) &&
        pluma_document_get_enable_search_highlighting (doc))
    {
        GdkRectangle visible_rect;
        GtkTextIter iter1, iter2;

        gtk_text_view_get_visible_rect (text_view, &visible_rect);
        gtk_text_view_get_line_at_y (text_view, &iter1,
                                     visible_rect.y, NULL);
        gtk_text_view_get_line_at_y (text_view, &iter2,
                                     visible_rect.y
                                     + visible_rect.height, NULL);
        gtk_text_iter_forward_line (&iter2);

        _pluma_document_search_region (doc,
                                       &iter1,
                                       &iter2);
    }

    return GTK_WIDGET_CLASS (pluma_view_parent_class)->draw (widget, cr);
}

static GdkAtom
drag_get_uri_target (GtkWidget      *widget,
                     GdkDragContext *context)
{
    GdkAtom target;
    GtkTargetList *tl;

    tl = gtk_target_list_new (NULL, 0);
    gtk_target_list_add_uri_targets (tl, 0);

    target = gtk_drag_dest_find_target (widget, context, tl);
    gtk_target_list_unref (tl);

    return target;
}

static gboolean
pluma_view_drag_motion (GtkWidget      *widget,
                        GdkDragContext *context,
                        gint            x,
                        gint            y,
                        guint           timestamp)
{
    gboolean result;

    /* Chain up to allow textview to scroll and position dnd mark, note
     * that this needs to be checked if gtksourceview or gtktextview
     * changes drag_motion behaviour */
    result = GTK_WIDGET_CLASS (pluma_view_parent_class)->drag_motion (widget, context, x, y, timestamp);

    /* If this is a URL, deal with it here */
    if (drag_get_uri_target (widget, context) != GDK_NONE)
    {
        gdk_drag_status (context,
                         gdk_drag_context_get_suggested_action (context),
                         timestamp);
        result = TRUE;
    }

    return result;
}

static void
pluma_view_drag_data_received (GtkWidget        *widget,
                               GdkDragContext   *context,
                               gint              x,
                               gint              y,
                               GtkSelectionData *selection_data,
                               guint             info,
                               guint             timestamp)
{
    gchar **uri_list;

    /* If this is an URL emit DROP_URIS, otherwise chain up the signal */
    if (info == TARGET_URI_LIST)
    {
        uri_list = pluma_utils_drop_get_uris (selection_data);

        if (uri_list != NULL)
        {
            g_signal_emit (widget, view_signals[DROP_URIS], 0, uri_list);
            g_strfreev (uri_list);

            gtk_drag_finish (context, TRUE, FALSE, timestamp);
        }
    }
    else
    {
        GTK_WIDGET_CLASS (pluma_view_parent_class)->drag_data_received (widget, context, x, y, selection_data, info, timestamp);
    }
}

static gboolean
pluma_view_drag_drop (GtkWidget      *widget,
                      GdkDragContext *context,
                      gint            x,
                      gint            y,
                      guint           timestamp)
{
    gboolean result;
    GdkAtom target;

    /* If this is a URL, just get the drag data */
    target = drag_get_uri_target (widget, context);

    if (target != GDK_NONE)
    {
        gtk_drag_get_data (widget, context, target, timestamp);
        result = TRUE;
    }
    else
    {
        /* Chain up */
        result = GTK_WIDGET_CLASS (pluma_view_parent_class)->drag_drop (widget, context, x, y, timestamp);
    }

    return result;
}

static GtkWidget *
create_line_numbers_menu (GtkWidget *view)
{
    GtkWidget *menu;
    GtkWidget *item;

    menu = gtk_menu_new ();

    item = gtk_check_menu_item_new_with_mnemonic (_("_Display line numbers"));
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item),
                                    gtk_source_view_get_show_line_numbers (GTK_SOURCE_VIEW (view)));

    g_settings_bind (PLUMA_VIEW (view)->priv->editor_settings,
                     PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS,
                     item,
                     "active",
                     G_SETTINGS_BIND_SET);

    gtk_menu_shell_append (GTK_MENU_SHELL (menu), item);

    gtk_widget_show_all (menu);

    return menu;
}

static void
show_line_numbers_menu (GtkWidget      *view,
                        GdkEventButton *event)
{
    GtkWidget *menu;

    menu = create_line_numbers_menu (view);

    gtk_menu_popup_at_pointer (GTK_MENU (menu), NULL);
}

static void
extension_added (PeasExtensionSet *extensions,
                 PeasPluginInfo   *info,
                 PeasExtension    *exten,
                 PlumaView        *view)
{
    pluma_view_activatable_activate (PLUMA_VIEW_ACTIVATABLE (exten));
}

static void
extension_removed (PeasExtensionSet *extensions,
                   PeasPluginInfo   *info,
                   PeasExtension    *exten,
                   PlumaView        *view)
{
    pluma_view_activatable_deactivate (PLUMA_VIEW_ACTIVATABLE (exten));
}

static void
pluma_view_realize (GtkWidget *widget)
{
    PlumaView *view = PLUMA_VIEW (widget);

    GTK_WIDGET_CLASS (pluma_view_parent_class)->realize (widget);

    g_signal_connect (view->priv->extensions, "extension-added",
                      G_CALLBACK (extension_added),
                      view);
    g_signal_connect (view->priv->extensions, "extension-removed",
                      G_CALLBACK (extension_removed),
                      view);

    /* We only activate the extensions when the view is realized,
     * because most plugins will expect this behaviour, and we won't
     * change the buffer later anyway. */
    peas_extension_set_foreach (view->priv->extensions,
                                (PeasExtensionSetForeachFunc) extension_added,
                                view);
}

static void
pluma_view_unrealize (GtkWidget *widget)
{
    PlumaView *view = PLUMA_VIEW (widget);

    g_signal_handlers_disconnect_by_func (view->priv->extensions, extension_added, view);
    g_signal_handlers_disconnect_by_func (view->priv->extensions, extension_removed, view);

    /* We need to deactivate the extension on unrealize because it is not
       mandatory that a view has been realized when we dispose it, leading
       to deactivating the plugin without being activated */
    peas_extension_set_foreach (view->priv->extensions,
                                (PeasExtensionSetForeachFunc) extension_removed,
                                view);

    GTK_WIDGET_CLASS (pluma_view_parent_class)->unrealize (widget);
}


static gboolean
pluma_view_button_press_event (GtkWidget *widget, GdkEventButton *event)
{
    static gchar  *primtxt = "";

    gchar *txt_clip = gtk_clipboard_wait_for_text (gtk_clipboard_get (GDK_SELECTION_PRIMARY));

    if (txt_clip)
    {
        primtxt = g_strdup (txt_clip);
        g_free (txt_clip);
    }
    else
        gtk_clipboard_set_text (gtk_clipboard_get (GDK_SELECTION_PRIMARY), primtxt, strlen (primtxt));

    if ((event->type == GDK_BUTTON_PRESS) &&
        (event->window == gtk_text_view_get_window (GTK_TEXT_VIEW (widget),
                                                    GTK_TEXT_WINDOW_LEFT)))
    {
        if (event->button == 3)
            show_line_numbers_menu (widget, event);

        return TRUE;
    }

    if ((event->button == 2) || (event->button == 3))
    {
        if (middle_or_right_down)
        {
            middle_or_right_down = FALSE;
            return TRUE;
        }
        else
            middle_or_right_down = TRUE;
    }

    if ((event->type == GDK_2BUTTON_PRESS) && (event->button == 1) &&
        (event->window == gtk_text_view_get_window (GTK_TEXT_VIEW (widget), GTK_TEXT_WINDOW_TEXT)))
        return TRUE;

    return GTK_WIDGET_CLASS (pluma_view_parent_class)->button_press_event (widget, event);
}

static gboolean
pluma_view_button_release_event (GtkWidget *widget, GdkEventButton *event)
{
    if (event->button == 2)
        middle_or_right_down = FALSE;

    return GTK_WIDGET_CLASS (pluma_view_parent_class)->button_release_event (widget, event);
}

static void
pluma_view_populate_popup (GtkTextView *text_view, GtkWidget *widget)
{
    middle_or_right_down = FALSE;
}

static void
search_highlight_updated_cb (PlumaDocument *doc,
                             GtkTextIter   *start,
                             GtkTextIter   *end,
                             PlumaView     *view)
{
    GdkRectangle visible_rect;
    GdkRectangle updated_rect;
    GdkRectangle redraw_rect;
    gint y;
    gint height;
    GtkTextView *text_view;

    text_view = GTK_TEXT_VIEW (view);

    g_return_if_fail (pluma_document_get_enable_search_highlighting (
                      PLUMA_DOCUMENT (gtk_text_view_get_buffer (text_view))));

    /* get visible area */
    gtk_text_view_get_visible_rect (text_view, &visible_rect);

    /* get updated rectangle */
    gtk_text_view_get_line_yrange (text_view, start, &y, &height);
    updated_rect.y = y;
    gtk_text_view_get_line_yrange (text_view, end, &y, &height);
    updated_rect.height = y + height - updated_rect.y;
    updated_rect.x = visible_rect.x;
    updated_rect.width = visible_rect.width;

    /* intersect both rectangles to see whether we need to queue a redraw */
    if (gdk_rectangle_intersect (&updated_rect, &visible_rect, &redraw_rect))
    {
        GdkRectangle widget_rect;

        gtk_text_view_buffer_to_window_coords (text_view,
                                               GTK_TEXT_WINDOW_WIDGET,
                                               redraw_rect.x,
                                               redraw_rect.y,
                                               &widget_rect.x,
                                               &widget_rect.y);

        widget_rect.width = redraw_rect.width;
        widget_rect.height = redraw_rect.height;

        gtk_widget_queue_draw_area (GTK_WIDGET (text_view),
                                    widget_rect.x,
                                    widget_rect.y,
                                    widget_rect.width,
                                    widget_rect.height);
    }
}

static void
delete_line (GtkTextView *text_view,
         gint         count)
{
    GtkTextIter start;
    GtkTextIter end;
    GtkTextBuffer *buffer;

    buffer = gtk_text_view_get_buffer (text_view);

    gtk_text_view_reset_im_context (text_view);

    /* If there is a selection delete the selected lines and
     * ignore count */
    if (gtk_text_buffer_get_selection_bounds (buffer, &start, &end))
    {
        gtk_text_iter_order (&start, &end);

        if (gtk_text_iter_starts_line (&end))
        {
            /* Do no delete the line with the cursor if the cursor
             * is at the beginning of the line */
            count = 0;
        }
        else
            count = 1;
    }

    gtk_text_iter_set_line_offset (&start, 0);

    if (count > 0)
    {
        gtk_text_iter_forward_lines (&end, count);

        if (gtk_text_iter_is_end (&end))
        {
            if (gtk_text_iter_backward_line (&start) && !gtk_text_iter_ends_line (&start))
                gtk_text_iter_forward_to_line_end (&start);
        }
    }
    else if (count < 0)
    {
        if (!gtk_text_iter_ends_line (&end))
            gtk_text_iter_forward_to_line_end (&end);

        while (count < 0)
        {
            if (!gtk_text_iter_backward_line (&start))
                break;

            ++count;
        }

        if (count == 0)
        {
            if (!gtk_text_iter_ends_line (&start))
                gtk_text_iter_forward_to_line_end (&start);
        }
        else
            gtk_text_iter_forward_line (&end);
    }

    if (!gtk_text_iter_equal (&start, &end))
    {
        GtkTextIter cur = start;
        gtk_text_iter_set_line_offset (&cur, 0);

        gtk_text_buffer_begin_user_action (buffer);

        gtk_text_buffer_place_cursor (buffer, &cur);

        gtk_text_buffer_delete_interactive (buffer,
                                            &start,
                                            &end,
                                            gtk_text_view_get_editable (text_view));

        gtk_text_buffer_end_user_action (buffer);

        gtk_text_view_scroll_mark_onscreen (text_view,
                                            gtk_text_buffer_get_insert (buffer));
    }
    else
    {
        gtk_widget_error_bell (GTK_WIDGET (text_view));
    }
}

static void
pluma_view_delete_from_cursor (GtkTextView   *text_view,
                               GtkDeleteType  type,
                               gint           count)
{
    /* We override the standard handler for delete_from_cursor since
       the GTK_DELETE_PARAGRAPHS case is not implemented as we like (i.e. it
       does not remove the carriage return in the previous line)
     */
    switch (type)
    {
        case GTK_DELETE_PARAGRAPHS:
            delete_line (text_view, count);
            break;
        default:
            GTK_TEXT_VIEW_CLASS (pluma_view_parent_class)->delete_from_cursor(text_view, type, count);
            break;
    }
}
