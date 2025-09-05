/*
 * pluma-application.c
 * This file is part of pluma
 *
 * Copyright (C) 2025 MATE Developers
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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <locale.h>
#include <glib/gi18n.h>

#include "pluma-application.h"
#include "pluma-debug.h"
#include "pluma-dirs.h"
#include "pluma-plugins-engine.h"
#include "pluma-session.h"
#include "pluma-settings.h"
#include "pluma-app.h"
#include "pluma-window.h"
#include "pluma-commands.h"

#include "eggdesktopfile.h"

#ifndef ENABLE_GVFS_METADATA
#include "pluma-metadata-manager.h"
#endif

struct _PlumaApplicationPrivate
{
	/* command line */
	gint line_position;
	gchar *encoding_charset;
	gboolean new_window_option;
	gboolean new_document_option;
	GSList *file_list;

	/* Application state */
	gboolean session_restored;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaApplication, pluma_application, GTK_TYPE_APPLICATION)

static void pluma_application_free_command_line_data (PlumaApplication *app);

static void
pluma_application_activate (GApplication *application)
{
	PlumaApp *app;
	PlumaWindow *window;
	gboolean restored = FALSE;

	pluma_debug_message (DEBUG_APP, "PlumaApplication activate");

	/* Chain up to parent */
	G_APPLICATION_CLASS (pluma_application_parent_class)->activate (application);

	if (pluma_session_is_restored ())
		restored = pluma_session_load ();

	if (!restored)
	{
		PlumaApplication *pluma_app = PLUMA_APPLICATION (application);
		PlumaApplicationPrivate *priv = pluma_app->priv;

		pluma_debug_message (DEBUG_APP, "Get default app");
		app = pluma_app_get_default ();

		pluma_debug_message (DEBUG_APP, "Create main window");
		window = pluma_app_create_window (app, NULL);
		gtk_application_add_window (GTK_APPLICATION (application), GTK_WINDOW (window));
		gtk_widget_set_size_request (GTK_WIDGET (window), 250, 250);

		if (priv->file_list != NULL)
		{
			const PlumaEncoding *encoding = NULL;

			if (priv->encoding_charset)
				encoding = pluma_encoding_get_from_charset (priv->encoding_charset);

			pluma_debug_message (DEBUG_APP, "Load files");
			_pluma_cmd_load_files_from_prompt (window,
							   priv->file_list,
							   encoding,
							   priv->line_position);
		}
		else
		{
			pluma_debug_message (DEBUG_APP, "Create tab");
			pluma_window_create_tab (window, TRUE);
		}

		if (priv->new_document_option)
			pluma_window_create_tab (window, TRUE);

		pluma_debug_message (DEBUG_APP, "Show window");
		gtk_widget_show (GTK_WIDGET (window));

		pluma_application_free_command_line_data (pluma_app);
	}
}

static void
pluma_application_startup (GApplication *application)
{
	pluma_debug_message (DEBUG_APP, "PlumaApplication startup");

	/* Chain up to parent first */
	G_APPLICATION_CLASS (pluma_application_parent_class)->startup (application);

	/* Most initialization is done in main() before GtkApplication starts */
	/* Only do the minimal setup here that needs to happen in the GtkApplication context */

	pluma_debug_message (DEBUG_APP, "Set icon");
	gtk_icon_theme_append_search_path (gtk_icon_theme_get_default (),
					   PLUMA_DATADIR "/icons");

	/* Set the associated .desktop file */
	egg_set_desktop_file (DATADIR "/applications/pluma.desktop");

	/* Init plugins engine */
	pluma_debug_message (DEBUG_APP, "Init plugins");
	pluma_plugins_engine_get_default ();

	/* Initialize session management */
	pluma_debug_message (DEBUG_APP, "Init session manager");
	pluma_session_init ();
}

static void
pluma_application_shutdown (GApplication *application)
{
	pluma_debug_message (DEBUG_APP, "PlumaApplication shutdown");

	pluma_settings_unref_singleton ();

#ifndef ENABLE_GVFS_METADATA
	pluma_metadata_manager_shutdown ();
#endif

	/* Chain up to parent */
	G_APPLICATION_CLASS (pluma_application_parent_class)->shutdown (application);
}

static void
pluma_application_free_command_line_data (PlumaApplication *app)
{
	PlumaApplicationPrivate *priv = app->priv;

	if (priv->file_list)
	{
		g_slist_free_full (priv->file_list, g_object_unref);
		priv->file_list = NULL;
	}

	g_free (priv->encoding_charset);
	priv->encoding_charset = NULL;

	priv->new_window_option = FALSE;
	priv->new_document_option = FALSE;
	priv->line_position = 0;
}


static int
pluma_application_command_line (GApplication            *application,
                                GApplicationCommandLine *command_line)
{
	pluma_debug_message (DEBUG_APP, "PlumaApplication command_line");

	/* Command line parsing is already done in main() before GtkApplication starts */
	/* Just activate the application to handle the parsed data */
	g_application_activate (application);

	return 0;
}

static void
pluma_application_finalize (GObject *object)
{
	PlumaApplication *app = PLUMA_APPLICATION (object);

	pluma_debug_message (DEBUG_APP, "PlumaApplication finalize");

	pluma_application_free_command_line_data (app);

	/* Chain up to parent */
	G_OBJECT_CLASS (pluma_application_parent_class)->finalize (object);
}

static void
pluma_application_class_init (PlumaApplicationClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);
	GApplicationClass *application_class = G_APPLICATION_CLASS (klass);

	object_class->finalize = pluma_application_finalize;

	application_class->activate = pluma_application_activate;
	application_class->startup = pluma_application_startup;
	application_class->shutdown = pluma_application_shutdown;
	application_class->command_line = pluma_application_command_line;
}

static void
pluma_application_init (PlumaApplication *application)
{
	pluma_debug_message (DEBUG_APP, "PlumaApplication init");

	application->priv = pluma_application_get_instance_private (application);
}

void
pluma_application_set_command_line_options (PlumaApplication *app,
                                            gint line_pos,
                                            const gchar *encoding,
                                            gboolean new_window,
                                            gboolean new_document,
                                            GSList *file_list)
{
	PlumaApplicationPrivate *priv = app->priv;

	pluma_application_free_command_line_data (app);

	priv->line_position = line_pos;
	priv->new_window_option = new_window;
	priv->new_document_option = new_document;
	priv->encoding_charset = g_strdup (encoding);

	if (file_list)
	{
		GSList *l;
		for (l = file_list; l != NULL; l = l->next)
		{
			priv->file_list = g_slist_prepend (priv->file_list, g_object_ref (l->data));
		}
		priv->file_list = g_slist_reverse (priv->file_list);
	}

	if (priv->encoding_charset &&
	    (pluma_encoding_get_from_charset (priv->encoding_charset) == NULL))
	{
		g_free (priv->encoding_charset);
		priv->encoding_charset = NULL;
	}
}

PlumaApplication *
pluma_application_new (void)
{
	return g_object_new (PLUMA_TYPE_APPLICATION,
	                     "application-id", "org.mate.Pluma",
	                     "flags", G_APPLICATION_HANDLES_OPEN | G_APPLICATION_HANDLES_COMMAND_LINE,
	                     NULL);
}
