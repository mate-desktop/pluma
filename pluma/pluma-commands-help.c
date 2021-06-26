/*
 * pluma-help-commands.c
 * This file is part of pluma
 *
 * Copyright (C) 1998, 1999 Alex Roberts, Evan Lawrence
 * Copyright (C) 2000, 2001 Chema Celorio, Paolo Maggi
 * Copyright (C) 2002-2005 Paolo Maggi
 * Copyright (C) 2011 Perberos
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
 * Modified by the gedit Team, 1998-2005. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <glib.h>
#include <glib/gi18n.h>
#include <gtk/gtk.h>

#include "pluma-commands.h"
#include "pluma-debug.h"
#include "pluma-help.h"
#include "pluma-dirs.h"

void _pluma_cmd_help_contents(GtkAction* action, PlumaWindow* window)
{
	pluma_debug(DEBUG_COMMANDS);

	pluma_help_display(GTK_WINDOW(window), NULL, NULL);
}

#define ABOUT_GROUP "About"
#define EMAILIFY(string) (g_strdelimit ((string), "%", '@'))

void _pluma_cmd_help_about(GtkAction* action, PlumaWindow* window)
{
	static const gchar* documenters[] = {
		N_("MATE Documentation Team"),
		N_("GNOME Documentation Team"),
		N_("Sun Microsystems"),
		NULL
	};

	static const gchar comments[] = \
		N_("Pluma is a small and lightweight text editor for the MATE Desktop Environment.");

	static const gchar *license[] ={
		N_("Pluma is free software; you can redistribute it and/or modify "
		"it under the terms of the GNU General Public License as published by "
		"the Free Software Foundation; either version 2 of the License, or "
		"(at your option) any later version."),
		N_("Pluma is distributed in the hope that it will be useful, "
		"but WITHOUT ANY WARRANTY; without even the implied warranty of "
		"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the "
		"GNU General Public License for more details."),
		N_("You should have received a copy of the GNU General Public License "
		"along with Pluma; if not, write to the Free Software Foundation, Inc., "
		"51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA")
	};

	gchar *license_trans;
	GKeyFile *key_file;
	GError *error = NULL;
	char **authors;
	gsize n_authors = 0, i;
	static const gchar **p;

	pluma_debug (DEBUG_COMMANDS);

	key_file = g_key_file_new ();
	if (!g_key_file_load_from_file (key_file, PLUMA_DATADIR G_DIR_SEPARATOR_S "pluma.about", 0, &error)) {
		g_warning ("Couldn't load about data: %s\n", error->message);
		g_error_free (error);
		g_key_file_free (key_file);
		return;
	}

	authors = g_key_file_get_string_list (key_file, ABOUT_GROUP, "Authors", &n_authors, NULL);
	g_key_file_free (key_file);

	for (i = 0; i < n_authors; ++i)
		authors[i] = EMAILIFY (authors[i]);

	license_trans = g_strjoin ("\n\n", _(license[0]), _(license[1]), _(license[2]), NULL);

	for (p = documenters; *p; ++p)
		*p = _(*p);

	gtk_show_about_dialog(GTK_WINDOW(window),
		"program-name", "Pluma",
		"title", _("About Pluma"),
		"authors", authors,
		"comments", _(comments),
		"copyright", _("Copyright \xc2\xa9 1998-2000 Evan Lawrence, Alex Robert\n"
		               "Copyright \xc2\xa9 2000-2002 Chema Celorio, Paolo Maggi\n"
		               "Copyright \xc2\xa9 2003-2006 Paolo Maggi\n"
		               "Copyright \xc2\xa9 2004-2010 Paolo Borelli, Jesse van den Kieboom\nSteve Fr\303\251cinaux, Ignacio Casal Quinteiro\n"
		               "Copyright \xc2\xa9 2011 Perberos\n"
		               "Copyright \xc2\xa9 2012-2021 MATE developers"),
		"license", license_trans,
		"wrap-license", TRUE,
		"documenters", documenters,
		"logo_icon_name", "accessories-text-editor",
		"translator-credits", _("translator-credits"),
		"version", VERSION,
		"website", PACKAGE_URL,
		NULL);

	g_strfreev (authors);
	g_free (license_trans);
}
