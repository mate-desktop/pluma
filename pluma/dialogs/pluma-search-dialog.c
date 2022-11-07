/*
 * pluma-search-dialog.c
 * This file is part of pluma
 *
 * Copyright (C) 2005 Paolo Maggi
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
#include <glib/gi18n.h>
#include <gtk/gtk.h>
#include <gdk/gdkkeysyms.h>

#include "pluma-search-dialog.h"
#include "pluma-history-entry.h"
#include "pluma-utils.h"
#include "pluma-dirs.h"

/* Signals */
enum
{
	SHOW_REPLACE,
	LAST_SIGNAL
};

static guint dialog_signals [LAST_SIGNAL] = { 0 };

struct _PlumaSearchDialogPrivate
{
	gboolean   show_replace;

	GtkWidget *grid;
	GtkWidget *search_label;
	GtkWidget *search_entry;
	GtkWidget *search_text_entry;
	GtkWidget *replace_label;
	GtkWidget *replace_entry;
	GtkWidget *replace_text_entry;
	GtkWidget *match_case_checkbutton;
	GtkWidget *match_regex_checkbutton;
	GtkWidget *entire_word_checkbutton;
	GtkWidget *backwards_checkbutton;
	GtkWidget *wrap_around_checkbutton;
	GtkWidget *parse_escapes_checkbutton;
	GtkWidget *find_button;
	GtkWidget *replace_button;
	GtkWidget *replace_all_button;

	gboolean   ui_error;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaSearchDialog, pluma_search_dialog, GTK_TYPE_DIALOG)

enum
{
	PROP_0,
	PROP_SHOW_REPLACE
};

static void
pluma_search_dialog_set_property (GObject      *object,
				  guint         prop_id,
				  const GValue *value,
				  GParamSpec   *pspec)
{
	PlumaSearchDialog *dlg = PLUMA_SEARCH_DIALOG (object);

	switch (prop_id)
	{
		case PROP_SHOW_REPLACE:
			pluma_search_dialog_set_show_replace (dlg,
							      g_value_get_boolean (value));
			break;
		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

static void
pluma_search_dialog_get_property (GObject    *object,
				  guint       prop_id,
				  GValue     *value,
				  GParamSpec *pspec)
{
	PlumaSearchDialog *dlg = PLUMA_SEARCH_DIALOG (object);

	switch (prop_id)
	{
		case PROP_SHOW_REPLACE:
			g_value_set_boolean (value, dlg->priv->show_replace);
			break;
		default:
			G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
			break;
	}
}

void
pluma_search_dialog_present_with_time (PlumaSearchDialog *dialog,
				       guint32            timestamp)
{
	g_return_if_fail (PLUMA_SEARCH_DIALOG (dialog));

	gtk_window_present_with_time (GTK_WINDOW (dialog), timestamp);

	gtk_widget_grab_focus (dialog->priv->search_text_entry);
}

static gboolean
show_replace (PlumaSearchDialog *dlg)
{
	pluma_search_dialog_set_show_replace (dlg, TRUE);

	return TRUE;
}

static void
pluma_search_dialog_class_init (PlumaSearchDialogClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);
	GtkBindingSet *binding_set;

	object_class->set_property = pluma_search_dialog_set_property;
	object_class->get_property = pluma_search_dialog_get_property;

	klass->show_replace = show_replace;

	dialog_signals[SHOW_REPLACE] =
    		g_signal_new ("show_replace",
		  	      G_TYPE_FROM_CLASS (object_class),
		  	      G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
		  	      G_STRUCT_OFFSET (PlumaSearchDialogClass, show_replace),
			      NULL, NULL, NULL,
			      G_TYPE_BOOLEAN, 0);

	g_object_class_install_property (object_class, PROP_SHOW_REPLACE,
					 g_param_spec_boolean ("show-replace",
					 		       "Show Replace",
					 		       "Whether the dialog is used for Search&Replace",
					 		       FALSE,
					 		       G_PARAM_READWRITE));

	binding_set = gtk_binding_set_by_class (klass);

	/* Note: we cannot use the keyval/modifier associated with the
	 * GTK_STOCK_FIND_AND_REPLACE stock item since MATE HIG suggests Ctrl+h
	 * for Replace while gtk+ uses Ctrl+r */
	gtk_binding_entry_add_signal (binding_set, GDK_KEY_h, GDK_CONTROL_MASK, "show_replace", 0);
	gtk_binding_entry_add_signal (binding_set, GDK_KEY_H, GDK_CONTROL_MASK, "show_replace", 0);
}

static void
insert_text_handler (GtkEditable *editable,
		     const gchar *text,
		     gint         length,
		     gint        *position,
		     gpointer     data)
{
	static gboolean insert_text = FALSE;
	gchar *escaped_text;
	gint new_len;

	/* To avoid recursive behavior */
	if (insert_text)
		return;

	escaped_text = pluma_utils_escape_search_text (text);

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

static void
search_text_entry_changed (GtkEditable       *editable,
			   PlumaSearchDialog *dialog)
{
	const gchar *search_string;

	search_string = gtk_entry_get_text (GTK_ENTRY (editable));
	g_return_if_fail (search_string != NULL);

	if (*search_string != '\0')
	{
		gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
			PLUMA_SEARCH_DIALOG_FIND_RESPONSE, TRUE);
		gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
			PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE, TRUE);
	}
	else
	{
		gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
			PLUMA_SEARCH_DIALOG_FIND_RESPONSE, FALSE);
		gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
			PLUMA_SEARCH_DIALOG_REPLACE_RESPONSE, FALSE);
		gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
			PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE, FALSE);
	}
}

static gboolean
response_handler (PlumaSearchDialog *dialog,
		  gint               response_id,
		  gpointer           data)
{
	const gchar *str;

	switch (response_id)
	{
		case PLUMA_SEARCH_DIALOG_REPLACE_RESPONSE:
		case PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE:
			str = gtk_entry_get_text (GTK_ENTRY (dialog->priv->replace_text_entry));
			if (*str != '\0')
			{
				gchar *text;

				text = pluma_utils_unescape_search_text (str);
				pluma_history_entry_prepend_text
						(PLUMA_HISTORY_ENTRY (dialog->priv->replace_entry),
						 text);

				g_free (text);
			}
			/* fall through, so that we also save the find entry */
		case PLUMA_SEARCH_DIALOG_FIND_RESPONSE:
			str = gtk_entry_get_text (GTK_ENTRY (dialog->priv->search_text_entry));
			if (*str != '\0')
			{
				gchar *text;

				text = pluma_utils_unescape_search_text (str);
				pluma_history_entry_prepend_text
						(PLUMA_HISTORY_ENTRY (dialog->priv->search_entry),
						 text);

				g_free (text);
				/* Return TRUE if the search box contains text */
				return TRUE;
			}
	}
	return FALSE;
}

static void
search_text_entry_activated (GtkEditable       *editable,
			     PlumaSearchDialog *dialog)
{
	/* Don't send response if the search box is empty */
	if (response_handler (dialog, PLUMA_SEARCH_DIALOG_FIND_RESPONSE, NULL))
	{
		gtk_dialog_response (GTK_DIALOG (dialog), PLUMA_SEARCH_DIALOG_FIND_RESPONSE);
	}
}

static void
show_replace_widgets (PlumaSearchDialog *dlg,
		      gboolean           show_replace)
{
	if (show_replace)
	{
		gtk_widget_show (dlg->priv->replace_label);
		gtk_widget_show (dlg->priv->replace_entry);
		gtk_widget_show (dlg->priv->replace_all_button);
		gtk_widget_show (dlg->priv->replace_button);

		gtk_window_set_title (GTK_WINDOW (dlg), _("Replace"));
	}
	else
	{
		gtk_widget_hide (dlg->priv->replace_label);
		gtk_widget_hide (dlg->priv->replace_entry);
		gtk_widget_hide (dlg->priv->replace_all_button);
		gtk_widget_hide (dlg->priv->replace_button);

		gtk_window_set_title (GTK_WINDOW (dlg), _("Find"));
	}

	gtk_widget_show (dlg->priv->find_button);
}

static void
pluma_search_dialog_init (PlumaSearchDialog *dlg)
{
	GtkWidget *content;
	GtkWidget *error_widget;
	gboolean ret;
	gchar *root_objects[] = {
		"search_dialog_content",
		NULL
	};

	dlg->priv = pluma_search_dialog_get_instance_private (dlg);

	gtk_window_set_resizable (GTK_WINDOW (dlg), FALSE);
	gtk_window_set_destroy_with_parent (GTK_WINDOW (dlg), TRUE);

	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_Close"), "window-close", GTK_RESPONSE_CANCEL);

	/* HIG defaults */
	gtk_container_set_border_width (GTK_CONTAINER (dlg), 5);
	gtk_box_set_spacing (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
			     2); /* 2 * 5 + 2 = 12 */

	ret = pluma_utils_get_ui_objects (PLUMA_DATADIR "/ui/pluma-search-dialog.ui",
					  root_objects,
					  &error_widget,
					  "search_dialog_content", &content,
					  "grid", &dlg->priv->grid,
					  "search_label", &dlg->priv->search_label,
					  "replace_with_label", &dlg->priv->replace_label,
					  "match_case_checkbutton", &dlg->priv->match_case_checkbutton,
					  "match_regex_checkbutton",&dlg->priv->match_regex_checkbutton,
					  "entire_word_checkbutton", &dlg->priv->entire_word_checkbutton,
					  "search_backwards_checkbutton", &dlg->priv->backwards_checkbutton,
					  "wrap_around_checkbutton", &dlg->priv->wrap_around_checkbutton,
					  "parse_escapes_checkbutton", &dlg->priv->parse_escapes_checkbutton,
					  NULL);

	if (!ret)
	{
		gtk_widget_show (error_widget);

		gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
		                    error_widget,
		                    TRUE, TRUE, 0);
		gtk_container_set_border_width (GTK_CONTAINER (error_widget),
						5);

		dlg->priv->ui_error = TRUE;

		return;
	}

	dlg->priv->search_entry = pluma_history_entry_new ("history-search-for",
							   TRUE);
	gtk_widget_set_size_request (dlg->priv->search_entry, 300, -1);
	pluma_history_entry_set_escape_func
			(PLUMA_HISTORY_ENTRY (dlg->priv->search_entry),
			 (PlumaHistoryEntryEscapeFunc) pluma_utils_escape_search_text);

	gtk_widget_set_hexpand (GTK_WIDGET (dlg->priv->search_entry), TRUE);
	dlg->priv->search_text_entry = pluma_history_entry_get_entry
			(PLUMA_HISTORY_ENTRY (dlg->priv->search_entry));
	gtk_widget_show (dlg->priv->search_entry);
	gtk_grid_attach_next_to (GTK_GRID (dlg->priv->grid),
				 dlg->priv->search_entry,
				 dlg->priv->search_label,
				 GTK_POS_RIGHT, 1, 1);

	dlg->priv->replace_entry = pluma_history_entry_new ("history-replace-with",
							    TRUE);
	pluma_history_entry_set_escape_func
			(PLUMA_HISTORY_ENTRY (dlg->priv->replace_entry),
			 (PlumaHistoryEntryEscapeFunc) pluma_utils_escape_search_text);

	gtk_widget_set_hexpand (GTK_WIDGET (dlg->priv->replace_entry), TRUE);
	dlg->priv->replace_text_entry = pluma_history_entry_get_entry
			(PLUMA_HISTORY_ENTRY (dlg->priv->replace_entry));
	gtk_widget_show (dlg->priv->replace_entry);
	gtk_grid_attach_next_to (GTK_GRID (dlg->priv->grid),
				 dlg->priv->replace_entry,
				 dlg->priv->replace_label,
				 GTK_POS_RIGHT, 1, 1);

	gtk_label_set_mnemonic_widget (GTK_LABEL (dlg->priv->search_label),
				       dlg->priv->search_entry);
	gtk_label_set_mnemonic_widget (GTK_LABEL (dlg->priv->replace_label),
				       dlg->priv->replace_entry);

	dlg->priv->find_button = gtk_button_new_with_mnemonic (_("_Find"));
	gtk_button_set_image (GTK_BUTTON (dlg->priv->find_button), gtk_image_new_from_icon_name ("edit-find", GTK_ICON_SIZE_BUTTON));

	dlg->priv->replace_all_button = gtk_button_new_with_mnemonic (_("Replace _All"));
	dlg->priv->replace_button = pluma_gtk_button_new_with_icon (_("_Replace"),
								    "edit-find-replace");

	gtk_dialog_add_action_widget (GTK_DIALOG (dlg),
				      dlg->priv->replace_all_button,
				      PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE);
	gtk_dialog_add_action_widget (GTK_DIALOG (dlg),
				      dlg->priv->replace_button,
				      PLUMA_SEARCH_DIALOG_REPLACE_RESPONSE);
	gtk_dialog_add_action_widget (GTK_DIALOG (dlg),
				      dlg->priv->find_button,
				      PLUMA_SEARCH_DIALOG_FIND_RESPONSE);
	g_object_set (G_OBJECT (dlg->priv->find_button),
		      "can-default", TRUE,
		      NULL);

	gtk_dialog_set_default_response (GTK_DIALOG (dlg),
					 PLUMA_SEARCH_DIALOG_FIND_RESPONSE);

	/* insensitive by default */
	gtk_dialog_set_response_sensitive (GTK_DIALOG (dlg),
					   PLUMA_SEARCH_DIALOG_FIND_RESPONSE,
					   FALSE);
	gtk_dialog_set_response_sensitive (GTK_DIALOG (dlg),
					   PLUMA_SEARCH_DIALOG_REPLACE_RESPONSE,
					   FALSE);
	gtk_dialog_set_response_sensitive (GTK_DIALOG (dlg),
					   PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE,
					   FALSE);

	gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
			    content, FALSE, FALSE, 0);
	g_object_unref (content);
	gtk_container_set_border_width (GTK_CONTAINER (content), 5);

	g_signal_connect (dlg->priv->search_text_entry,
			  "insert_text",
			  G_CALLBACK (insert_text_handler),
			  NULL);
	g_signal_connect (dlg->priv->replace_text_entry,
			  "insert_text",
			  G_CALLBACK (insert_text_handler),
			  NULL);
	g_signal_connect (dlg->priv->search_text_entry,
			  "changed",
			  G_CALLBACK (search_text_entry_changed),
			  dlg);
	g_signal_connect (dlg->priv->search_text_entry,
			  "activate",
			  G_CALLBACK (search_text_entry_activated),
			  dlg);
	g_signal_connect (dlg->priv->replace_text_entry,
			  "activate",
			  G_CALLBACK (search_text_entry_activated),
			  dlg);

	g_signal_connect (dlg,
			  "response",
			  G_CALLBACK (response_handler),
			  NULL);
}

GtkWidget *
pluma_search_dialog_new (GtkWindow *parent,
			 gboolean   show_replace)
{
	PlumaSearchDialog *dlg;

	dlg = g_object_new (PLUMA_TYPE_SEARCH_DIALOG,
			    "show-replace", show_replace,
			    NULL);

	if (parent != NULL)
	{
		gtk_window_set_transient_for (GTK_WINDOW (dlg),
					      parent);

		gtk_window_set_destroy_with_parent (GTK_WINDOW (dlg),
						    TRUE);
	}

	return GTK_WIDGET (dlg);
}

gboolean
pluma_search_dialog_get_show_replace (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return dialog->priv->show_replace;
}

void
pluma_search_dialog_set_show_replace (PlumaSearchDialog *dialog,
				      gboolean           show_replace)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	if (dialog->priv->ui_error)
		return;

	dialog->priv->show_replace = show_replace != FALSE;
	show_replace_widgets (dialog, dialog->priv->show_replace);

	g_object_notify (G_OBJECT (dialog), "show-replace");
}

void
pluma_search_dialog_set_search_text (PlumaSearchDialog *dialog,
				     const gchar       *text)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));
	g_return_if_fail (text != NULL);

	gtk_entry_set_text (GTK_ENTRY (dialog->priv->search_text_entry),
			    text);

	gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
					   PLUMA_SEARCH_DIALOG_FIND_RESPONSE,
					   (*text != '\0'));

	gtk_dialog_set_response_sensitive (GTK_DIALOG (dialog),
					   PLUMA_SEARCH_DIALOG_REPLACE_ALL_RESPONSE,
					   (*text != '\0'));
}

/*
 * The text must be unescaped before searching.
 */
const gchar *
pluma_search_dialog_get_search_text (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), NULL);

	return gtk_entry_get_text (GTK_ENTRY (dialog->priv->search_text_entry));
}

void
pluma_search_dialog_set_replace_text (PlumaSearchDialog *dialog,
				      const gchar       *text)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));
	g_return_if_fail (text != NULL);

	gtk_entry_set_text (GTK_ENTRY (dialog->priv->replace_text_entry),
			    text);
}

const gchar *
pluma_search_dialog_get_replace_text (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), NULL);

	return gtk_entry_get_text (GTK_ENTRY (dialog->priv->replace_text_entry));
}

void
pluma_search_dialog_set_match_case (PlumaSearchDialog *dialog,
				    gboolean           match_case)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->match_case_checkbutton),
				      match_case);
}

gboolean
pluma_search_dialog_get_match_case (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->match_case_checkbutton));
}

void
pluma_search_dialog_set_match_regex (PlumaSearchDialog *dialog,
                    gboolean           match_case)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->match_regex_checkbutton),
                      match_case);
}

gboolean
pluma_search_dialog_get_match_regex (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->match_regex_checkbutton));
}

void
pluma_search_dialog_set_entire_word (PlumaSearchDialog *dialog,
				     gboolean           entire_word)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->entire_word_checkbutton),
				      entire_word);
}

gboolean
pluma_search_dialog_get_entire_word (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->entire_word_checkbutton));
}

void
pluma_search_dialog_set_backwards (PlumaSearchDialog *dialog,
				  gboolean           backwards)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->backwards_checkbutton),
				      backwards);
}

gboolean
pluma_search_dialog_get_backwards (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->backwards_checkbutton));
}

void
pluma_search_dialog_set_wrap_around (PlumaSearchDialog *dialog,
				     gboolean           wrap_around)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->wrap_around_checkbutton),
				      wrap_around);
}

gboolean
pluma_search_dialog_get_wrap_around (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->wrap_around_checkbutton));
}

void
pluma_search_dialog_set_parse_escapes (PlumaSearchDialog *dialog,
				       gboolean           parse_escapes)
{
	g_return_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog));

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dialog->priv->parse_escapes_checkbutton),
				      parse_escapes);
}

gboolean
pluma_search_dialog_get_parse_escapes (PlumaSearchDialog *dialog)
{
	g_return_val_if_fail (PLUMA_IS_SEARCH_DIALOG (dialog), FALSE);

	return gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dialog->priv->parse_escapes_checkbutton));
}
