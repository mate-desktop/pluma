/*
 * pluma-close-button.c
 * This file is part of pluma
 *
 * Copyright (C) 2010 - Paolo Borelli
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

#include "pluma-close-button.h"

G_DEFINE_TYPE (PlumaCloseButton, pluma_close_button, GTK_TYPE_BUTTON)

static void
pluma_close_button_class_init (PlumaCloseButtonClass *klass)
{
}

static void
pluma_close_button_init (PlumaCloseButton *button)
{
	GtkWidget *image;
	GtkCssProvider *css;
	GError *error = NULL;
	const gchar button_style[] =
		"* {\n"
		"	padding: 0;\n"
		"}";

	image = gtk_image_new_from_icon_name ("gtk-close",
	                                      GTK_ICON_SIZE_MENU);
	gtk_widget_show (image);

	gtk_container_add (GTK_CONTAINER (button), image);

	/* make it as small as possible */
	css = gtk_css_provider_new ();
	if (gtk_css_provider_load_from_data (css, button_style,
	                                     -1, &error))
	{
		GtkStyleContext *context;

		context = gtk_widget_get_style_context (GTK_WIDGET (button));
		gtk_style_context_add_provider (context, GTK_STYLE_PROVIDER (css),
			                        GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
		g_object_unref (css);
	}
	else
	{
		g_warning ("%s", error->message);
		g_error_free (error);
	}
}

GtkWidget *
pluma_close_button_new ()
{
	return GTK_WIDGET (g_object_new (PLUMA_TYPE_CLOSE_BUTTON,
	                                 "relief", GTK_RELIEF_NONE,
	                                 "focus-on-click", FALSE,
	                                 NULL));
}

