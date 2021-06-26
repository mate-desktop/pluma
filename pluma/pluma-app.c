/*
 * pluma-app.c
 * This file is part of pluma
 *
 * Copyright (C) 2005-2006 - Paolo Maggi
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

#include <string.h>
#include <unistd.h>

#include <glib/gi18n.h>
#include <libpeas/peas-extension-set.h>
#include <gdk/gdk.h>
#include <gdk/gdkx.h>

#include "pluma-app.h"
#include "pluma-commands.h"
#include "pluma-notebook.h"
#include "pluma-debug.h"
#include "pluma-utils.h"
#include "pluma-enum-types.h"
#include "pluma-dirs.h"
#include "pluma-settings.h"
#include "pluma-app-activatable.h"
#include "pluma-plugins-engine.h"

#define PLUMA_PAGE_SETUP_FILE      "pluma-page-setup"
#define PLUMA_PRINT_SETTINGS_FILE  "pluma-print-settings"

/* Properties */
enum
{
    PROP_0,
    PROP_LOCKDOWN
};

struct _PlumaAppPrivate
{
    GList              *windows;
    PlumaWindow        *active_window;

    PlumaLockdownMask  lockdown;

    GtkPageSetup      *page_setup;
    GtkPrintSettings  *print_settings;

    GSettings         *window_settings;

    PeasExtensionSet  *extensions;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaApp, pluma_app, G_TYPE_OBJECT)

static void
pluma_app_finalize (GObject *object)
{
    PlumaApp *app = PLUMA_APP (object);

    g_list_free (app->priv->windows);

    if (app->priv->page_setup)
        g_object_unref (app->priv->page_setup);
    if (app->priv->print_settings)
        g_object_unref (app->priv->print_settings);

    G_OBJECT_CLASS (pluma_app_parent_class)->finalize (object);
}

static void
pluma_app_dispose (GObject *object)
{
    PlumaApp *app = PLUMA_APP (object);

    g_clear_object (&app->priv->window_settings);
    g_clear_object (&app->priv->extensions);

    G_OBJECT_CLASS (pluma_app_parent_class)->dispose (object);
}


static void
pluma_app_get_property (GObject    *object,
                        guint       prop_id,
                        GValue     *value,
                        GParamSpec *pspec)
{
    PlumaApp *app = PLUMA_APP (object);

    switch (prop_id)
    {
        case PROP_LOCKDOWN:
            g_value_set_flags (value, pluma_app_get_lockdown (app));
            break;
        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_app_class_init (PlumaAppClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);

    object_class->finalize = pluma_app_finalize;
    object_class->dispose = pluma_app_dispose;
    object_class->get_property = pluma_app_get_property;

    g_object_class_install_property (object_class,
                                     PROP_LOCKDOWN,
                                     g_param_spec_flags ("lockdown",
                                                         "Lockdown",
                                                         "The lockdown mask",
                                                         PLUMA_TYPE_LOCKDOWN_MASK,
                                                         0,
                                                         G_PARAM_READABLE |
                                                         G_PARAM_STATIC_STRINGS));
}

static gboolean
ensure_user_config_dir (void)
{
    gchar *config_dir;
    gboolean ret = TRUE;
    gint res;

    config_dir = pluma_dirs_get_user_config_dir ();
    if (config_dir == NULL)
    {
        g_warning ("Could not get config directory\n");
        return FALSE;
    }

    res = g_mkdir_with_parents (config_dir, 0755);
    if (res < 0)
    {
        g_warning ("Could not create config directory\n");
        ret = FALSE;
    }

    g_free (config_dir);

    return ret;
}

static void
load_accels (void)
{
    gchar *filename;

    filename = pluma_dirs_get_user_accels_file ();
    if (filename != NULL)
    {
        pluma_debug_message (DEBUG_APP, "Loading keybindings from %s\n", filename);
        gtk_accel_map_load (filename);
        g_free (filename);
    }
}

static void
save_accels (void)
{
    gchar *filename;

    filename = pluma_dirs_get_user_accels_file ();
    if (filename != NULL)
    {
        pluma_debug_message (DEBUG_APP, "Saving keybindings in %s\n", filename);
        gtk_accel_map_save (filename);
        g_free (filename);
    }
}

static gchar *
get_page_setup_file (void)
{
    gchar *config_dir;
    gchar *setup = NULL;

    config_dir = pluma_dirs_get_user_config_dir ();

    if (config_dir != NULL)
    {
        setup = g_build_filename (config_dir,
                                  PLUMA_PAGE_SETUP_FILE,
                                  NULL);
        g_free (config_dir);
    }

    return setup;
}

static void
load_page_setup (PlumaApp *app)
{
    gchar *filename;
    GError *error = NULL;

    g_return_if_fail (app->priv->page_setup == NULL);

    filename = get_page_setup_file ();

    app->priv->page_setup = gtk_page_setup_new_from_file (filename, &error);
    if (error)
    {
        /* Ignore file not found error */
        if (error->domain != G_FILE_ERROR ||
            error->code != G_FILE_ERROR_NOENT)
        {
            g_warning ("%s", error->message);
        }

        g_error_free (error);
    }

    g_free (filename);

    /* fall back to default settings */
    if (app->priv->page_setup == NULL)
        app->priv->page_setup = gtk_page_setup_new ();
}

static void
save_page_setup (PlumaApp *app)
{
    gchar *filename;
    GError *error = NULL;

    if (app->priv->page_setup == NULL)
        return;

    filename = get_page_setup_file ();

    gtk_page_setup_to_file (app->priv->page_setup,
                            filename,
                            &error);
    if (error)
    {
        g_warning ("%s", error->message);
        g_error_free (error);
    }

    g_free (filename);
}

static gchar *
get_print_settings_file (void)
{
    gchar *config_dir;
    gchar *settings = NULL;

    config_dir = pluma_dirs_get_user_config_dir ();

    if (config_dir != NULL)
    {
        settings = g_build_filename (config_dir,
                                     PLUMA_PRINT_SETTINGS_FILE,
                                     NULL);
        g_free (config_dir);
    }

    return settings;
}

static void
load_print_settings (PlumaApp *app)
{
    gchar *filename;
    GError *error = NULL;

    g_return_if_fail (app->priv->print_settings == NULL);

    filename = get_print_settings_file ();

    app->priv->print_settings = gtk_print_settings_new_from_file (filename,
                                                                  &error);
    if (error)
    {
        /* Ignore file not found error */
        if (error->domain != G_FILE_ERROR ||
            error->code != G_FILE_ERROR_NOENT)
        {
            g_warning ("%s", error->message);
        }

        g_error_free (error);
    }

    g_free (filename);

    /* fall back to default settings */
    if (app->priv->print_settings == NULL)
        app->priv->print_settings = gtk_print_settings_new ();
}

static void
save_print_settings (PlumaApp *app)
{
    gchar *filename;
    GError *error = NULL;

    if (app->priv->print_settings == NULL)
        return;

    filename = get_print_settings_file ();

    gtk_print_settings_to_file (app->priv->print_settings,
                                filename,
                                &error);
    if (error)
    {
        g_warning ("%s", error->message);
        g_error_free (error);
    }

    g_free (filename);
}

static void
extension_added (PeasExtensionSet *extensions,
                 PeasPluginInfo   *info,
                 PeasExtension    *exten,
                 PlumaApp         *app)
{
    peas_extension_call (exten, "activate");
}

static void
extension_removed (PeasExtensionSet *extensions,
                   PeasPluginInfo   *info,
                   PeasExtension    *exten,
                   PlumaApp         *app)
{
    peas_extension_call (exten, "deactivate");
}


static void
pluma_app_init (PlumaApp *app)
{
    PlumaSettings *settings;

    app->priv = pluma_app_get_instance_private (app);

    load_accels ();

    /* Load/init settings */
    settings = _pluma_settings_get_singleton ();
    app->priv->window_settings = g_settings_new (PLUMA_SCHEMA_ID);

    /* initial lockdown state */
    app->priv->lockdown = pluma_settings_get_lockdown (settings);

    app->priv->extensions = peas_extension_set_new (PEAS_ENGINE (pluma_plugins_engine_get_default ()),
                                                    PLUMA_TYPE_APP_ACTIVATABLE,
                                                    "app", app,
                                                    NULL);

    g_signal_connect (app->priv->extensions, "extension-added",
                      G_CALLBACK (extension_added),
                      app);

    g_signal_connect (app->priv->extensions, "extension-removed",
                      G_CALLBACK (extension_removed),
                      app);

    peas_extension_set_call (app->priv->extensions, "activate");
}

/**
 * pluma_app_get_default:
 *
 * Returns the #PlumaApp object. This object is a singleton and
 * represents the running pluma instance.
 *
 * Return value: (transfer none): the #PlumaApp pointer
 */
PlumaApp *
pluma_app_get_default (void)
{
    static PlumaApp *app = NULL;

    if (app != NULL)
        return app;

    app = PLUMA_APP (g_object_new (PLUMA_TYPE_APP, NULL));

    g_object_add_weak_pointer (G_OBJECT (app), (gpointer) &app);

    return app;
}

static void
set_active_window (PlumaApp    *app,
                   PlumaWindow *window)
{
    app->priv->active_window = window;
}

static gboolean
window_focus_in_event (PlumaWindow   *window,
                       GdkEventFocus *event,
                       PlumaApp      *app)
{
    /* updates active_view and active_child when a new toplevel receives focus */
    g_return_val_if_fail (PLUMA_IS_WINDOW (window), FALSE);

    set_active_window (app, window);

    return FALSE;
}

static gboolean
window_delete_event (PlumaWindow *window,
                     GdkEvent    *event,
                     PlumaApp    *app)
{
    PlumaWindowState ws;

    ws = pluma_window_get_state (window);

    if (ws &
        (PLUMA_WINDOW_STATE_SAVING |
         PLUMA_WINDOW_STATE_PRINTING |
         PLUMA_WINDOW_STATE_SAVING_SESSION))
            return TRUE;

    _pluma_cmd_file_quit (NULL, window);

    /* Do not destroy the window */
    return TRUE;
}

static void
window_destroy (PlumaWindow *window,
                PlumaApp    *app)
{
    app->priv->windows = g_list_remove (app->priv->windows, window);

    if (window == app->priv->active_window)
    {
        set_active_window (app, app->priv->windows != NULL ? app->priv->windows->data : NULL);
    }

/* CHECK: I don't think we have to disconnect this function, since windows
   is being destroyed */
/*
    g_signal_handlers_disconnect_by_func (window,
                          G_CALLBACK (window_focus_in_event),
                          app);
    g_signal_handlers_disconnect_by_func (window,
                          G_CALLBACK (window_destroy),
                          app);
*/
    if (app->priv->windows == NULL)
    {
        /* Last window is gone... save some settings and exit */
        ensure_user_config_dir ();

        save_accels ();
        save_page_setup (app);
        save_print_settings (app);

        gtk_main_quit ();
    }
}

/* Generates a unique string for a window role */
static gchar *
gen_role (void)
{
    static gint serial;

    return g_strdup_printf ("pluma-window-%" G_GINT64_FORMAT "-%d-%s",
                            g_get_real_time (),
                            serial++,
                            g_get_host_name ());
}

static PlumaWindow *
pluma_app_create_window_real (PlumaApp    *app,
                              gboolean     set_geometry,
                              const gchar *role)
{
    PlumaWindow *window;

    pluma_debug (DEBUG_APP);

    /*
     * We need to be careful here, there is a race condition:
     * when another pluma is launched it checks active_window,
     * so we must do our best to ensure that active_window
     * is never NULL when at least a window exists.
     */
    if (app->priv->windows == NULL)
    {
        window = g_object_new (PLUMA_TYPE_WINDOW, NULL);
        set_active_window (app, window);
    }
    else
    {
        window = g_object_new (PLUMA_TYPE_WINDOW, NULL);
    }

    app->priv->windows = g_list_prepend (app->priv->windows, window);

    pluma_debug_message (DEBUG_APP, "Window created");

    if (role != NULL)
    {
        gtk_window_set_role (GTK_WINDOW (window), role);
    }
    else
    {
        gchar *newrole;

        newrole = gen_role ();
        gtk_window_set_role (GTK_WINDOW (window), newrole);
        g_free (newrole);
    }

    if (set_geometry)
    {
        GdkWindowState state;
        gint w, h;

        state = g_settings_get_int (app->priv->window_settings,
                                    PLUMA_SETTINGS_WINDOW_STATE);

        if ((state & GDK_WINDOW_STATE_MAXIMIZED) != 0)
        {
            _pluma_window_get_default_size (&w, &h);
            gtk_window_set_default_size (GTK_WINDOW (window), w, h);
            gtk_window_maximize (GTK_WINDOW (window));
        }
        else
        {
            g_settings_get (app->priv->window_settings,
                            PLUMA_SETTINGS_WINDOW_SIZE,
                            "(ii)", &w, &h);
            gtk_window_set_default_size (GTK_WINDOW (window), w, h);
            gtk_window_unmaximize (GTK_WINDOW (window));
        }

        if ((state & GDK_WINDOW_STATE_STICKY ) != 0)
            gtk_window_stick (GTK_WINDOW (window));
        else
            gtk_window_unstick (GTK_WINDOW (window));
    }

    g_signal_connect (window,
                      "focus_in_event",
                      G_CALLBACK (window_focus_in_event),
                      app);
    g_signal_connect (window,
                      "delete_event",
                       G_CALLBACK (window_delete_event),
                       app);
    g_signal_connect (window,
                      "destroy",
                      G_CALLBACK (window_destroy),
                      app);

    return window;
}

/**
 * pluma_app_create_window:
 * @app: the #PlumaApp
 * @screen: (allow-none):
 *
 * Create a new #PlumaWindow part of @app.
 *
 * Return value: (transfer none): the new #PlumaWindow
 */
PlumaWindow *
pluma_app_create_window (PlumaApp  *app,
                         GdkScreen *screen)
{
    PlumaWindow *window;

    window = pluma_app_create_window_real (app, TRUE, NULL);

    if (screen != NULL)
        gtk_window_set_screen (GTK_WINDOW (window), screen);

    return window;
}

/*
 * Same as _create_window, but doesn't set the geometry.
 * The session manager takes care of it. Used in mate-session.
 */
PlumaWindow *
_pluma_app_restore_window (PlumaApp    *app,
                           const gchar *role)
{
    PlumaWindow *window;

    window = pluma_app_create_window_real (app, FALSE, role);

    return window;
}

/**
 * pluma_app_get_windows:
 * @app: the #PlumaApp
 *
 * Returns all the windows currently present in #PlumaApp.
 *
 * Return value: (element-type Pluma.Window) (transfer none): the list of #PlumaWindows objects.
 * The list should not be freed
 */
const GList *
pluma_app_get_windows (PlumaApp *app)
{
    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    return app->priv->windows;
}

/**
 * pluma_app_get_active_window:
 * @app: the #PlumaApp
 *
 * Retrives the #PlumaWindow currently active.
 *
 * Return value: (transfer none): the active #PlumaWindow
 */
PlumaWindow *
pluma_app_get_active_window (PlumaApp *app)
{
    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    /* make sure our active window is always realized:
     * this is needed on startup if we launch two pluma fast
     * enough that the second instance comes up before the
     * first one shows its window.
     */
    if (!gtk_widget_get_realized (GTK_WIDGET (app->priv->active_window)))
        gtk_widget_realize (GTK_WIDGET (app->priv->active_window));

    return app->priv->active_window;
}

static gboolean
is_in_viewport (PlumaWindow  *window,
                GdkScreen    *screen,
                gint          workspace,
                gint          viewport_x,
                gint          viewport_y)
{
    GdkWindow *gdkwindow;
    gint ws;
    gint sc_width, sc_height;
    gint x, y, width, height;
    gint vp_x, vp_y;

    /* Check for workspace match */
    ws = pluma_utils_get_window_workspace (GTK_WINDOW (window));
    if (ws != workspace && ws != PLUMA_ALL_WORKSPACES)
        return FALSE;

    /* Check for viewport match */
    gdkwindow = gtk_widget_get_window (GTK_WIDGET (window));
    gdk_window_get_position (gdkwindow, &x, &y);

    width = gdk_window_get_width(gdkwindow);
    height = gdk_window_get_height(gdkwindow);

    pluma_utils_get_current_viewport (screen, &vp_x, &vp_y);
    x += vp_x;
    y += vp_y;

    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
    {
        sc_width = WidthOfScreen (gdk_x11_screen_get_xscreen (screen));
        sc_height = HeightOfScreen (gdk_x11_screen_get_xscreen (screen));
    }
    else
    {
        return TRUE;
    }

    return x + width * .25 >= viewport_x &&
           x + width * .75 <= viewport_x + sc_width &&
           y  >= viewport_y &&
           y + height <= viewport_y + sc_height;
}

/**
 * _pluma_app_get_window_in_viewport:
 * @app: the #PlumaApp
 * @screen: the #GdkScreen
 * @workspace: the workspace number
 * @viewport_x: the viewport horizontal origin
 * @viewport_y: the viewport vertical origin
 *
 * Since a workspace can be larger than the screen, it is divided into several
 * equal parts called viewports. This function retrives the #PlumaWindow in
 * the given viewport of the given workspace.
 *
 * Return value: the #PlumaWindow in the given viewport of the given workspace.
 */
PlumaWindow *
_pluma_app_get_window_in_viewport (PlumaApp  *app,
                                   GdkScreen *screen,
                                   gint       workspace,
                                   gint       viewport_x,
                                   gint       viewport_y)
{
    PlumaWindow *window;

    GList *l;

    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    /* first try if the active window */
    window = app->priv->active_window;

    g_return_val_if_fail (PLUMA_IS_WINDOW (window), NULL);

    if (is_in_viewport (window, screen, workspace, viewport_x, viewport_y))
        return window;

    /* otherwise try to see if there is a window on this workspace */
    for (l = app->priv->windows; l != NULL; l = l->next)
    {
        window = l->data;

        if (is_in_viewport (window, screen, workspace, viewport_x, viewport_y))
            return window;
    }

    /* no window on this workspace... create a new one */
    return pluma_app_create_window (app, screen);
}

/**
 * pluma_app_get_documents:
 * @app: the #PlumaApp
 *
 * Returns all the documents currently open in #PlumaApp.
 *
 * Return value: (element-type Pluma.Document) (transfer container):
 * a newly allocated list of #PlumaDocument objects
 */
GList *
pluma_app_get_documents (PlumaApp *app)
{
    GList *res = NULL;
    GList *windows;

    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    windows = app->priv->windows;

    while (windows != NULL)
    {
        res = g_list_concat (res,
                             pluma_window_get_documents (PLUMA_WINDOW (windows->data)));

        windows = g_list_next (windows);
    }

    return res;
}

/**
 * pluma_app_get_views:
 * @app: the #PlumaApp
 *
 * Returns all the views currently present in #PlumaApp.
 *
 * Return value: (element-type Pluma.View) (transfer container):
 * a newly allocated list of #PlumaView objects
 */
GList *
pluma_app_get_views (PlumaApp *app)
{
    GList *res = NULL;
    GList *windows;

    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    windows = app->priv->windows;

    while (windows != NULL)
    {
        res = g_list_concat (res,
                             pluma_window_get_views (PLUMA_WINDOW (windows->data)));

        windows = g_list_next (windows);
    }

    return res;
}

/**
 * pluma_app_get_lockdown:
 * @app: a #PlumaApp
 *
 * Gets the lockdown mask (see #PlumaLockdownMask) for the application.
 * The lockdown mask determines which functions are locked down using
 * the MATE-wise lockdown GSettings keys.
 **/
PlumaLockdownMask
pluma_app_get_lockdown (PlumaApp *app)
{
    g_return_val_if_fail (PLUMA_IS_APP (app), PLUMA_LOCKDOWN_ALL);

    return app->priv->lockdown;
}

static void
app_lockdown_changed (PlumaApp *app)
{
    GList *l;

    for (l = app->priv->windows; l != NULL; l = l->next)
        _pluma_window_set_lockdown (PLUMA_WINDOW (l->data),
                                    app->priv->lockdown);

    g_object_notify (G_OBJECT (app), "lockdown");
}

void
_pluma_app_set_lockdown (PlumaApp          *app,
                         PlumaLockdownMask  lockdown)
{
    g_return_if_fail (PLUMA_IS_APP (app));

    app->priv->lockdown = lockdown;

    app_lockdown_changed (app);
}

void
_pluma_app_set_lockdown_bit (PlumaApp          *app,
                             PlumaLockdownMask  bit,
                             gboolean           value)
{
    g_return_if_fail (PLUMA_IS_APP (app));

    if (value)
        app->priv->lockdown |= bit;
    else
        app->priv->lockdown &= ~bit;

    app_lockdown_changed (app);
}

/* Returns a copy */
GtkPageSetup *
_pluma_app_get_default_page_setup (PlumaApp *app)
{
    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    if (app->priv->page_setup == NULL)
        load_page_setup (app);

    return gtk_page_setup_copy (app->priv->page_setup);
}

void
_pluma_app_set_default_page_setup (PlumaApp     *app,
                                   GtkPageSetup *page_setup)
{
    g_return_if_fail (PLUMA_IS_APP (app));
    g_return_if_fail (GTK_IS_PAGE_SETUP (page_setup));

    if (app->priv->page_setup != NULL)
        g_object_unref (app->priv->page_setup);

    app->priv->page_setup = g_object_ref (page_setup);
}

/* Returns a copy */
GtkPrintSettings *
_pluma_app_get_default_print_settings (PlumaApp *app)
{
    g_return_val_if_fail (PLUMA_IS_APP (app), NULL);

    if (app->priv->print_settings == NULL)
        load_print_settings (app);

    return gtk_print_settings_copy (app->priv->print_settings);
}

void
_pluma_app_set_default_print_settings (PlumaApp         *app,
                                       GtkPrintSettings *settings)
{
    g_return_if_fail (PLUMA_IS_APP (app));
    g_return_if_fail (GTK_IS_PRINT_SETTINGS (settings));

    if (app->priv->print_settings != NULL)
        g_object_unref (app->priv->print_settings);

    app->priv->print_settings = g_object_ref (settings);
}

