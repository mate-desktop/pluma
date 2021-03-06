/*
 * pluma-sort-plugin.c
 *
 * Original author: Carlo Borreo <borreo@softhome.net>
 * Ported to Pluma2 by Lee Mallabone <mate@fonicmonkey.net>
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

#include "pluma-sort-plugin.h"

#include <string.h>
#include <glib/gi18n-lib.h>
#include <gmodule.h>

#include <pluma/pluma-window-activatable.h>
#include <pluma/pluma-window.h>
#include <pluma/pluma-debug.h>
#include <pluma/pluma-utils.h>
#include <pluma/pluma-help.h>

#define MENU_PATH "/MenuBar/EditMenu/EditOps_6"

static void peas_activatable_iface_init (PlumaWindowActivatableInterface *iface);

enum {
	PROP_0,
	PROP_WINDOW
};

struct _PlumaSortPluginPrivate
{
	PlumaWindow *window;

	GtkActionGroup *ui_action_group;
	guint ui_id;

	GtkWidget *dialog;
	GtkWidget *col_num_spinbutton;
	GtkWidget *reverse_order_checkbutton;
	GtkWidget *ignore_case_checkbutton;
	GtkWidget *remove_dups_checkbutton;

	GtkTextIter start, end; /* selection */
};

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaSortPlugin,
                                pluma_sort_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaSortPlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                               peas_activatable_iface_init))

static void sort_cb (GtkAction *action, PlumaSortPlugin *plugin);

static const GtkActionEntry action_entries[] =
{
	{ "Sort",
	  "view-sort-ascending",
	  N_("S_ort..."),
	  NULL,
	  N_("Sort the current document or selection"),
	  G_CALLBACK (sort_cb) }
};

static void
do_sort (PlumaSortPlugin *plugin)
{
	PlumaSortPluginPrivate *priv;
	PlumaDocument *doc;
	GtkSourceSortFlags sort_flags = 0;
	gint starting_column;

	pluma_debug (DEBUG_PLUGINS);

	priv = plugin->priv;

	doc = pluma_window_get_active_document (priv->window);
	g_return_if_fail (doc != NULL);

	if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (priv->ignore_case_checkbutton)))
	{
		sort_flags |= GTK_SOURCE_SORT_FLAGS_CASE_SENSITIVE;
	}

	if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (priv->reverse_order_checkbutton)))
	{
		sort_flags |= GTK_SOURCE_SORT_FLAGS_REVERSE_ORDER;
	}

	if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (priv->remove_dups_checkbutton)))
	{
		sort_flags |= GTK_SOURCE_SORT_FLAGS_REMOVE_DUPLICATES;
	}

	starting_column = gtk_spin_button_get_value_as_int (GTK_SPIN_BUTTON (priv->col_num_spinbutton)) - 1;

	gtk_source_buffer_sort_lines (GTK_SOURCE_BUFFER (doc),
	                              &priv->start,
	                              &priv->end,
	                              sort_flags,
	                              starting_column);

	pluma_debug_message (DEBUG_PLUGINS, "Done.");
}

static void
sort_dialog_response_handler (GtkDialog       *dialog,
                              gint             res_id,
                              PlumaSortPlugin *plugin)
{
	pluma_debug (DEBUG_PLUGINS);

	switch (res_id)
	{
		case GTK_RESPONSE_OK:
			do_sort (plugin);
			gtk_widget_destroy (GTK_WIDGET(dialog));
			break;

		case GTK_RESPONSE_HELP:
			pluma_help_display (GTK_WINDOW (dialog),
					    NULL,
					    "pluma-sort-plugin");
			break;

		case GTK_RESPONSE_CANCEL:
			gtk_widget_destroy (GTK_WIDGET(dialog));
			break;
	}
}

/* NOTE: we store the current selection in the dialog since focusing
 * the text field (like the combo box) looses the documnent selection.
 * Storing the selection ONLY works because the dialog is modal */
static void
get_current_selection (PlumaSortPlugin *plugin)
{
	PlumaSortPluginPrivate *priv;
	PlumaDocument *doc;

	pluma_debug (DEBUG_PLUGINS);

	priv = plugin->priv;
	doc = pluma_window_get_active_document (priv->window);

	if (!gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc),
						   &priv->start,
						   &priv->end))
	{
		/* No selection, get the whole document. */
		gtk_text_buffer_get_bounds (GTK_TEXT_BUFFER (doc),
					    &priv->start,
					    &priv->end);
	}
}

static void
create_sort_dialog (PlumaSortPlugin *plugin)
{
	PlumaSortPluginPrivate *priv;
	GtkWidget *error_widget;
	gboolean ret;
	gchar *data_dir;
	gchar *ui_file;

	pluma_debug (DEBUG_PLUGINS);

	priv = plugin->priv;

	data_dir = peas_extension_base_get_data_dir (PEAS_EXTENSION_BASE (plugin));
	ui_file = g_build_filename (data_dir, "sort.ui", NULL);
	ret = pluma_utils_get_ui_objects (ui_file,
					  NULL,
					  &error_widget,
					  "sort_dialog", &priv->dialog,
					  "reverse_order_checkbutton", &priv->reverse_order_checkbutton,
					  "col_num_spinbutton", &priv->col_num_spinbutton,
					  "ignore_case_checkbutton", &priv->ignore_case_checkbutton,
					  "remove_dups_checkbutton", &priv->remove_dups_checkbutton,
					  NULL);
	g_free (data_dir);
	g_free (ui_file);

	if (!ret)
	{
		const gchar *err_message;

		err_message = gtk_label_get_label (GTK_LABEL (error_widget));
		pluma_warning (GTK_WINDOW (priv->window),
			       "%s", err_message);

		gtk_widget_destroy (error_widget);

		return;
	}

	g_signal_connect (priv->dialog,
			  "destroy",
			  G_CALLBACK (gtk_widget_destroyed),
			  &priv->dialog);

	g_signal_connect (priv->dialog,
			  "response",
			  G_CALLBACK (sort_dialog_response_handler),
			  plugin);

	get_current_selection (plugin);
}

static void
sort_cb (GtkAction  *action,
	 PlumaSortPlugin *plugin)
{
	PlumaSortPluginPrivate *priv;
	GtkWindowGroup *wg;

	pluma_debug (DEBUG_PLUGINS);

	priv = plugin->priv;

	create_sort_dialog (plugin);

	wg = pluma_window_get_group (priv->window);
	gtk_window_group_add_window (wg,
				     GTK_WINDOW (priv->dialog));

	gtk_window_set_transient_for (GTK_WINDOW (priv->dialog),
				      GTK_WINDOW (priv->window));

	gtk_window_set_modal (GTK_WINDOW (priv->dialog),
			      TRUE);

	gtk_widget_show (GTK_WIDGET (priv->dialog));
}

static void
pluma_sort_plugin_set_property (GObject      *object,
                                guint         prop_id,
                                const GValue *value,
                                GParamSpec   *pspec)
{
	PlumaSortPlugin *plugin = PLUMA_SORT_PLUGIN (object);

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
pluma_sort_plugin_get_property (GObject    *object,
                                guint       prop_id,
                                GValue     *value,
                                GParamSpec *pspec)
{
	PlumaSortPlugin *plugin = PLUMA_SORT_PLUGIN (object);

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
update_ui (PlumaSortPlugin *plugin)
{
	PlumaView *view;

	pluma_debug (DEBUG_PLUGINS);

	view = pluma_window_get_active_view (plugin->priv->window);

	gtk_action_group_set_sensitive (plugin->priv->ui_action_group,
					(view != NULL) &&
					gtk_text_view_get_editable (GTK_TEXT_VIEW (view)));
}

static void
pluma_sort_plugin_activate (PlumaWindowActivatable *activatable)
{
	PlumaSortPluginPrivate *priv;
	GtkUIManager *manager;

	pluma_debug (DEBUG_PLUGINS);

	priv = PLUMA_SORT_PLUGIN (activatable)->priv;

	manager = pluma_window_get_ui_manager (priv->window);

	priv->ui_action_group = gtk_action_group_new ("PlumaSortPluginActions");
	gtk_action_group_set_translation_domain (priv->ui_action_group,
						 GETTEXT_PACKAGE);
	gtk_action_group_add_actions (priv->ui_action_group,
				      action_entries,
				      G_N_ELEMENTS (action_entries),
				      activatable);

	gtk_ui_manager_insert_action_group (manager,
					    priv->ui_action_group,
					    -1);

	priv->ui_id = gtk_ui_manager_new_merge_id (manager);

	gtk_ui_manager_add_ui (manager,
			       priv->ui_id,
			       MENU_PATH,
			       "Sort",
			       "Sort",
			       GTK_UI_MANAGER_MENUITEM,
			       FALSE);

	update_ui (PLUMA_SORT_PLUGIN (activatable));
}

static void
pluma_sort_plugin_deactivate (PlumaWindowActivatable *activatable)
{
	PlumaSortPluginPrivate *priv;
	GtkUIManager *manager;

	pluma_debug (DEBUG_PLUGINS);

	priv = PLUMA_SORT_PLUGIN (activatable)->priv;

	manager = pluma_window_get_ui_manager (priv->window);

	gtk_ui_manager_remove_ui (manager,
				  priv->ui_id);
	gtk_ui_manager_remove_action_group (manager,
					    priv->ui_action_group);
}

static void
pluma_sort_plugin_update_state (PlumaWindowActivatable *activatable)
{
	pluma_debug (DEBUG_PLUGINS);

	update_ui (PLUMA_SORT_PLUGIN (activatable));
}

static void
pluma_sort_plugin_init (PlumaSortPlugin *plugin)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaSortPlugin initializing");

	plugin->priv = pluma_sort_plugin_get_instance_private (plugin);
}

static void
pluma_sort_plugin_dispose (GObject *object)
{
	PlumaSortPlugin *plugin = PLUMA_SORT_PLUGIN (object);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaSortPlugin disposing");

	g_clear_object (&plugin->priv->window);
	g_clear_object (&plugin->priv->ui_action_group);

	G_OBJECT_CLASS (pluma_sort_plugin_parent_class)->dispose (object);
}

static void
pluma_sort_plugin_class_init (PlumaSortPluginClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->dispose = pluma_sort_plugin_dispose;
	object_class->set_property = pluma_sort_plugin_set_property;
	object_class->get_property = pluma_sort_plugin_get_property;

	g_object_class_override_property (object_class, PROP_WINDOW, "window");
}

static void
pluma_sort_plugin_class_finalize (PlumaSortPluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
peas_activatable_iface_init (PlumaWindowActivatableInterface *iface)
{
	iface->activate = pluma_sort_plugin_activate;
	iface->deactivate = pluma_sort_plugin_deactivate;
	iface->update_state = pluma_sort_plugin_update_state;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_sort_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
	                                            PLUMA_TYPE_WINDOW_ACTIVATABLE,
	                                            PLUMA_TYPE_SORT_PLUGIN);
}
