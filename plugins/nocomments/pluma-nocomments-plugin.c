/*
 * pluma-nocomments-plugin.c
 * 
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#include <glib/gprintf.h>
#include "pluma-nocomments-plugin.h"

#include <glib/gi18n-lib.h>
#include <gmodule.h>
#include <libpeas/peas-activatable.h>

#include <pluma/pluma-window.h>
#include <pluma/pluma-debug.h>

#define PLUMA_NOCOMMENTS_PLUGIN_GET_PRIVATE(object)(G_TYPE_INSTANCE_GET_PRIVATE ((object), \
PLUMA_TYPE_NOCOMMENTS_PLUGIN, \
PlumaNoCommentsPluginPrivate))

static void peas_activatable_iface_init (PeasActivatableInterface *iface);

G_DEFINE_DYNAMIC_TYPE_EXTENDED (PlumaNoCommentsPlugin,
	pluma_nocomments_plugin,
	PEAS_TYPE_EXTENSION_BASE,
	0,
	G_IMPLEMENT_INTERFACE_DYNAMIC (PEAS_TYPE_ACTIVATABLE,
		peas_activatable_iface_init))

struct _PlumaNoCommentsPluginPrivate
{
	GtkWidget        *window;
	GtkActionGroup   *action_group;
	guint             ui_id;
};

enum {
	PROP_0,
	PROP_OBJECT
};

static void
comment_out_case (GtkTextBuffer *buffer,
	GtkTextIter   *start,
	GtkTextIter   *end, 
	gboolean b
	)
{
	GString *t;
	GtkSourceLanguage *w;
	w = gtk_source_buffer_get_language (buffer);
	gchar *h5;
	if(w) h5 = gtk_source_language_get_metadata(w, "line-comment-start");
	t = (w && h5) == FALSE ? g_string_new ("//") : g_string_new (h5) ;
	GtkTextIter *k;
	gunichar c;
	enum what
	{
		q_remove,
		q_add
	}a = q_add;
	GtkTextMark *bx,*hx;
	int eeb = 0;
	if(!b)  
	{
		hx = gtk_text_buffer_get_insert(buffer);
		gtk_text_buffer_get_iter_at_mark(buffer, start, hx );
		gtk_text_iter_assign(end , start);
	}
	k = gtk_text_iter_copy(start);
	gtk_text_iter_set_line_index(start,0);
	do
	{
		c = gtk_text_iter_get_char (start);
	}while( c == t->str[eeb] && ++eeb!=t->len && gtk_text_iter_forward_char (start));
	a = eeb == t->len ? q_remove : q_add ;
	gtk_text_iter_assign(start , k);
	gtk_text_iter_free(k);
	bx = gtk_text_buffer_create_mark(buffer,"endofthe",end,FALSE);
	do
	{
		gtk_text_iter_set_line_index(start,0);
		switch (a)
		{	
			case q_add:
			gtk_text_buffer_insert (buffer,start, t->str, t->len);
			break;
			case q_remove:
			k = gtk_text_iter_copy(start);
			eeb = 0;
			do
			{
				c = gtk_text_iter_get_char (k);
				gtk_text_iter_forward_char (k);
			}while( c == t->str[eeb] && ++eeb!=t->len );

			if(eeb == t->len) gtk_text_buffer_delete(buffer,start,k);
			gtk_text_iter_free(k);
			break;
		}
		gtk_text_iter_forward_to_line_end(start);
		gtk_text_iter_forward_char (start);
		gtk_text_buffer_get_iter_at_mark(buffer,end,bx);

	}while( gtk_text_iter_compare(end,start) == 1);
	
	gtk_text_buffer_delete_mark(buffer,bx);
	g_string_free (t, TRUE);

}



static void
no_comm (PlumaWindow      *window)
{
	PlumaDocument *doc;
	GtkTextIter start, end;
	pluma_debug (DEBUG_PLUGINS);


	doc = pluma_window_get_active_document (window);
	g_return_if_fail (doc != NULL);
	gboolean b = gtk_text_buffer_get_has_selection (GTK_TEXT_BUFFER (doc));
	if (b && !gtk_text_buffer_get_selection_bounds (GTK_TEXT_BUFFER (doc),
		&start, &end))
	{
		return;
	}

	gtk_text_buffer_begin_user_action (GTK_TEXT_BUFFER (doc));

	comment_out_case (GTK_TEXT_BUFFER (doc), &start, &end,  b);

	gtk_text_buffer_end_user_action (GTK_TEXT_BUFFER (doc));
}


static void
comment_out_cb (GtkAction   *action,
	PlumaWindow *window)
{
	no_comm (window);
}


static void comment_out_sig_cb (PlumaView *w,gboolean user_data)
{
	g_printf("hfgiuioijjijoioioi\n");
//	PlumaWindow *window = plugin->priv->window;
//	no_comm (window);
}

static const GtkActionEntry action_entries[] =
{
	{ "CommentOut", NULL, N_("_CommentOut"), "<Control><Shift>b",
	N_("Comment line"),
	G_CALLBACK (comment_out_cb) }
};

const gchar submenu[] =
"<ui>"
"  <menubar name='MenuBar'>"
"    <menu name='EditMenu' action='Edit'>"
"      <placeholder name='EditOps_6'>"
"        <menuitem action='CommentOut'/>"
"      </placeholder>"
"    </menu>"
"  </menubar>"
"</ui>";


static void
pluma_nocomments_plugin_init (PlumaNoCommentsPlugin *plugin)
{
	pluma_debug_message (DEBUG_PLUGINS, "PlumaNoCommentsPlugin initializing");
	plugin->priv = PLUMA_NOCOMMENTS_PLUGIN_GET_PRIVATE (plugin);






}

static void
pluma_nocomments_plugin_dispose (GObject *object)
{
	PlumaNoCommentsPlugin *plugin = PLUMA_NOCOMMENTS_PLUGIN (object);

	pluma_debug_message (DEBUG_PLUGINS, "PlumaNoCommentsPlugin disposing");

	if (plugin->priv->window != NULL)
	{
		g_object_unref (plugin->priv->window);
		plugin->priv->window = NULL;
	}

	if (plugin->priv->action_group != NULL)
	{
		g_object_unref (plugin->priv->action_group);
		plugin->priv->action_group = NULL;
	}

	G_OBJECT_CLASS (pluma_nocomments_plugin_parent_class)->dispose (object);
}

static void
pluma_nocomments_plugin_set_property (GObject      *object,
	guint         prop_id,
	const GValue *value,
	GParamSpec   *pspec)
{
	PlumaNoCommentsPlugin *plugin = PLUMA_NOCOMMENTS_PLUGIN (object);

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
pluma_nocomments_plugin_get_property (GObject    *object,
	guint       prop_id,
	GValue     *value,
	GParamSpec *pspec)
{
	PlumaNoCommentsPlugin *plugin = PLUMA_NOCOMMENTS_PLUGIN (object);

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
update_ui (PlumaNoCommentsPluginPrivate *data)
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
		sensitive = gtk_text_view_get_editable (view);
	}

	action = gtk_action_group_get_action (data->action_group,
		"CommentOut");
	gtk_action_set_sensitive (action, sensitive);
}

static void
pluma_nocomments_plugin_activate (PeasActivatable *activatable)
{
	PlumaNoCommentsPluginPrivate *data;
	PlumaWindow *window;
	GtkUIManager *manager;
	GError *error = NULL;

	data = PLUMA_NOCOMMENTS_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (data->window);

	pluma_debug (DEBUG_PLUGINS);

	manager = pluma_window_get_ui_manager (window);

	data->action_group = gtk_action_group_new ("PlumaNoCommentsPluginActions");
	gtk_action_group_set_translation_domain (data->action_group, 
		GETTEXT_PACKAGE);
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
pluma_nocomments_plugin_deactivate (PeasActivatable *activatable)
{
	PlumaNoCommentsPluginPrivate *data;
	PlumaWindow *window;
	GtkUIManager *manager;

	pluma_debug (DEBUG_PLUGINS);

	data = PLUMA_NOCOMMENTS_PLUGIN (activatable)->priv;
	window = PLUMA_WINDOW (data->window);

	manager = pluma_window_get_ui_manager (window);

	gtk_ui_manager_remove_ui (manager, data->ui_id);
	gtk_ui_manager_remove_action_group (manager, data->action_group);
}

static void
pluma_nocomments_plugin_update_state (PeasActivatable *activatable)
{
	pluma_debug (DEBUG_PLUGINS);

	update_ui (PLUMA_NOCOMMENTS_PLUGIN (activatable)->priv);
}

static void
pluma_nocomments_plugin_class_init (PlumaNoCommentsPluginClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->dispose = pluma_nocomments_plugin_dispose;
	object_class->set_property = pluma_nocomments_plugin_set_property;
	object_class->get_property = pluma_nocomments_plugin_get_property;
	g_object_class_override_property (object_class, PROP_OBJECT, "object");

	g_type_class_add_private (klass, sizeof (PlumaNoCommentsPluginPrivate));
}

static void
pluma_nocomments_plugin_class_finalize (PlumaNoCommentsPluginClass *klass)
{
	/* dummy function - used by G_DEFINE_DYNAMIC_TYPE_EXTENDED */
}

static void
peas_activatable_iface_init (PeasActivatableInterface *iface)
{
	iface->activate = pluma_nocomments_plugin_activate;
	iface->deactivate = pluma_nocomments_plugin_deactivate;
	iface->update_state = pluma_nocomments_plugin_update_state;
}

G_MODULE_EXPORT void
peas_register_types (PeasObjectModule *module)
{
	pluma_nocomments_plugin_register_type (G_TYPE_MODULE (module));

	peas_object_module_register_extension_type (module,
		PEAS_TYPE_ACTIVATABLE,
		PLUMA_TYPE_NOCOMMENTS_PLUGIN);
}
