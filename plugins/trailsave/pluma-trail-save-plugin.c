/*
 * pluma-trail-save-plugin.c
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

#include <pluma/pluma-window.h>
#include <pluma/pluma-window-activatable.h>
#include <pluma/pluma-debug.h>

#include "pluma-trail-save-plugin.h"

static void pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface);

struct _PlumaTrailSavePluginPrivate
{
	PlumaWindow *window;
};

enum {
	PROP_0,
	PROP_WINDOW
};

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaTrailSavePlugin,
                                pluma_trail_save_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaTrailSavePlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                               pluma_window_activatable_iface_init))

static void
strip_trailing_spaces (GtkTextBuffer *text_buffer)
{
	gint line_count, line_num;
	GtkTextIter line_start, line_end;
	gchar *slice;
	gchar byte;
	gint byte_index;
	gint strip_start_index, strip_end_index;
	gboolean should_strip;
	GtkTextIter strip_start, strip_end;

	g_assert (text_buffer != NULL);

	line_count = gtk_text_buffer_get_line_count (text_buffer);

	for (line_num = 0; line_num < line_count; ++line_num)
	{
		/* Get line text */
		gtk_text_buffer_get_iter_at_line (text_buffer, &line_start, line_num);

		if (line_num == line_count - 1)
		{
			gtk_text_buffer_get_end_iter (text_buffer, &line_end);
		}
		else
		{
			gtk_text_buffer_get_iter_at_line (text_buffer, &line_end, line_num + 1);
		}

		slice = gtk_text_buffer_get_slice (text_buffer, &line_start, &line_end, TRUE);

		if (slice == NULL)
		{
			continue;
		}

		/* Find indices of bytes that should be stripped */
		should_strip = FALSE;

		for (byte_index = 0; slice [byte_index] != 0; ++byte_index)
		{
			byte = slice [byte_index];

			if ((byte == ' ') || (byte == '\t'))
			{
				if (!should_strip)
				{
					strip_start_index = byte_index;
					should_strip = TRUE;
				}

				strip_end_index = byte_index + 1;
			}
			else if ((byte == '\r') || (byte == '\n'))
			{
				break;
			}
			else
			{
				should_strip = FALSE;
			}
		}

		g_free (slice);

		/* Strip trailing spaces */
		if (should_strip)
		{
			gtk_text_buffer_get_iter_at_line_index (text_buffer, &strip_start, line_num, strip_start_index);
			gtk_text_buffer_get_iter_at_line_index (text_buffer, &strip_end, line_num, strip_end_index);
			gtk_text_buffer_delete (text_buffer, &strip_start, &strip_end);
		}
	}
}

static void
on_save (PlumaDocument         *document,
	 const gchar           *uri,
	 PlumaEncoding         *encoding,
	 PlumaDocumentSaveFlags save_flags,
	 PlumaTrailSavePlugin  *plugin)
{
	GtkTextBuffer *text_buffer = GTK_TEXT_BUFFER (document);

	strip_trailing_spaces (text_buffer);
}

static void
on_tab_added (PlumaWindow *window,
	      PlumaTab    *tab,
	      PlumaTrailSavePlugin *plugin)
{
	PlumaDocument *document;

	document = pluma_tab_get_document (tab);
	g_signal_connect (document, "save", G_CALLBACK (on_save), plugin);
}

static void
on_tab_removed (PlumaWindow *window,
		PlumaTab    *tab,
		PlumaTrailSavePlugin *plugin)
{
	PlumaDocument *document;

	document = pluma_tab_get_document (tab);
	g_signal_handlers_disconnect_by_data (document, plugin);
}

static void
pluma_trail_save_plugin_activate (PlumaWindowActivatable *activatable)
{
	PlumaTrailSavePlugin *plugin;
	PlumaWindow *window;
	GList *documents;
	GList *documents_iter;
	PlumaDocument *document;

	pluma_debug (DEBUG_PLUGINS);

	plugin = PLUMA_TRAIL_SAVE_PLUGIN (activatable);
	window = PLUMA_WINDOW (plugin->priv->window);

	g_signal_connect (window, "tab_added", G_CALLBACK (on_tab_added), plugin);
	g_signal_connect (window, "tab_removed", G_CALLBACK (on_tab_removed), plugin);

	documents = pluma_window_get_documents (window);

	for (documents_iter = documents;
	     documents_iter && documents_iter->data;
	     documents_iter = documents_iter->next)
	{
		document = (PlumaDocument *) documents_iter->data;
		g_signal_connect (document, "save", G_CALLBACK (on_save), plugin);
	}

	g_list_free (documents);
}

static void
pluma_trail_save_plugin_deactivate (PlumaWindowActivatable *activatable)
{
	PlumaTrailSavePlugin *plugin;
	PlumaWindow *window;
	GList *documents;
	GList *documents_iter;
	PlumaDocument *document;

	pluma_debug (DEBUG_PLUGINS);

	plugin = PLUMA_TRAIL_SAVE_PLUGIN (activatable);
	window = PLUMA_WINDOW (plugin->priv->window);

	g_signal_handlers_disconnect_by_data (window, plugin);

	documents = pluma_window_get_documents (window);

	for (documents_iter = documents;
	     documents_iter && documents_iter->data;
	     documents_iter = documents_iter->next)
	{
		document = (PlumaDocument *) documents_iter->data;
		g_signal_handlers_disconnect_by_data (document, plugin);
	}

	g_list_free (documents);
}

static void
pluma_trail_save_plugin_init (PlumaTrailSavePlugin *plugin)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaTrailSavePlugin initializing");

	plugin->priv = pluma_trail_save_plugin_get_instance_private (plugin);
}

static void
pluma_trail_save_plugin_dispose (GObject *object)
{
	PlumaTrailSavePlugin *plugin = PLUMA_TRAIL_SAVE_PLUGIN (object);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaTrailSavePlugin disposing");

	if (plugin->priv->window != NULL)
	{
		g_object_unref (plugin->priv->window);
		plugin->priv->window = NULL;
	}

	G_OBJECT_CLASS (pluma_trail_save_plugin_parent_class)->dispose (object);
}

static void
pluma_trail_save_plugin_set_property (GObject      *object,
                                      guint         prop_id,
                                      const GValue *value,
                                      GParamSpec   *pspec)
{
	PlumaTrailSavePlugin *plugin = PLUMA_TRAIL_SAVE_PLUGIN (object);

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
pluma_trail_save_plugin_get_property (GObject    *object,
                                      guint       prop_id,
                                      GValue     *value,
                                      GParamSpec *pspec)
{
	PlumaTrailSavePlugin *plugin = PLUMA_TRAIL_SAVE_PLUGIN (object);

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
pluma_trail_save_plugin_class_init (PlumaTrailSavePluginClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->dispose = pluma_trail_save_plugin_dispose;
	object_class->set_property = pluma_trail_save_plugin_set_property;
	object_class->get_property = pluma_trail_save_plugin_get_property;

	g_object_class_override_property (object_class, PROP_WINDOW, "window");
}

static void
pluma_trail_save_plugin_class_finalize (PlumaTrailSavePluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface)
{
	iface->activate = pluma_trail_save_plugin_activate;
	iface->deactivate = pluma_trail_save_plugin_deactivate;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_trail_save_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
	                                            PLUMA_TYPE_WINDOW_ACTIVATABLE,
	                                            PLUMA_TYPE_TRAIL_SAVE_PLUGIN);
}
