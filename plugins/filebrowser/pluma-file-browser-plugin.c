/*
 * pluma-file-browser-plugin.c - Pluma plugin providing easy file access
 * from the sidepanel
 *
 * Copyright (C) 2006 - Jesse van den Kieboom <jesse@icecrew.nl>
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
#include <config.h>
#endif

#include <glib/gi18n-lib.h>
#include <gio/gio.h>
#include <string.h>
#include <libpeas/peas-activatable.h>
#include <pluma/pluma-app.h>
#include <pluma/pluma-commands.h>
#include <pluma/pluma-debug.h>
#include <pluma/pluma-window.h>
#include <pluma/pluma-window-activatable.h>
#include <pluma/pluma-utils.h>

#include "pluma-file-browser-enum-types.h"
#include "pluma-file-browser-plugin.h"
#include "pluma-file-browser-utils.h"
#include "pluma-file-browser-error.h"
#include "pluma-file-browser-widget.h"
#include "pluma-file-browser-messages.h"

#define FILE_BROWSER_SCHEMA 		"org.mate.pluma.plugins.filebrowser"
#define FILE_BROWSER_ONLOAD_SCHEMA 	"org.mate.pluma.plugins.filebrowser.on-load"
#define CAJA_SCHEMA					"org.mate.caja.preferences"
#define CAJA_CLICK_POLICY_KEY		"click-policy"
#define CAJA_ENABLE_DELETE_KEY		"enable-delete"
#define CAJA_CONFIRM_TRASH_KEY		"confirm-trash"
#define TERMINAL_SCHEMA				"org.mate.applications-terminal"
#define TERMINAL_EXEC_KEY			"exec"

struct _PlumaFileBrowserPluginPrivate
{
	PlumaWindow               *window;

	PlumaFileBrowserWidget * tree_widget;
	gulong                   merge_id;
	GtkActionGroup         * action_group;
	GtkActionGroup	       * single_selection_action_group;
	gboolean	         auto_root;
	gulong                   end_loading_handle;
	gboolean		 confirm_trash;

	GSettings *settings;
	GSettings *onload_settings;
	GSettings *caja_settings;
	GSettings *terminal_settings;
};

enum {
	PROP_0,
	PROP_WINDOW
};

static void on_uri_activated_cb          (PlumaFileBrowserWidget * widget,
                                          gchar const *uri,
                                          PlumaWindow * window);
static void on_error_cb                  (PlumaFileBrowserWidget * widget,
                                          guint code,
                                          gchar const *message,
                                          PlumaFileBrowserPluginPrivate * priv);
static void on_model_set_cb              (PlumaFileBrowserView * widget,
                                          GParamSpec *arg1,
                                          PlumaFileBrowserPluginPrivate * priv);
static void on_virtual_root_changed_cb   (PlumaFileBrowserStore * model,
                                          GParamSpec * param,
                                          PlumaFileBrowserPluginPrivate * priv);
static void on_filter_mode_changed_cb    (PlumaFileBrowserStore * model,
                                          GParamSpec * param,
                                          PlumaFileBrowserPluginPrivate * priv);
static void on_rename_cb                 (PlumaFileBrowserStore * model,
                                          const gchar * olduri,
                                          const gchar * newuri,
                                          PlumaWindow * window);
static void on_filter_pattern_changed_cb (PlumaFileBrowserWidget * widget,
                                          GParamSpec * param,
                                          PlumaFileBrowserPluginPrivate * priv);
static void on_tab_added_cb              (PlumaWindow * window,
                                          PlumaTab * tab,
                                          PlumaFileBrowserPluginPrivate * priv);
static gboolean on_confirm_delete_cb     (PlumaFileBrowserWidget * widget,
                                          PlumaFileBrowserStore * store,
                                          GList * rows,
                                          PlumaFileBrowserPluginPrivate * priv);
static gboolean on_confirm_no_trash_cb   (PlumaFileBrowserWidget * widget,
                                          GList * files,
                                          PlumaWindow * window);

static void pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface);

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaFileBrowserPlugin,
                                pluma_file_browser_plugin,
                                PEAS_TYPE_EXTENSION_BASE,
                                0,
                                G_ADD_PRIVATE_DYNAMIC (PlumaFileBrowserPlugin)
                                G_IMPLEMENT_INTERFACE_DYNAMIC (PLUMA_TYPE_WINDOW_ACTIVATABLE,
                                                               pluma_window_activatable_iface_init)    \
                                                                                               \
                                pluma_file_browser_enum_and_flag_register_type (type_module);  \
                                _pluma_file_browser_store_register_type        (type_module);  \
                                _pluma_file_bookmarks_store_register_type      (type_module);  \
                                _pluma_file_browser_view_register_type         (type_module);  \
                                _pluma_file_browser_widget_register_type       (type_module);  \
)

static void
pluma_file_browser_plugin_init (PlumaFileBrowserPlugin * plugin)
{
	plugin->priv = pluma_file_browser_plugin_get_instance_private (plugin);
}

static void
pluma_file_browser_plugin_dispose (GObject * object)
{
	PlumaFileBrowserPlugin *plugin = PLUMA_FILE_BROWSER_PLUGIN (object);

	if (plugin->priv->window != NULL)
	{
		g_object_unref (plugin->priv->window);
		plugin->priv->window = NULL;
	}

	G_OBJECT_CLASS (pluma_file_browser_plugin_parent_class)->dispose (object);
}

static void
pluma_file_browser_plugin_set_property (GObject      *object,
                                        guint         prop_id,
                                        const GValue *value,
                                        GParamSpec   *pspec)
{
	PlumaFileBrowserPlugin *plugin = PLUMA_FILE_BROWSER_PLUGIN (object);

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
pluma_file_browser_plugin_get_property (GObject    *object,
                                        guint       prop_id,
                                        GValue     *value,
                                        GParamSpec *pspec)
{
	PlumaFileBrowserPlugin *plugin = PLUMA_FILE_BROWSER_PLUGIN (object);

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
on_end_loading_cb (PlumaFileBrowserStore         *store,
                   GtkTreeIter                   *iter,
                   PlumaFileBrowserPluginPrivate * priv)
{
	/* Disconnect the signal */
	g_signal_handler_disconnect (store, priv->end_loading_handle);
	priv->end_loading_handle = 0;
	priv->auto_root = FALSE;
}

static void
prepare_auto_root (PlumaFileBrowserPluginPrivate *priv)
{
	PlumaFileBrowserStore *store;

	priv->auto_root = TRUE;

	store = pluma_file_browser_widget_get_browser_store (priv->tree_widget);

	if (priv->end_loading_handle != 0) {
		g_signal_handler_disconnect (store, priv->end_loading_handle);
		priv->end_loading_handle = 0;
	}

	priv->end_loading_handle = g_signal_connect (store,
	                                             "end-loading",
	                                             G_CALLBACK (on_end_loading_cb),
	                                             priv);
}

static void
restore_default_location (PlumaFileBrowserPluginPrivate *priv)
{
	gchar * root;
	gchar * virtual_root;
	gboolean bookmarks;
	gboolean remote;

	bookmarks = !g_settings_get_boolean (priv->onload_settings, "tree-view");

	if (bookmarks) {
		pluma_file_browser_widget_show_bookmarks (priv->tree_widget);
		return;
	}

	root = g_settings_get_string (priv->onload_settings, "root");
	virtual_root = g_settings_get_string (priv->onload_settings, "virtual-root");

	remote = g_settings_get_boolean (priv->onload_settings, "enable-remote");

	if (root != NULL && *root != '\0') {
		GFile *file;

		file = g_file_new_for_uri (root);

		if (remote || g_file_is_native (file)) {
			if (virtual_root != NULL && *virtual_root != '\0') {
				prepare_auto_root (priv);
				pluma_file_browser_widget_set_root_and_virtual_root (priv->tree_widget,
					                                             root,
					                                             virtual_root);
			} else {
				prepare_auto_root (priv);
				pluma_file_browser_widget_set_root (priv->tree_widget,
					                            root,
					                            TRUE);
			}
		}

		g_object_unref (file);
	}

	g_free (root);
	g_free (virtual_root);
}

static void
restore_filter (PlumaFileBrowserPluginPrivate *priv)
{
	gchar *filter_mode;
	PlumaFileBrowserStoreFilterMode mode;
	gchar *pattern;

	/* Get filter_mode */
	filter_mode = g_settings_get_string (priv->settings, "filter-mode");

	/* Filter mode */
	mode = pluma_file_browser_store_filter_mode_get_default ();

	if (filter_mode != NULL) {
		if (strcmp (filter_mode, "hidden") == 0) {
			mode = PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_HIDDEN;
		} else if (strcmp (filter_mode, "binary") == 0) {
			mode = PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_BINARY;
		} else if (strcmp (filter_mode, "hidden_and_binary") == 0 ||
		         strcmp (filter_mode, "binary_and_hidden") == 0) {
			mode = PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_HIDDEN |
			       PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_BINARY;
		} else if (strcmp (filter_mode, "none") == 0 ||
		           *filter_mode == '\0') {
			mode = PLUMA_FILE_BROWSER_STORE_FILTER_MODE_NONE;
		}
	}

	/* Set the filter mode */
	pluma_file_browser_store_set_filter_mode (
	    pluma_file_browser_widget_get_browser_store (priv->tree_widget),
	    mode);

	pattern = g_settings_get_string (priv->settings, "filter-pattern");

	pluma_file_browser_widget_set_filter_pattern (priv->tree_widget,
	                                              pattern);

	g_free (filter_mode);
	g_free (pattern);
}

static PlumaFileBrowserViewClickPolicy
click_policy_from_string (gchar const *click_policy)
{
	if (click_policy && strcmp (click_policy, "single") == 0)
		return PLUMA_FILE_BROWSER_VIEW_CLICK_POLICY_SINGLE;
	else
		return PLUMA_FILE_BROWSER_VIEW_CLICK_POLICY_DOUBLE;
}

static void
on_click_policy_changed (GSettings *settings,
			 gchar *key,
			 gpointer user_data)
{
	PlumaFileBrowserPluginPrivate * priv;
	gchar *click_policy;
	PlumaFileBrowserViewClickPolicy policy = PLUMA_FILE_BROWSER_VIEW_CLICK_POLICY_DOUBLE;
	PlumaFileBrowserView *view;

	priv = (PlumaFileBrowserPluginPrivate *)(user_data);

	click_policy = g_settings_get_string (settings, key);
	policy = click_policy_from_string (click_policy);

	view = pluma_file_browser_widget_get_browser_view (priv->tree_widget);
	pluma_file_browser_view_set_click_policy (view, policy);
	g_free (click_policy);
}

static void
on_enable_delete_changed (GSettings *settings,
			  gchar *key,
			  gpointer user_data)
{
	PlumaFileBrowserPluginPrivate *priv;
	gboolean enable = FALSE;

	priv = (PlumaFileBrowserPluginPrivate *)(user_data);
	enable = g_settings_get_boolean (settings, key);

	g_object_set (G_OBJECT (priv->tree_widget), "enable-delete", enable, NULL);
}

static void
on_confirm_trash_changed (GSettings *settings,
		 	  gchar *key,
			  gpointer user_data)
{
	PlumaFileBrowserPluginPrivate *priv;
	gboolean enable = FALSE;

	priv = (PlumaFileBrowserPluginPrivate *)(user_data);
	enable = g_settings_get_boolean (settings, key);

	priv->confirm_trash = enable;
}

static gboolean
have_click_policy (void)
{
	GSettings *settings = g_settings_new (CAJA_SCHEMA);
	gchar *pref = g_settings_get_string (settings, CAJA_CLICK_POLICY_KEY);
	gboolean result = (pref != NULL);

	g_free (pref);
	g_object_unref (settings);
	return result;
}

static void
install_caja_prefs (PlumaFileBrowserPluginPrivate *priv)
{
	gchar *pref;
	gboolean prefb;
	PlumaFileBrowserViewClickPolicy policy;
	PlumaFileBrowserView *view;

	if (have_click_policy ()) {
		g_signal_connect (priv->caja_settings,
		                  "changed::" CAJA_CLICK_POLICY_KEY,
		                  G_CALLBACK (on_click_policy_changed),
		                  priv);
	}

	g_signal_connect (priv->caja_settings,
	                  "changed::" CAJA_ENABLE_DELETE_KEY,
	                  G_CALLBACK (on_enable_delete_changed),
	                  priv);

	g_signal_connect (priv->caja_settings,
	                  "changed::" CAJA_CONFIRM_TRASH_KEY,
	                  G_CALLBACK (on_confirm_trash_changed),
	                  priv);

	pref = g_settings_get_string (priv->caja_settings, CAJA_CLICK_POLICY_KEY);
	policy = click_policy_from_string (pref);
	g_free (pref);

	view = pluma_file_browser_widget_get_browser_view (priv->tree_widget);
	pluma_file_browser_view_set_click_policy (view, policy);

	prefb = g_settings_get_boolean (priv->caja_settings, CAJA_ENABLE_DELETE_KEY);
	g_object_set (G_OBJECT (priv->tree_widget), "enable-delete", prefb, NULL);

	prefb = g_settings_get_boolean (priv->caja_settings, CAJA_CONFIRM_TRASH_KEY);
	priv->confirm_trash = prefb;
}

static void
set_root_from_doc (PlumaFileBrowserPluginPrivate * priv,
                   PlumaDocument * doc)
{
	GFile *file;
	GFile *parent;

	if (doc == NULL)
		return;

	file = pluma_document_get_location (doc);
	if (file == NULL)
		return;

	parent = g_file_get_parent (file);

	if (parent != NULL) {
		gchar * root;

		root = g_file_get_uri (parent);

		pluma_file_browser_widget_set_root (priv->tree_widget,
				                    root,
				                    TRUE);

		g_object_unref (parent);
		g_free (root);
	}

	g_object_unref (file);
}

static void
on_action_set_active_root (GtkAction * action,
                           PlumaFileBrowserPluginPrivate * priv)
{
	set_root_from_doc (priv,
	                   pluma_window_get_active_document (PLUMA_WINDOW (priv->window)));
}

static gchar *
get_terminal (PlumaFileBrowserPluginPrivate * priv)
{
	gchar * terminal;

	terminal = g_settings_get_string (priv->terminal_settings,
					    TERMINAL_EXEC_KEY);

	if (terminal == NULL) {
		const gchar *term = g_getenv ("TERM");

		if (term != NULL)
			terminal = g_strdup (term);
		else
			terminal = g_strdup ("xterm");
	}

	return terminal;
}

static void
on_action_open_terminal (GtkAction * action,
                         PlumaFileBrowserPluginPrivate * priv)
{
	gchar * terminal;
	gchar * wd = NULL;
	gchar * local;
	gchar * argv[2];
	GFile * file;

	GtkTreeIter iter;
	PlumaFileBrowserStore * store;

	/* Get the current directory */
	if (!pluma_file_browser_widget_get_selected_directory (priv->tree_widget, &iter))
		return;

	store = pluma_file_browser_widget_get_browser_store (priv->tree_widget);
	gtk_tree_model_get (GTK_TREE_MODEL (store),
	                    &iter,
	                    PLUMA_FILE_BROWSER_STORE_COLUMN_URI,
	                    &wd,
	                    -1);

	if (wd == NULL)
		return;

	terminal = get_terminal (priv);

	file = g_file_new_for_uri (wd);
	local = g_file_get_path (file);
	g_object_unref (file);

	argv[0] = terminal;
	argv[1] = NULL;

	g_spawn_async (local,
	               argv,
	               NULL,
	               G_SPAWN_SEARCH_PATH,
	               NULL,
	               NULL,
	               NULL,
	               NULL);

	g_free (terminal);
	g_free (wd);
	g_free (local);
}

static void
on_selection_changed_cb (GtkTreeSelection *selection,
			 PlumaFileBrowserPluginPrivate *priv)
{
	GtkTreeView * tree_view;
	GtkTreeModel * model;
	GtkTreeIter iter;
	gboolean sensitive;
	gchar * uri;

	tree_view = GTK_TREE_VIEW (pluma_file_browser_widget_get_browser_view (priv->tree_widget));
	model = gtk_tree_view_get_model (tree_view);

	if (!PLUMA_IS_FILE_BROWSER_STORE (model))
		return;

	sensitive = pluma_file_browser_widget_get_selected_directory (priv->tree_widget, &iter);

	if (sensitive) {
		gtk_tree_model_get (model, &iter,
				    PLUMA_FILE_BROWSER_STORE_COLUMN_URI,
				    &uri, -1);

		sensitive = pluma_utils_uri_has_file_scheme (uri);
		g_free (uri);
	}

	gtk_action_set_sensitive (
		gtk_action_group_get_action (priv->single_selection_action_group,
                                            "OpenTerminal"),
		sensitive);
}

#define POPUP_UI ""                             \
"<ui>"                                          \
"  <popup name=\"FilePopup\">"                  \
"    <placeholder name=\"FilePopup_Opt1\">"     \
"      <menuitem action=\"SetActiveRoot\"/>"    \
"    </placeholder>"                            \
"    <placeholder name=\"FilePopup_Opt4\">"     \
"      <menuitem action=\"OpenTerminal\"/>"     \
"    </placeholder>"                            \
"  </popup>"                                    \
"  <popup name=\"BookmarkPopup\">"              \
"    <placeholder name=\"BookmarkPopup_Opt1\">" \
"      <menuitem action=\"SetActiveRoot\"/>"    \
"    </placeholder>"                            \
"  </popup>"                                    \
"</ui>"

static GtkActionEntry extra_actions[] =
{
	{"SetActiveRoot", "go-jump", N_("_Set root to active document"),
	 NULL,
	 N_("Set the root to the active document location"),
	 G_CALLBACK (on_action_set_active_root)}
};

static GtkActionEntry extra_single_selection_actions[] = {
	{"OpenTerminal", "utilities-terminal", N_("_Open terminal here"),
	 NULL,
	 N_("Open a terminal at the currently opened directory"),
	 G_CALLBACK (on_action_open_terminal)}
};

static void
add_popup_ui (PlumaFileBrowserPluginPrivate *priv)
{
	GtkUIManager * manager;
	GtkActionGroup * action_group;
	GError * error = NULL;

	manager = pluma_file_browser_widget_get_ui_manager (priv->tree_widget);

	action_group = gtk_action_group_new ("FileBrowserPluginExtra");
	gtk_action_group_set_translation_domain (action_group, NULL);
	gtk_action_group_add_actions (action_group,
				      extra_actions,
				      G_N_ELEMENTS (extra_actions),
				      priv);
	gtk_ui_manager_insert_action_group (manager, action_group, 0);
	priv->action_group = action_group;

	action_group = gtk_action_group_new ("FileBrowserPluginSingleSelectionExtra");
	gtk_action_group_set_translation_domain (action_group, NULL);
	gtk_action_group_add_actions (action_group,
				      extra_single_selection_actions,
				      G_N_ELEMENTS (extra_single_selection_actions),
				      priv);
	gtk_ui_manager_insert_action_group (manager, action_group, 0);
	priv->single_selection_action_group = action_group;

	priv->merge_id = gtk_ui_manager_add_ui_from_string (manager,
	                                                    POPUP_UI,
	                                                    -1,
	                                                    &error);

	if (priv->merge_id == 0) {
		g_warning("Unable to merge UI: %s", error->message);
		g_error_free(error);
	}
}

static void
remove_popup_ui (PlumaFileBrowserPluginPrivate *priv)
{
	GtkUIManager * manager;

	manager = pluma_file_browser_widget_get_ui_manager (priv->tree_widget);
	gtk_ui_manager_remove_ui (manager, priv->merge_id);

	gtk_ui_manager_remove_action_group (manager, priv->action_group);
	g_object_unref (priv->action_group);

	gtk_ui_manager_remove_action_group (manager, priv->single_selection_action_group);
	g_object_unref (priv->single_selection_action_group);
}

static void
pluma_file_browser_plugin_update_state (PlumaWindowActivatable *activatable)
{
	PlumaFileBrowserPluginPrivate *priv;
	PlumaDocument * doc;

	priv = PLUMA_FILE_BROWSER_PLUGIN (activatable)->priv;

	doc = pluma_window_get_active_document (PLUMA_WINDOW (priv->window));

	gtk_action_set_sensitive (gtk_action_group_get_action (priv->action_group,
	                                                       "SetActiveRoot"),
	                          doc != NULL &&
	                          !pluma_document_is_untitled (doc));
}

static void
pluma_file_browser_plugin_activate (PlumaWindowActivatable *activatable)
{
	PlumaFileBrowserPluginPrivate *priv;
	PlumaWindow *window;
	PlumaPanel *panel;
	GtkWidget *image;
	GdkPixbuf *pixbuf;
	PlumaFileBrowserStore *store;
	gchar *data_dir;
	GSettingsSchemaSource *schema_source;
	GSettingsSchema *schema;

	priv = PLUMA_FILE_BROWSER_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (priv->window);

	data_dir = peas_extension_base_get_data_dir (PEAS_EXTENSION_BASE (activatable));
	priv->tree_widget = PLUMA_FILE_BROWSER_WIDGET (pluma_file_browser_widget_new (data_dir));
	g_free (data_dir);

	priv->settings = g_settings_new (FILE_BROWSER_SCHEMA);
	priv->onload_settings = g_settings_new (FILE_BROWSER_ONLOAD_SCHEMA);
	priv->terminal_settings = g_settings_new (TERMINAL_SCHEMA);

	g_signal_connect (priv->tree_widget,
			  "uri-activated",
			  G_CALLBACK (on_uri_activated_cb),
			  window);

	g_signal_connect (priv->tree_widget,
			  "error",
			  G_CALLBACK (on_error_cb),
			  priv);

	g_signal_connect (priv->tree_widget,
	                  "notify::filter-pattern",
	                  G_CALLBACK (on_filter_pattern_changed_cb),
	                  priv);

	g_signal_connect (priv->tree_widget,
	                  "confirm-delete",
	                  G_CALLBACK (on_confirm_delete_cb),
	                  priv);

	g_signal_connect (priv->tree_widget,
	                  "confirm-no-trash",
	                  G_CALLBACK (on_confirm_no_trash_cb),
	                  window);

	g_signal_connect (gtk_tree_view_get_selection (GTK_TREE_VIEW
			  (pluma_file_browser_widget_get_browser_view
			  (priv->tree_widget))),
			  "changed",
			  G_CALLBACK (on_selection_changed_cb),
			  priv);

	panel = pluma_window_get_side_panel (window);
	pixbuf = pluma_file_browser_utils_pixbuf_from_theme("system-file-manager",
	                                                    GTK_ICON_SIZE_MENU);

	if (pixbuf) {
		image = gtk_image_new_from_pixbuf(pixbuf);
		g_object_unref(pixbuf);
	} else {
		image = gtk_image_new_from_icon_name("gtk-index", GTK_ICON_SIZE_MENU);
	}

	gtk_widget_show(image);
	pluma_panel_add_item (panel,
	                      GTK_WIDGET (priv->tree_widget),
	                      _("File Browser"),
	                      image);
	gtk_widget_show (GTK_WIDGET (priv->tree_widget));

	add_popup_ui (priv);

	/* Restore filter options */
	restore_filter (priv);

	/* Install caja preferences */
	schema_source = g_settings_schema_source_get_default();
	schema = g_settings_schema_source_lookup (schema_source, CAJA_SCHEMA, FALSE);
	if (schema != NULL) {
		priv->caja_settings = g_settings_new (CAJA_SCHEMA);
		install_caja_prefs (priv);
		g_settings_schema_unref (schema);
	}

	/* Connect signals to store the last visited location */
	g_signal_connect (pluma_file_browser_widget_get_browser_view (priv->tree_widget),
	                  "notify::model",
	                  G_CALLBACK (on_model_set_cb),
	                  priv);

	store = pluma_file_browser_widget_get_browser_store (priv->tree_widget);
	g_signal_connect (store,
	                  "notify::virtual-root",
	                  G_CALLBACK (on_virtual_root_changed_cb),
	                  priv);

	g_signal_connect (store,
	                  "notify::filter-mode",
	                  G_CALLBACK (on_filter_mode_changed_cb),
	                  priv);

	g_signal_connect (store,
			  "rename",
			  G_CALLBACK (on_rename_cb),
			  window);

	g_signal_connect (window,
	                  "tab-added",
	                  G_CALLBACK (on_tab_added_cb),
	                  priv);

	/* Register messages on the bus */
	pluma_file_browser_messages_register (window, priv->tree_widget);

	pluma_file_browser_plugin_update_state (activatable);
}

static void
pluma_file_browser_plugin_deactivate (PlumaWindowActivatable *activatable)
{
	PlumaFileBrowserPluginPrivate *priv;
	PlumaWindow *window;
	PlumaPanel *panel;

	priv = PLUMA_FILE_BROWSER_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (priv->window);

	/* Unregister messages from the bus */
	pluma_file_browser_messages_unregister (window);

	/* Disconnect signals */
	g_signal_handlers_disconnect_by_func (window,
	                                      G_CALLBACK (on_tab_added_cb),
	                                      priv);

	g_object_unref (priv->settings);
	g_object_unref (priv->onload_settings);
	g_object_unref (priv->terminal_settings);

	if (priv->caja_settings)
		g_object_unref (priv->caja_settings);

	remove_popup_ui (priv);

	panel = pluma_window_get_side_panel (window);
	pluma_panel_remove_item (panel, GTK_WIDGET (priv->tree_widget));
}

static void
pluma_file_browser_plugin_class_init (PlumaFileBrowserPluginClass * klass)
{
	GObjectClass  *object_class = G_OBJECT_CLASS (klass);

	object_class->dispose = pluma_file_browser_plugin_dispose;
	object_class->set_property = pluma_file_browser_plugin_set_property;
	object_class->get_property = pluma_file_browser_plugin_get_property;

	g_object_class_override_property (object_class, PROP_WINDOW, "window");
}

static void
pluma_file_browser_plugin_class_finalize (PlumaFileBrowserPluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
pluma_window_activatable_iface_init (PlumaWindowActivatableInterface *iface)
{
	iface->activate = pluma_file_browser_plugin_activate;
	iface->deactivate = pluma_file_browser_plugin_deactivate;
	iface->update_state = pluma_file_browser_plugin_update_state;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_file_browser_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
	                                            PLUMA_TYPE_WINDOW_ACTIVATABLE,
	                                            PLUMA_TYPE_FILE_BROWSER_PLUGIN);
}

/* Callbacks */
static void
on_uri_activated_cb (PlumaFileBrowserWidget * tree_widget,
                     gchar const *uri,
                     PlumaWindow * window)
{
	pluma_commands_load_uri (window, uri, NULL, 0);
}

static void
on_error_cb (PlumaFileBrowserWidget * tree_widget,
             guint code,
             gchar const *message,
             PlumaFileBrowserPluginPrivate * priv)
{
	gchar * title;
	GtkWidget * dlg;

	/* Do not show the error when the root has been set automatically */
	if (priv->auto_root && (code == PLUMA_FILE_BROWSER_ERROR_SET_ROOT ||
	                        code == PLUMA_FILE_BROWSER_ERROR_LOAD_DIRECTORY))
	{
		/* Show bookmarks */
		pluma_file_browser_widget_show_bookmarks (priv->tree_widget);
		return;
	}

	switch (code) {
	case PLUMA_FILE_BROWSER_ERROR_NEW_DIRECTORY:
		title =
		    _("An error occurred while creating a new directory");
		break;
	case PLUMA_FILE_BROWSER_ERROR_NEW_FILE:
		title = _("An error occurred while creating a new file");
		break;
	case PLUMA_FILE_BROWSER_ERROR_RENAME:
		title =
		    _
		    ("An error occurred while renaming a file or directory");
		break;
	case PLUMA_FILE_BROWSER_ERROR_DELETE:
		title =
		    _
		    ("An error occurred while deleting a file or directory");
		break;
	case PLUMA_FILE_BROWSER_ERROR_OPEN_DIRECTORY:
		title =
		    _
		    ("An error occurred while opening a directory in the file manager");
		break;
	case PLUMA_FILE_BROWSER_ERROR_SET_ROOT:
		title =
		    _("An error occurred while setting a root directory");
		break;
	case PLUMA_FILE_BROWSER_ERROR_LOAD_DIRECTORY:
		title =
		    _("An error occurred while loading a directory");
		break;
	default:
		title = _("An error occurred");
		break;
	}

	dlg = gtk_message_dialog_new (GTK_WINDOW (priv->window),
				      GTK_DIALOG_MODAL |
				      GTK_DIALOG_DESTROY_WITH_PARENT,
				      GTK_MESSAGE_ERROR, GTK_BUTTONS_OK,
				      "%s", title);
	gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dlg),
						  "%s", message);

	gtk_dialog_run (GTK_DIALOG (dlg));
	gtk_widget_destroy (dlg);
}

static void
on_model_set_cb (PlumaFileBrowserView * widget,
                 GParamSpec *arg1,
                 PlumaFileBrowserPluginPrivate * priv)
{
	GtkTreeModel * model;

	model = gtk_tree_view_get_model (GTK_TREE_VIEW (pluma_file_browser_widget_get_browser_view (priv->tree_widget)));

	if (model == NULL)
		return;

	g_settings_set_boolean (priv->onload_settings,
	                       "tree-view",
	                       PLUMA_IS_FILE_BROWSER_STORE (model));
}

static void
on_filter_mode_changed_cb (PlumaFileBrowserStore * model,
                           GParamSpec * param,
                           PlumaFileBrowserPluginPrivate * priv)
{
	PlumaFileBrowserStoreFilterMode mode;

	mode = pluma_file_browser_store_get_filter_mode (model);

	if ((mode & PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_HIDDEN) &&
	    (mode & PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_BINARY)) {
		g_settings_set_string (priv->settings, "filter-mode", "hidden_and_binary");
	} else if (mode & PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_HIDDEN) {
		g_settings_set_string (priv->settings, "filter-mode", "hidden");
	} else if (mode & PLUMA_FILE_BROWSER_STORE_FILTER_MODE_HIDE_BINARY) {
		g_settings_set_string (priv->settings, "filter-mode", "binary");
	} else {
		g_settings_set_string (priv->settings, "filter-mode", "none");
	}
}

static void
on_rename_cb (PlumaFileBrowserStore * store,
	      const gchar * olduri,
	      const gchar * newuri,
	      PlumaWindow * window)
{
	PlumaApp * app;
	GList * documents;
	GList * item;
	PlumaDocument * doc;
	GFile * docfile;
	GFile * oldfile;
	GFile * newfile;
	gchar * uri;

	/* Find all documents and set its uri to newuri where it matches olduri */
	app = pluma_app_get_default ();
	documents = pluma_app_get_documents (app);

	oldfile = g_file_new_for_uri (olduri);
	newfile = g_file_new_for_uri (newuri);

	for (item = documents; item; item = item->next) {
		doc = PLUMA_DOCUMENT (item->data);
		uri = pluma_document_get_uri (doc);

		if (!uri)
			continue;

		docfile = g_file_new_for_uri (uri);

		if (g_file_equal (docfile, oldfile)) {
			pluma_document_set_uri (doc, newuri);
		} else {
			gchar *relative;

			relative = g_file_get_relative_path (oldfile, docfile);

			if (relative) {
				/* relative now contains the part in docfile without
				   the prefix oldfile */

				g_object_unref (docfile);
				g_free (uri);

				docfile = g_file_get_child (newfile, relative);
				uri = g_file_get_uri (docfile);

				pluma_document_set_uri (doc, uri);
			}

			g_free (relative);
		}

		g_free (uri);
		g_object_unref (docfile);
	}

	g_object_unref (oldfile);
	g_object_unref (newfile);

	g_list_free (documents);
}

static void
on_filter_pattern_changed_cb (PlumaFileBrowserWidget * widget,
                              GParamSpec * param,
                              PlumaFileBrowserPluginPrivate * priv)
{
	gchar * pattern;

	g_object_get (G_OBJECT (widget), "filter-pattern", &pattern, NULL);

	if (pattern == NULL)
		g_settings_set_string (priv->settings, "filter-pattern", "");
	else
		g_settings_set_string (priv->settings, "filter-pattern", pattern);

	g_free (pattern);
}

static void
on_virtual_root_changed_cb (PlumaFileBrowserStore * store,
                            GParamSpec * param,
                            PlumaFileBrowserPluginPrivate * priv)
{
	gchar * root;
	gchar * virtual_root;

	root = pluma_file_browser_store_get_root (store);

	if (!root)
		return;

	g_settings_set_string (priv->onload_settings, "root", root);

	virtual_root = pluma_file_browser_store_get_virtual_root (store);

	if (!virtual_root) {
		/* Set virtual to same as root then */
		g_settings_set_string (priv->onload_settings, "virtual-root", root);
	} else {
		g_settings_set_string (priv->onload_settings, "virtual-root", virtual_root);
	}

	g_signal_handlers_disconnect_by_func (PLUMA_WINDOW (priv->window),
	                                      G_CALLBACK (on_tab_added_cb),
	                                      priv);

	g_free (root);
	g_free (virtual_root);
}

static void
on_tab_added_cb (PlumaWindow * window,
                 PlumaTab * tab,
                 PlumaFileBrowserPluginPrivate *priv)
{
	gboolean open;
	gboolean load_default = TRUE;

	open = g_settings_get_boolean (priv->settings, "open-at-first-doc");

	if (open) {
		PlumaDocument *doc;
		gchar *uri;

		doc = pluma_tab_get_document (tab);

		uri = pluma_document_get_uri (doc);

		if (uri != NULL && pluma_utils_uri_has_file_scheme (uri)) {
			prepare_auto_root (priv);
			set_root_from_doc (priv, doc);
			load_default = FALSE;
		}

		g_free (uri);
	}

	if (load_default)
		restore_default_location (priv);

	/* Disconnect this signal, it's only called once */
	g_signal_handlers_disconnect_by_func (window,
	                                      G_CALLBACK (on_tab_added_cb),
	                                      priv);
}

static gchar *
get_filename_from_path (GtkTreeModel *model, GtkTreePath *path)
{
	GtkTreeIter iter;
	gchar *uri;

	gtk_tree_model_get_iter (model, &iter, path);
	gtk_tree_model_get (model, &iter,
			    PLUMA_FILE_BROWSER_STORE_COLUMN_URI, &uri,
			    -1);

	return pluma_file_browser_utils_uri_basename (uri);
}

static gboolean
on_confirm_no_trash_cb (PlumaFileBrowserWidget * widget,
                        GList * files,
                        PlumaWindow * window)
{
	gchar *normal;
	gchar *message;
	gchar *secondary;
	gboolean result;

	message = _("Cannot move file to trash, do you\nwant to delete permanently?");

	if (files->next == NULL) {
		normal = pluma_file_browser_utils_file_basename (G_FILE (files->data));
	    	secondary = g_strdup_printf (_("The file \"%s\" cannot be moved to the trash."), normal);
		g_free (normal);
	} else {
		secondary = g_strdup (_("The selected files cannot be moved to the trash."));
	}

	result = pluma_file_browser_utils_confirmation_dialog (window,
	                                                       GTK_MESSAGE_QUESTION,
	                                                       message,
	                                                       secondary);
	g_free (secondary);

	return result;
}

static gboolean
on_confirm_delete_cb (PlumaFileBrowserWidget *widget,
                      PlumaFileBrowserStore *store,
                      GList *paths,
                      PlumaFileBrowserPluginPrivate *priv)
{
	gchar *normal;
	gchar *message;
	gchar *secondary;
	gboolean result;

	if (!priv->confirm_trash)
		return TRUE;

	if (paths->next == NULL) {
		normal = get_filename_from_path (GTK_TREE_MODEL (store), (GtkTreePath *)(paths->data));
		message = g_strdup_printf (_("Are you sure you want to permanently delete \"%s\"?"), normal);
		g_free (normal);
	} else {
		message = g_strdup (_("Are you sure you want to permanently delete the selected files?"));
	}

	secondary = _("If you delete an item, it is permanently lost.");

	result = pluma_file_browser_utils_confirmation_dialog (PLUMA_WINDOW (priv->window),
	                                                       GTK_MESSAGE_QUESTION,
	                                                       message,
	                                                       secondary);

	g_free (message);

	return result;
}

// ex:ts=8:noet:
