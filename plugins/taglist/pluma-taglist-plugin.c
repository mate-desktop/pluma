/*
 * pluma-taglist-plugin.h
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
 * Copyright (C) 2012-2021 MATE Developers
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
 */

/*
 * Modified by the pluma Team, 2002-2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "pluma-taglist-plugin.h"
#include "pluma-taglist-plugin-panel.h"
#include "pluma-taglist-plugin-parser.h"

#include <glib/gi18n-lib.h>
#include <gmodule.h>

#include <pluma/pluma-window-activatable.h>
#include <pluma/pluma-window.h>
#include <pluma/pluma-debug.h>

struct _PlumaTaglistPluginPrivate
{
	PlumaWindow *window;

	GtkWidget *taglist_panel;
};

static void pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface);

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaTaglistPlugin,
                                pluma_taglist_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaTaglistPlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                               pluma_window_activatable_iface_init) \
                                                                                            \
                                _pluma_taglist_plugin_panel_register_type (type_module);    \
)

enum {
	PROP_0,
	PROP_WINDOW
};

static void
pluma_taglist_plugin_init (PlumaTaglistPlugin *plugin)
{
	plugin->priv = pluma_taglist_plugin_get_instance_private (plugin);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaTaglistPlugin initializing");
}

static void
pluma_taglist_plugin_dispose (GObject *object)
{
	PlumaTaglistPlugin *plugin = PLUMA_TAGLIST_PLUGIN (object);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaTaglistPlugin disposing");

	if (plugin->priv->window != NULL)
	{
		g_object_unref (plugin->priv->window);
		plugin->priv->window = NULL;
	}

	G_OBJECT_CLASS (pluma_taglist_plugin_parent_class)->dispose (object);
}

static void
pluma_taglist_plugin_finalize (GObject *object)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaTaglistPlugin finalizing");

	free_taglist ();

	G_OBJECT_CLASS (pluma_taglist_plugin_parent_class)->finalize (object);
}

static void
pluma_taglist_plugin_activate (PlumaWindowActivatable *activatable)
{
	PlumaTaglistPluginPrivate *priv;
	PlumaWindow *window;
	PlumaPanel *side_panel;
	gchar *data_dir;

	pluma_debug (DEBUG_PLUGINS);

	priv = PLUMA_TAGLIST_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (priv->window);
	side_panel = pluma_window_get_side_panel (window);

	data_dir = peas_extension_base_get_data_dir (PEAS_EXTENSION_BASE (activatable));
	priv->taglist_panel = pluma_taglist_plugin_panel_new (window, data_dir);
	g_free (data_dir);

	pluma_panel_add_item_with_icon (side_panel,
					priv->taglist_panel,
					_("Tags"),
					"list-add");
}

static void
pluma_taglist_plugin_deactivate (PlumaWindowActivatable *activatable)
{
	PlumaTaglistPluginPrivate *priv;
	PlumaWindow *window;
	PlumaPanel *side_panel;

	pluma_debug (DEBUG_PLUGINS);

	priv = PLUMA_TAGLIST_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (priv->window);
	side_panel = pluma_window_get_side_panel (window);

	pluma_panel_remove_item (side_panel,
				 priv->taglist_panel);
}

static void
pluma_taglist_plugin_update_state (PlumaWindowActivatable *activatable)
{
	PlumaTaglistPluginPrivate *priv;
	PlumaWindow *window;
	PlumaView *view;

	pluma_debug (DEBUG_PLUGINS);

	priv = PLUMA_TAGLIST_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (priv->window);
	view = pluma_window_get_active_view (window);

	gtk_widget_set_sensitive (priv->taglist_panel,
				  (view != NULL) &&
				  gtk_text_view_get_editable (GTK_TEXT_VIEW (view)));
}

static void
pluma_taglist_plugin_set_property (GObject      *object,
                                   guint         prop_id,
                                   const GValue *value,
                                   GParamSpec   *pspec)
{
	PlumaTaglistPlugin *plugin = PLUMA_TAGLIST_PLUGIN (object);

	switch (prop_id)
	{
		case PROP_WINDOW:
			plugin->priv->window = PLUMA_WINDOW (g_value_dup_object (value));
			break;

		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

static void
pluma_taglist_plugin_get_property (GObject    *object,
                                   guint       prop_id,
                                   GValue     *value,
                                   GParamSpec *pspec)
{
	PlumaTaglistPlugin *plugin = PLUMA_TAGLIST_PLUGIN (object);

	switch (prop_id)
	{
		case PROP_WINDOW:
			g_value_set_object (value, plugin->priv->window);
			break;

		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

static void
pluma_taglist_plugin_class_init (PlumaTaglistPluginClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->finalize = pluma_taglist_plugin_finalize;
	object_class->dispose = pluma_taglist_plugin_dispose;
	object_class->set_property = pluma_taglist_plugin_set_property;
	object_class->get_property = pluma_taglist_plugin_get_property;

	g_object_class_override_property (object_class, PROP_WINDOW, "window");
}

static void
pluma_taglist_plugin_class_finalize (PlumaTaglistPluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface)
{
	iface->activate = pluma_taglist_plugin_activate;
	iface->deactivate = pluma_taglist_plugin_deactivate;
	iface->update_state = pluma_taglist_plugin_update_state;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_taglist_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
	                                            PLUMA_TYPE_WINDOW_ACTIVATABLE,
	                                            PLUMA_TYPE_TAGLIST_PLUGIN);
}
