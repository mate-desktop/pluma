/*
 * pluma-open-location-dialog.c
 * This file is part of pluma
 *
 * Copyright (C) 2001-2005 Paolo Maggi
 * Copyright (C) 2020 MATE Developers
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
 * Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib/gi18n.h>
#include <gio/gio.h>
#include <gtk/gtk.h>

#include "pluma-open-location-dialog.h"
#include "pluma-history-entry.h"
#include "pluma-encodings-combo-box.h"
#include "pluma-utils.h"
#include "pluma-help.h"
#include "pluma-dirs.h"

struct _PlumaOpenLocationDialogPrivate
{
	GtkWidget *uri_entry;
	GtkWidget *uri_text_entry;
	GtkWidget *encoding_menu;
};

G_DEFINE_TYPE_WITH_PRIVATE(PlumaOpenLocationDialog, pluma_open_location_dialog, GTK_TYPE_DIALOG)

GtkWidget *
pluma_open_location_dialog_new (GtkWindow *parent)
{
	GtkWidget *dlg;

	dlg = g_object_new (pluma_open_location_dialog_get_type(), NULL);

	if (parent != NULL)
		gtk_window_set_transient_for (GTK_WINDOW (dlg), parent);

	return dlg;
}

static void
entry_changed (GtkComboBox *combo, PlumaOpenLocationDialog *dlg)
{
	const gchar *str;

	str = gtk_entry_get_text (GTK_ENTRY (dlg->priv->uri_text_entry));
	g_return_if_fail (str != NULL);

	gtk_dialog_set_response_sensitive (GTK_DIALOG (dlg),
					   GTK_RESPONSE_OK,
					   (str[0] != '\0'));
}

static void
response_handler (PlumaOpenLocationDialog *dlg,
                  gint                     response_id,
                  gpointer                 data)
{
	const gchar *text;

	switch (response_id)
	{
		case GTK_RESPONSE_HELP:
			pluma_help_display (GTK_WINDOW (dlg),
					    NULL,
					    NULL);

			g_signal_stop_emission_by_name (dlg, "response");
			break;

		case GTK_RESPONSE_OK:
			text = gtk_entry_get_text
					(GTK_ENTRY (dlg->priv->uri_text_entry));
			if (*text != '\0')
			{
				pluma_history_entry_prepend_text
						 (PLUMA_HISTORY_ENTRY (dlg->priv->uri_entry),
						  text);
			}
			break;
	}
}

GFile *
pluma_open_location_dialog_get_location (PlumaOpenLocationDialog *dlg)
{
	const gchar *str;
	GFile *location;

	g_return_val_if_fail (PLUMA_IS_OPEN_LOCATION_DIALOG (dlg), NULL);

	str = gtk_entry_get_text (GTK_ENTRY (dlg->priv->uri_text_entry));
	g_return_val_if_fail (str != NULL, NULL);

	if (str[0] == '\0')
		return NULL;

	location = g_file_new_for_commandline_arg (str);

	return location;
}

const PlumaEncoding *
pluma_open_location_dialog_get_encoding	(PlumaOpenLocationDialog *dlg)
{
	g_return_val_if_fail (PLUMA_IS_OPEN_LOCATION_DIALOG (dlg), NULL);

	return pluma_encodings_combo_box_get_selected_encoding (
				PLUMA_ENCODINGS_COMBO_BOX (dlg->priv->encoding_menu));
}

static void
pluma_open_location_dialog_class_init (PlumaOpenLocationDialogClass *klass)
{
}

static void
pluma_open_location_dialog_init (PlumaOpenLocationDialog *dlg)
{
	GtkWidget *content;
	GtkWidget *vbox;
	GtkWidget *location_label;
	GtkWidget *encoding_label;
	GtkWidget *encoding_hbox;
	GtkWidget *error_widget;
	gboolean   ret;
	gchar *file;
	gchar     *root_objects[] = {
		"open_uri_dialog_content",
		NULL
	};

	dlg->priv = pluma_open_location_dialog_get_instance_private (dlg);

	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_Cancel"), "process-stop", GTK_RESPONSE_CANCEL);
	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_OK"), "gtk-ok", GTK_RESPONSE_OK);
	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_Help"), "help-browser", GTK_RESPONSE_HELP);

	gtk_window_set_title (GTK_WINDOW (dlg), _("Open Location"));
	gtk_window_set_resizable (GTK_WINDOW (dlg), FALSE);
	gtk_window_set_destroy_with_parent (GTK_WINDOW (dlg), TRUE);

	gtk_dialog_set_default_response (GTK_DIALOG (dlg),
					 GTK_RESPONSE_OK);

	g_signal_connect (dlg,
			  "response",
			  G_CALLBACK (response_handler),
			  dlg);

	file = pluma_dirs_get_ui_file ("pluma-open-location-dialog.ui");
	ret = pluma_utils_get_ui_objects (file,
					  root_objects,
					  &error_widget,
					  "open_uri_dialog_content", &content,
					  "main_vbox", &vbox,
					  "location_label", &location_label,
					  "encoding_label", &encoding_label,
					  "encoding_hbox", &encoding_hbox,
					   NULL);
	g_free (file);

	if (!ret)
	{
		gtk_widget_show (error_widget);

		gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
		                    error_widget,
		                    TRUE, TRUE, 0);
		gtk_container_set_border_width (GTK_CONTAINER (error_widget), 5);

		return;
	}

	dlg->priv->uri_entry = pluma_history_entry_new ("uri-list", FALSE);
	dlg->priv->uri_text_entry = pluma_history_entry_get_entry (PLUMA_HISTORY_ENTRY (dlg->priv->uri_entry));
	gtk_entry_set_activates_default (GTK_ENTRY (dlg->priv->uri_text_entry), TRUE);
	gtk_widget_show (dlg->priv->uri_entry);
	gtk_box_pack_start (GTK_BOX (vbox),
			    dlg->priv->uri_entry,
			    FALSE,
			    FALSE,
			    0);

	gtk_label_set_mnemonic_widget (GTK_LABEL (location_label),
				       dlg->priv->uri_entry);

	dlg->priv->encoding_menu = pluma_encodings_combo_box_new (FALSE);

	gtk_label_set_mnemonic_widget (GTK_LABEL (encoding_label),
				       dlg->priv->encoding_menu);

	gtk_box_pack_end (GTK_BOX (encoding_hbox),
			  dlg->priv->encoding_menu,
			  TRUE,
			  TRUE,
			  0);

	gtk_widget_show (dlg->priv->encoding_menu);

	g_signal_connect (dlg->priv->uri_entry,
			  "changed",
			  G_CALLBACK (entry_changed),
			  dlg);

	gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
			    content, TRUE, TRUE, 0);
	g_object_unref (content);
	gtk_container_set_border_width (GTK_CONTAINER (content), 5);
}
