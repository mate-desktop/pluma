/*
 * pluma-modeline-plugin.c
 * Emacs, Kate and Vim-style modelines support for pluma.
 *
 * Copyright (C) 2005-2007 - Steve Frécinaux <code@istique.net>
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
 */

#ifdef HAVE_CONFIG_H
#	include <config.h>
#endif

#include <glib/gi18n-lib.h>
#include <gmodule.h>
#include <pluma/pluma-window-activatable.h>
#include <pluma/pluma-window.h>
#include <pluma/pluma-debug.h>
#include "pluma-modeline-plugin.h"
#include "modeline-parser.h"

#define DOCUMENT_DATA_KEY "PlumaModelinePluginDocumentData"

struct _PlumaModelinePluginPrivate
{
	PlumaWindow *window;

	gulong tab_added_handler_id;
	gulong tab_removed_handler_id;
};

typedef struct
{
	gulong document_loaded_handler_id;
	gulong document_saved_handler_id;
} DocumentData;

enum {
	PROP_0,
	PROP_WINDOW
};

static void pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface);

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaModelinePlugin,
                                pluma_modeline_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaModelinePlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                               pluma_window_activatable_iface_init))

static void
document_data_free (DocumentData *ddata)
{
	g_slice_free (DocumentData, ddata);
}

static void
pluma_modeline_plugin_constructed (GObject *object)
{
	gchar *data_dir;

	data_dir = peas_extension_base_get_data_dir (PEAS_EXTENSION_BASE (object));

	modeline_parser_init (data_dir);

	g_free (data_dir);

	G_OBJECT_CLASS (pluma_modeline_plugin_parent_class)->constructed (object);
}

static void
pluma_modeline_plugin_init (PlumaModelinePlugin *plugin)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaModelinePlugin initializing");

	plugin->priv = pluma_modeline_plugin_get_instance_private (plugin);
}

static void
pluma_modeline_plugin_finalize (GObject *object)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaModelinePlugin finalizing");

	modeline_parser_shutdown ();

	G_OBJECT_CLASS (pluma_modeline_plugin_parent_class)->finalize (object);
}

static void
pluma_modeline_plugin_dispose (GObject *object)
{
	PlumaModelinePlugin *plugin = PLUMA_MODELINE_PLUGIN (object);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaModelinePlugin disposing");

	if (plugin->priv->window != NULL)
	{
		g_object_unref (plugin->priv->window);
		plugin->priv->window = NULL;
	}

	G_OBJECT_CLASS (pluma_modeline_plugin_parent_class)->dispose (object);
}

static void
pluma_modeline_plugin_set_property (GObject      *object,
                                    guint         prop_id,
                                    const GValue *value,
                                    GParamSpec   *pspec)
{
	PlumaModelinePlugin *plugin = PLUMA_MODELINE_PLUGIN (object);

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
pluma_modeline_plugin_get_property (GObject    *object,
                                    guint       prop_id,
                                    GValue     *value,
                                    GParamSpec *pspec)
{
	PlumaModelinePlugin *plugin = PLUMA_MODELINE_PLUGIN (object);

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
on_document_loaded_or_saved (PlumaDocument *document,
			     const GError  *error,
			     GtkSourceView *view)
{
	modeline_parser_apply_modeline (view);
}

static void
connect_handlers (PlumaView *view)
{
	DocumentData *data;
        GtkTextBuffer *doc;

        doc = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));

        data = g_slice_new (DocumentData);

	data->document_loaded_handler_id =
		g_signal_connect (doc, "loaded",
				  G_CALLBACK (on_document_loaded_or_saved),
				  view);
	data->document_saved_handler_id =
		g_signal_connect (doc, "saved",
				  G_CALLBACK (on_document_loaded_or_saved),
				  view);

	g_object_set_data_full (G_OBJECT (doc), DOCUMENT_DATA_KEY,
				data, (GDestroyNotify) document_data_free);
}

static void
disconnect_handlers (PlumaView *view)
{
	DocumentData *data;
	GtkTextBuffer *doc;

	doc = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view));

	data = g_object_steal_data (G_OBJECT (doc), DOCUMENT_DATA_KEY);

	if (data)
	{
		g_signal_handler_disconnect (doc, data->document_loaded_handler_id);
		g_signal_handler_disconnect (doc, data->document_saved_handler_id);

		document_data_free (data);
	}
	else
	{
		g_warning ("Modeline handlers not found");
	}
}

static void
on_window_tab_added (PlumaWindow *window,
		     PlumaTab *tab,
		     gpointer user_data)
{
	connect_handlers (pluma_tab_get_view (tab));
}

static void
on_window_tab_removed (PlumaWindow *window,
		       PlumaTab *tab,
		       gpointer user_data)
{
	disconnect_handlers (pluma_tab_get_view (tab));
}

static void
pluma_modeline_plugin_activate (PlumaWindowActivatable *activatable)
{
	PlumaModelinePluginPrivate *data;
	PlumaWindow *window;
	GList *views;
	GList *l;

	pluma_debug (DEBUG_PLUGINS);

	data = PLUMA_MODELINE_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (data->window);

	views = pluma_window_get_views (window);
	for (l = views; l != NULL; l = l->next)
	{
		connect_handlers (PLUMA_VIEW (l->data));
		modeline_parser_apply_modeline (GTK_SOURCE_VIEW (l->data));
	}
	g_list_free (views);

	data->tab_added_handler_id =
		g_signal_connect (window, "tab-added",
				  G_CALLBACK (on_window_tab_added), NULL);

	data->tab_removed_handler_id =
		g_signal_connect (window, "tab-removed",
				  G_CALLBACK (on_window_tab_removed), NULL);
}

static void
pluma_modeline_plugin_deactivate (PlumaWindowActivatable *activatable)
{
	PlumaModelinePluginPrivate *data;
	PlumaWindow *window;
	GList *views;
	GList *l;

	pluma_debug (DEBUG_PLUGINS);

	data = PLUMA_MODELINE_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (data->window);

	g_signal_handler_disconnect (window, data->tab_added_handler_id);
	g_signal_handler_disconnect (window, data->tab_removed_handler_id);

	views = pluma_window_get_views (window);

	for (l = views; l != NULL; l = l->next)
	{
		disconnect_handlers (PLUMA_VIEW (l->data));

		modeline_parser_deactivate (GTK_SOURCE_VIEW (l->data));
	}

	g_list_free (views);
}

static void
pluma_modeline_plugin_class_init (PlumaModelinePluginClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->constructed = pluma_modeline_plugin_constructed;
	object_class->finalize = pluma_modeline_plugin_finalize;
	object_class->dispose = pluma_modeline_plugin_dispose;
	object_class->set_property = pluma_modeline_plugin_set_property;
	object_class->get_property = pluma_modeline_plugin_get_property;

	g_object_class_override_property (object_class, PROP_WINDOW, "window");
}

static void
pluma_modeline_plugin_class_finalize (PlumaModelinePluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface)
{
	iface->activate = pluma_modeline_plugin_activate;
	iface->deactivate = pluma_modeline_plugin_deactivate;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_modeline_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
	                                            PLUMA_TYPE_WINDOW_ACTIVATABLE,
	                                            PLUMA_TYPE_MODELINE_PLUGIN);
}
