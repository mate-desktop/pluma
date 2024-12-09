/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*- */
/*
 * pluma-encodings-combo-box.c
 * This file is part of pluma
 *
 * Copyright (C) 2003-2005 - Paolo Maggi
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
 * Modified by the pluma Team, 2003-2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id: pluma-encodings-combo-box.c 6112 2008-01-23 08:26:24Z sfre $
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib/gi18n.h>
#include <gtk/gtk.h>

#include <pluma/pluma-encodings-combo-box.h>
#include <pluma/dialogs/pluma-encodings-dialog.h>
#include "pluma-settings.h"
#include "pluma-utils.h"

struct _PlumaEncodingsComboBoxPrivate
{
	GSettings *enc_settings;

	GtkListStore *store;
	gulong changed_id;

	guint activated_item;

	guint save_mode : 1;
};

enum
{
	NAME_COLUMN,
	ENCODING_COLUMN,
	ADD_COLUMN,
	N_COLUMNS
};

/* Properties */
enum
{
	PROP_0,
	PROP_SAVE_MODE
};


G_DEFINE_TYPE_WITH_PRIVATE (PlumaEncodingsComboBox, pluma_encodings_combo_box, GTK_TYPE_COMBO_BOX)

static void	  update_menu 		(PlumaEncodingsComboBox       *combo_box);

static void
pluma_encodings_combo_box_set_property (GObject    *object,
					guint       prop_id,
					const       GValue *value,
					GParamSpec *pspec)
{
	PlumaEncodingsComboBox *combo;

	combo = PLUMA_ENCODINGS_COMBO_BOX (object);

	switch (prop_id)
	{
		case PROP_SAVE_MODE:
			combo->priv->save_mode = (g_value_get_boolean (value) != FALSE);
			break;
		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

static void
pluma_encodings_combo_box_get_property (GObject    *object,
					guint       prop_id,
					GValue 	   *value,
					GParamSpec *pspec)
{
	PlumaEncodingsComboBox *combo;

	combo = PLUMA_ENCODINGS_COMBO_BOX (object);

	switch (prop_id)
	{
		case PROP_SAVE_MODE:
			g_value_set_boolean (value, combo->priv->save_mode);
			break;
		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

static void
pluma_encodings_combo_box_dispose (GObject *object)
{
	PlumaEncodingsComboBox *combo = PLUMA_ENCODINGS_COMBO_BOX (object);

	if (combo->priv->store != NULL)
	{
		g_object_unref (combo->priv->store);
		combo->priv->store = NULL;
	}

	g_clear_object (&combo->priv->enc_settings);

	G_OBJECT_CLASS (pluma_encodings_combo_box_parent_class)->dispose (object);
}

static void
pluma_encodings_combo_box_constructed (GObject *object)
{
	PlumaEncodingsComboBox *combo = PLUMA_ENCODINGS_COMBO_BOX (object);
	GtkCellRenderer *text_renderer;

	G_OBJECT_CLASS (pluma_encodings_combo_box_parent_class)->constructed (object);

		/* Setup up the cells */
		text_renderer = gtk_cell_renderer_text_new ();
		gtk_cell_layout_pack_end (GTK_CELL_LAYOUT (combo),
					  text_renderer, TRUE);

		gtk_cell_layout_set_attributes (GTK_CELL_LAYOUT (combo),
						text_renderer,
						"text",
						NAME_COLUMN,
						NULL);

	update_menu (combo);
}

static void
pluma_encodings_combo_box_class_init (PlumaEncodingsComboBoxClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->constructed = pluma_encodings_combo_box_constructed;
	object_class->set_property = pluma_encodings_combo_box_set_property;
	object_class->get_property = pluma_encodings_combo_box_get_property;
	object_class->dispose = pluma_encodings_combo_box_dispose;

	g_object_class_install_property (object_class,
					 PROP_SAVE_MODE,
					 g_param_spec_boolean ("save-mode",
							       "Save Mode",
							       "Save Mode",
							       FALSE,
							       G_PARAM_READWRITE |
							       G_PARAM_CONSTRUCT |
							       G_PARAM_STATIC_STRINGS));
}

static void
dialog_response_cb (GtkDialog              *dialog,
                    gint                    response_id,
                    PlumaEncodingsComboBox *menu)
{
	if (response_id == GTK_RESPONSE_OK)
	{
		update_menu (menu);
	}

	gtk_widget_destroy (GTK_WIDGET (dialog));
}

static void
add_or_remove (PlumaEncodingsComboBox *menu,
	       GtkTreeModel           *model)
{
	GtkTreeIter iter;
	gboolean add_item = FALSE;

	if (gtk_combo_box_get_active_iter (GTK_COMBO_BOX (menu), &iter))
	{
		gtk_tree_model_get (model, &iter,
				    ADD_COLUMN, &add_item,
				    -1);
	}

	if (!add_item)
	{
		menu->priv->activated_item = gtk_combo_box_get_active (GTK_COMBO_BOX (menu));
	}
	else
	{
		GtkWidget *dialog;

		GtkWidget *toplevel = gtk_widget_get_toplevel (GTK_WIDGET (menu));

		if (!gtk_widget_is_toplevel (toplevel))
			toplevel = NULL;

		g_signal_handler_block (menu, menu->priv->changed_id);
		gtk_combo_box_set_active (GTK_COMBO_BOX (menu),
					  menu->priv->activated_item);
		g_signal_handler_unblock (menu, menu->priv->changed_id);

		dialog = pluma_encodings_dialog_new();

		if (toplevel != NULL)
		{
			GtkWindowGroup *wg;

			gtk_window_set_transient_for (GTK_WINDOW (dialog),
						      GTK_WINDOW (toplevel));

			wg = gtk_window_get_group (GTK_WINDOW (toplevel));
			if (wg == NULL)
			{
				wg = gtk_window_group_new ();
				gtk_window_group_add_window (wg,
							     GTK_WINDOW (toplevel));
			}

			gtk_window_group_add_window (wg,
						     GTK_WINDOW (dialog));
		}

		gtk_window_set_modal (GTK_WINDOW (dialog), TRUE);

		g_signal_connect (dialog,
				  "response",
				  G_CALLBACK (dialog_response_cb),
				  menu);

		gtk_widget_show (dialog);
	}
}

static gboolean
separator_func (GtkTreeModel *model, GtkTreeIter *iter, gpointer data)
{
	gchar *str;
	gboolean ret;

	gtk_tree_model_get (model, iter, NAME_COLUMN, &str, -1);
	ret = (str == NULL || *str == '\0');
	g_free (str);

	return ret;
}

static void
update_menu (PlumaEncodingsComboBox *menu)
{
	GtkListStore *store;
	GtkTreeIter iter;
	GSList *encodings, *l;
	gchar *str;
	const PlumaEncoding *utf8_encoding;
	const PlumaEncoding *current_encoding;
	gchar **enc_strv;

	store = menu->priv->store;

	/* Unset the previous model */
	g_signal_handler_block (menu, menu->priv->changed_id);
	gtk_list_store_clear (store);
	gtk_combo_box_set_model (GTK_COMBO_BOX (menu),
				 NULL);

	utf8_encoding = pluma_encoding_get_utf8 ();
	current_encoding = pluma_encoding_get_current ();

	if (!menu->priv->save_mode)
	{
		gtk_list_store_append (store, &iter);
		gtk_list_store_set (store, &iter,
				    NAME_COLUMN, _("Automatically Detected"),
				    ENCODING_COLUMN, NULL,
				    ADD_COLUMN, FALSE,
				    -1);

		gtk_list_store_append (store, &iter);
		gtk_list_store_set (store, &iter,
				    NAME_COLUMN, "",
				    ENCODING_COLUMN, NULL,
				    ADD_COLUMN, FALSE,
				    -1);
	}

	if (current_encoding != utf8_encoding)
		str = pluma_encoding_to_string (utf8_encoding);
	else
		str = g_strdup_printf (_("Current Locale (%s)"),
				       pluma_encoding_get_charset (utf8_encoding));

	gtk_list_store_append (store, &iter);
	gtk_list_store_set (store, &iter,
			    NAME_COLUMN, str,
			    ENCODING_COLUMN, utf8_encoding,
			    ADD_COLUMN, FALSE,
			    -1);

	g_free (str);

	if ((utf8_encoding != current_encoding) &&
	    (current_encoding != NULL))
	{
		str = g_strdup_printf (_("Current Locale (%s)"),
				       pluma_encoding_get_charset (current_encoding));

		gtk_list_store_append (store, &iter);
		gtk_list_store_set (store, &iter,
				    NAME_COLUMN, str,
				    ENCODING_COLUMN, current_encoding,
				    ADD_COLUMN, FALSE,
				    -1);

		g_free (str);
	}

	enc_strv = g_settings_get_strv (menu->priv->enc_settings,
					PLUMA_SETTINGS_ENCODING_SHOWN_IN_MENU);

	encodings = _pluma_encoding_strv_to_list ((const gchar * const *)enc_strv);
	g_strfreev (enc_strv);

	for (l = encodings; l != NULL; l = g_slist_next (l))
	{
		const PlumaEncoding *enc = (const PlumaEncoding *)l->data;

		if ((enc != current_encoding) &&
		    (enc != utf8_encoding) &&
		    (enc != NULL))
		{
			str = pluma_encoding_to_string (enc);

			gtk_list_store_append (store, &iter);
			gtk_list_store_set (store, &iter,
					    NAME_COLUMN, str,
					    ENCODING_COLUMN, enc,
					    ADD_COLUMN, FALSE,
					    -1);

			g_free (str);
		}
	}

	g_slist_free (encodings);

	gtk_list_store_append (store, &iter);
	/* separator */
	gtk_list_store_set (store, &iter,
			    NAME_COLUMN, "",
			    ENCODING_COLUMN, NULL,
			    ADD_COLUMN, FALSE,
			    -1);

	gtk_list_store_append (store, &iter);
	gtk_list_store_set (store, &iter,
			    NAME_COLUMN, _("Add or Remove..."),
			    ENCODING_COLUMN, NULL,
			    ADD_COLUMN, TRUE,
			    -1);

	/* set the model back */
	gtk_combo_box_set_model (GTK_COMBO_BOX (menu),
				 GTK_TREE_MODEL (menu->priv->store));
	gtk_combo_box_set_active (GTK_COMBO_BOX (menu), 0);

	g_signal_handler_unblock (menu, menu->priv->changed_id);
}

static void
pluma_encodings_combo_box_init (PlumaEncodingsComboBox *menu)
{
	menu->priv = pluma_encodings_combo_box_get_instance_private (menu);

	menu->priv->enc_settings = g_settings_new (PLUMA_SCHEMA_ID);

	menu->priv->store = gtk_list_store_new (N_COLUMNS,
						G_TYPE_STRING,
						G_TYPE_POINTER,
						G_TYPE_BOOLEAN);

	gtk_combo_box_set_row_separator_func (GTK_COMBO_BOX (menu),
					      separator_func, NULL,
					      NULL);

	menu->priv->changed_id = g_signal_connect (menu, "changed",
						   G_CALLBACK (add_or_remove),
						   menu->priv->store);

	update_menu (menu);
}

GtkWidget *
pluma_encodings_combo_box_new (gboolean save_mode)
{
	return g_object_new (PLUMA_TYPE_ENCODINGS_COMBO_BOX,
			     "save_mode", save_mode,
			     NULL);
}

const PlumaEncoding *
pluma_encodings_combo_box_get_selected_encoding (PlumaEncodingsComboBox *menu)
{
	GtkTreeIter iter;

	g_return_val_if_fail (PLUMA_IS_ENCODINGS_COMBO_BOX (menu), NULL);

	if (gtk_combo_box_get_active_iter (GTK_COMBO_BOX (menu), &iter))
	{
		const PlumaEncoding *ret;
		GtkTreeModel *model;

		model = gtk_combo_box_get_model (GTK_COMBO_BOX (menu));

		gtk_tree_model_get (model, &iter,
				    ENCODING_COLUMN, &ret,
				    -1);

		return ret;
	}

	return NULL;
}

/**
 * pluma_encodings_combo_box_set_selected_encoding:
 * @menu:
 * @encoding: (allow-none):
 **/
void
pluma_encodings_combo_box_set_selected_encoding (PlumaEncodingsComboBox *menu,
						 const PlumaEncoding    *encoding)
{
	GtkTreeIter iter;
	GtkTreeModel *model;
	gboolean b;
	g_return_if_fail (PLUMA_IS_ENCODINGS_COMBO_BOX (menu));
	g_return_if_fail (GTK_IS_COMBO_BOX (menu));

	model = gtk_combo_box_get_model (GTK_COMBO_BOX (menu));
	b = gtk_tree_model_get_iter_first (model, &iter);

	while (b)
	{
		const PlumaEncoding *enc;

		gtk_tree_model_get (model, &iter,
				    ENCODING_COLUMN, &enc,
				    -1);

		if (enc == encoding)
		{
			gtk_combo_box_set_active_iter (GTK_COMBO_BOX (menu),
						       &iter);

			return;
		}

		b = gtk_tree_model_iter_next (model, &iter);
	}
}
