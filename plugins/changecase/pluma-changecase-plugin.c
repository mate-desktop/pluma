/*
 * pluma-changecase-plugin.c
 *
 * Copyright (C) 2004-2005 - Paolo Borelli
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "pluma-changecase-plugin.h"

#include <glib/gi18n-lib.h>
#include <gmodule.h>
#include <libpeas/peas-activatable.h>

#include <pluma/pluma-window.h>
#include <pluma/pluma-debug.h>

static void peas_activatable_iface_init (PeasActivatableInterface *iface);

struct _PlumaChangecasePluginPrivate
{
    GtkWidget        *window;

    GtkActionGroup   *action_group;
    guint             ui_id;
};

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaChangecasePlugin,
                                pluma_changecase_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaChangecasePlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PEAS_TYPE_ACTIVATABLE,
                                                               peas_activatable_iface_init))

enum {
    PROP_0,
    PROP_OBJECT
};

typedef enum {
    TO_UPPER_CASE,
    TO_LOWER_CASE,
    INVERT_CASE,
    TO_TITLE_CASE,
} ChangeCaseChoice;

static void
do_upper_case (GtkTextBuffer *buffer,
               GtkTextIter   *start,
               GtkTextIter   *end)
{
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, start, end))
    {
            gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_UPPER, start, end);
    }
}

static void
do_lower_case (GtkTextBuffer *buffer,
               GtkTextIter   *start,
               GtkTextIter   *end)
{
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, start, end))
    {
            gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_LOWER, start, end);
    }
}

static void
do_invert_case (GtkTextBuffer *buffer,
                GtkTextIter   *start,
                GtkTextIter   *end)
{
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, start, end))
    {
            gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_TOGGLE, start, end);
    }
}

static void
do_title_case (GtkTextBuffer *buffer,
               GtkTextIter   *start,
               GtkTextIter   *end)
{
    g_return_if_fail (buffer != NULL);

    if (gtk_text_buffer_get_selection_bounds (buffer, start, end))
    {
            gtk_source_buffer_change_case (GTK_SOURCE_BUFFER (buffer), GTK_SOURCE_CHANGE_CASE_TITLE, start, end);
    }
}

static void
change_case (PlumaWindow      *window,
             ChangeCaseChoice  choice)
{
    PlumaDocument *doc;
    GtkTextIter start, end;

    pluma_debug (DEBUG_PLUGINS);

    doc = pluma_window_get_active_document (window);

    g_return_if_fail (doc != NULL);

    if (!gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc), &start, &end))
    {
        return;
    }

    gtk_text_buffer_begin_user_action (GTK_TEXT_BUFFER (doc));

    switch (choice)
    {
    case TO_UPPER_CASE:
        do_upper_case (GTK_TEXT_BUFFER (doc), &start, &end);
        break;
    case TO_LOWER_CASE:
        do_lower_case (GTK_TEXT_BUFFER (doc), &start, &end);
        break;
    case INVERT_CASE:
        do_invert_case (GTK_TEXT_BUFFER (doc), &start, &end);
        break;
    case TO_TITLE_CASE:
        do_title_case (GTK_TEXT_BUFFER (doc), &start, &end);
        break;
    default:
        g_return_if_reached ();
    }

    gtk_text_buffer_end_user_action (GTK_TEXT_BUFFER (doc));
}

static void
upper_case_cb (GtkAction   *action,
               PlumaWindow *window)
{
    change_case (window, TO_UPPER_CASE);
}

static void
lower_case_cb (GtkAction   *action,
               PlumaWindow *window)
{
    change_case (window, TO_LOWER_CASE);
}

static void
invert_case_cb (GtkAction   *action,
                PlumaWindow *window)
{
    change_case (window, INVERT_CASE);
}

static void
title_case_cb (GtkAction   *action,
               PlumaWindow *window)
{
    change_case (window, TO_TITLE_CASE);
}

static const GtkActionEntry action_entries[] =
{
    { "ChangeCase", NULL, N_("C_hange Case") },
    { "UpperCase", NULL, N_("All _Upper Case"), NULL,
      N_("Change selected text to upper case"),
      G_CALLBACK (upper_case_cb) },
    { "LowerCase", NULL, N_("All _Lower Case"), NULL,
      N_("Change selected text to lower case"),
      G_CALLBACK (lower_case_cb) },
    { "InvertCase", NULL, N_("_Invert Case"), NULL,
      N_("Invert the case of selected text"),
      G_CALLBACK (invert_case_cb) },
    { "TitleCase", NULL, N_("_Title Case"), NULL,
      N_("Capitalize the first letter of each selected word"),
      G_CALLBACK (title_case_cb) }
};

const gchar submenu[] =
"<ui>"
"  <menubar name='MenuBar'>"
"    <menu name='EditMenu' action='Edit'>"
"      <placeholder name='EditOps_6'>"
"        <menu action='ChangeCase'>"
"          <menuitem action='UpperCase'/>"
"          <menuitem action='LowerCase'/>"
"          <menuitem action='InvertCase'/>"
"          <menuitem action='TitleCase'/>"
"        </menu>"
"      </placeholder>"
"    </menu>"
"  </menubar>"
"</ui>";


static void
pluma_changecase_plugin_init (PlumaChangecasePlugin *plugin)
{
    pluma_debug_message (DEBUG_PLUGINS, "PlumaChangecasePlugin initializing");

    plugin->priv = pluma_changecase_plugin_get_instance_private (plugin);
}

static void
pluma_changecase_plugin_dispose (GObject *object)
{
    PlumaChangecasePlugin *plugin = PLUMA_CHANGECASE_PLUGIN (object);

    pluma_debug_message (DEBUG_PLUGINS, "PlumaChangecasePlugin disposing");

    g_clear_object (&plugin->priv->window);
    g_clear_object (&plugin->priv->action_group);

    G_OBJECT_CLASS (pluma_changecase_plugin_parent_class)->dispose (object);
}

static void
pluma_changecase_plugin_set_property (GObject      *object,
                                      guint         prop_id,
                                      const GValue *value,
                                      GParamSpec   *pspec)
{
    PlumaChangecasePlugin *plugin = PLUMA_CHANGECASE_PLUGIN (object);

    switch (prop_id)
    {
        case PROP_OBJECT:
            plugin->priv->window = GTK_WIDGET (g_value_dup_object (value));
            break;

        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
pluma_changecase_plugin_get_property (GObject    *object,
                                      guint       prop_id,
                                      GValue     *value,
                                      GParamSpec *pspec)
{
    PlumaChangecasePlugin *plugin = PLUMA_CHANGECASE_PLUGIN (object);

    switch (prop_id)
    {
        case PROP_OBJECT:
            g_value_set_object (value, plugin->priv->window);
            break;

        default:
            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
            break;
    }
}

static void
update_ui (PlumaChangecasePluginPrivate *data)
{
    PlumaWindow *window;
    GtkTextView *view;
    GtkAction *action;
    gboolean sensitive = FALSE;

    pluma_debug (DEBUG_PLUGINS);

    window = PLUMA_WINDOW (data->window);
    view = GTK_TEXT_VIEW (pluma_window_get_active_view (window));

    if (view != NULL)
    {
        GtkTextBuffer *buffer;

        buffer = gtk_text_view_get_buffer (view);
        sensitive = (gtk_text_view_get_editable (view) &&
                     gtk_text_buffer_get_has_selection (buffer));
    }

    action = gtk_action_group_get_action (data->action_group, "ChangeCase");

    gtk_action_set_sensitive (action, sensitive);
}

static void
pluma_changecase_plugin_activate (PeasActivatable *activatable)
{
    PlumaChangecasePluginPrivate *data;
    PlumaWindow *window;
    GtkUIManager *manager;
    GError *error = NULL;

    pluma_debug (DEBUG_PLUGINS);

    data = PLUMA_CHANGECASE_PLUGIN (activatable)->priv;
    window = PLUMA_WINDOW (data->window);

    manager = pluma_window_get_ui_manager (window);

    data->action_group = gtk_action_group_new ("PlumaChangecasePluginActions");
    gtk_action_group_set_translation_domain (data->action_group, GETTEXT_PACKAGE);
    gtk_action_group_add_actions (data->action_group,
                                  action_entries,
                                  G_N_ELEMENTS (action_entries),
                                  window);

    gtk_ui_manager_insert_action_group (manager, data->action_group, -1);

    data->ui_id = gtk_ui_manager_add_ui_from_string (manager,
                                                     submenu,
                                                     -1,
                                                     &error);
    if (data->ui_id == 0)
    {
        g_warning ("%s", error->message);
        return;
    }

    update_ui (data);
}

static void
pluma_changecase_plugin_deactivate (PeasActivatable *activatable)
{
    PlumaChangecasePluginPrivate *data;
    PlumaWindow *window;
    GtkUIManager *manager;

    pluma_debug (DEBUG_PLUGINS);

    data = PLUMA_CHANGECASE_PLUGIN (activatable)->priv;
    window = PLUMA_WINDOW (data->window);

    manager = pluma_window_get_ui_manager (window);

    gtk_ui_manager_remove_ui (manager, data->ui_id);
    gtk_ui_manager_remove_action_group (manager, data->action_group);
}

static void
pluma_changecase_plugin_update_state (PeasActivatable *activatable)
{
    pluma_debug (DEBUG_PLUGINS);

    update_ui (PLUMA_CHANGECASE_PLUGIN (activatable)->priv);
}

static void
pluma_changecase_plugin_class_init (PlumaChangecasePluginClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);

    object_class->dispose = pluma_changecase_plugin_dispose;
    object_class->set_property = pluma_changecase_plugin_set_property;
    object_class->get_property = pluma_changecase_plugin_get_property;

    g_object_class_override_property (object_class, PROP_OBJECT, "object");
}

static void
pluma_changecase_plugin_class_finalize (PlumaChangecasePluginClass *klass)
{
    /* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
peas_activatable_iface_init (PeasActivatableInterface *iface)
{
    iface->activate = pluma_changecase_plugin_activate;
    iface->deactivate = pluma_changecase_plugin_deactivate;
    iface->update_state = pluma_changecase_plugin_update_state;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
    pluma_changecase_plugin_register_type (G_TYPE_MODULE (module));

    peas_object_module_register_extension_type (module,
                                                PEAS_TYPE_ACTIVATABLE,
                                                PLUMA_TYPE_CHANGECASE_PLUGIN);
}
