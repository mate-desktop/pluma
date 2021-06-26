/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*- */
/*
 * pluma-preferences-dialog.c
 * This file is part of pluma
 *
 * Copyright (C) 2001-2005 Paolo Maggi
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
 * Modified by the pluma Team, 2001-2003. See the AUTHORS file for a
 * list of people on the pluma Team.
 * See the ChangeLog files for a list of changes.
 *
 * $Id$
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdio.h>
#include <string.h>

#include <glib/gi18n.h>
#include <gtk/gtk.h>
#include <gtksourceview/gtksource.h>
#include <libpeas-gtk/peas-gtk-plugin-manager.h>

#include "pluma-preferences-dialog.h"
#include "pluma-utils.h"
#include "pluma-debug.h"
#include "pluma-document.h"
#include "pluma-style-scheme-manager.h"
#include "pluma-help.h"
#include "pluma-dirs.h"
#include "pluma-settings.h"
#include "pluma-utils.h"

/*
 * pluma-preferences dialog is a singleton since we don't
 * want two dialogs showing an inconsistent state of the
 * preferences.
 * When pluma_show_preferences_dialog is called and there
 * is already a prefs dialog dialog open, it is reparented
 * and shown.
 */

static GtkWidget *preferences_dialog = NULL;

enum
{
	ID_COLUMN = 0,
	NAME_COLUMN,
	DESC_COLUMN,
	NUM_COLUMNS
};

typedef enum
{
	DRAW_NONE = 0,
	DRAW_TRAILING = 1,
	DRAW_ALL = 2
} DrawSpacesSettings;

struct _PlumaPreferencesDialogPrivate
{
	GSettings	*editor_settings;

	GtkWidget	*notebook;

	/* Font */
	GtkWidget	*default_font_checkbutton;
	GtkWidget	*font_button;
	GtkWidget	*font_hbox;

	/* Style Scheme */
	GtkListStore	*schemes_treeview_model;
	GtkWidget	*schemes_treeview;
	GtkWidget	*install_scheme_button;
	GtkWidget	*uninstall_scheme_button;

	GtkWidget	*install_scheme_file_schooser;

	/* Tabs */
	GtkWidget	*tabs_width_spinbutton;
	GtkWidget	*insert_spaces_checkbutton;
	GtkWidget	*tabs_width_hbox;

	/* Auto indentation */
	GtkWidget	*auto_indent_checkbutton;

	/* Draw spaces... */
	GtkWidget       *draw_spaces_checkbutton;
	GtkWidget       *draw_trailing_spaces_checkbutton;
	GtkWidget       *draw_tabs_checkbutton;
	GtkWidget       *draw_trailing_tabs_checkbutton;
	GtkWidget       *draw_newlines_checkbutton;

	/* Text Wrapping */
	GtkWidget	*wrap_text_checkbutton;
	GtkWidget	*split_checkbutton;

	/* File Saving */
	GtkWidget	*backup_copy_checkbutton;
	GtkWidget	*auto_save_checkbutton;
	GtkWidget	*auto_save_spinbutton;

	/* Line numbers */
	GtkWidget	*display_line_numbers_checkbutton;

	/* Highlight current line */
	GtkWidget	*highlight_current_line_checkbutton;

	/* Highlight matching bracket */
	GtkWidget	*bracket_matching_checkbutton;

	/* Display grid pattern */
	GtkWidget       *display_grid_checkbutton;

	/* Display overview map */
	GtkWidget	*display_overview_map_checkbutton;

	/* Right margin */
	GtkWidget	*right_margin_checkbutton;
	GtkWidget	*right_margin_position_spinbutton;

	/* Plugins manager */
	GtkWidget	*plugin_manager_place_holder;
};

G_DEFINE_TYPE_WITH_PRIVATE (PlumaPreferencesDialog, pluma_preferences_dialog, GTK_TYPE_DIALOG)

static void
pluma_preferences_dialog_dispose (GObject *object)
{
	PlumaPreferencesDialog *dlg = PLUMA_PREFERENCES_DIALOG (object);

	g_clear_object (&dlg->priv->editor_settings);

	G_OBJECT_CLASS (pluma_preferences_dialog_parent_class)->dispose (object);
}

static void
pluma_preferences_dialog_class_init (PlumaPreferencesDialogClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);

	object_class->dispose = pluma_preferences_dialog_dispose;
}

static void
dialog_response_handler (GtkDialog *dlg,
			 gint       res_id)
{
	pluma_debug (DEBUG_PREFS);

	switch (res_id)
	{
		case GTK_RESPONSE_HELP:
			pluma_help_display (GTK_WINDOW (dlg),
					    NULL,
					    "pluma-prefs");

			g_signal_stop_emission_by_name (dlg, "response");

			break;

		default:
			gtk_widget_destroy (GTK_WIDGET(dlg));
	}
}

static void
on_auto_save_changed (GSettings              *settings,
                      const gchar            *key,
                      PlumaPreferencesDialog *dlg)
{
	gboolean value;
	value = g_settings_get_boolean (settings, key);
	gtk_widget_set_sensitive (dlg->priv->auto_save_spinbutton, value);
}

static void
draw_spaces_checkbutton_toggled (GtkToggleButton        *button,
                                 PlumaPreferencesDialog *dlg)
{
	DrawSpacesSettings setting;

	pluma_debug (DEBUG_PREFS);

	g_return_if_fail (button == GTK_TOGGLE_BUTTON (dlg->priv->draw_spaces_checkbutton));

	if (gtk_toggle_button_get_active (button))
		setting = DRAW_ALL;
	else
		setting = DRAW_NONE;

	g_settings_set_enum (dlg->priv->editor_settings, PLUMA_SETTINGS_DRAWER_SPACE, setting);

#ifdef GTK_SOURCE_VERSION_3_24
	if (setting == DRAW_NONE)
		gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), FALSE);

	gtk_widget_set_sensitive (GTK_WIDGET (dlg->priv->draw_trailing_spaces_checkbutton), setting > DRAW_NONE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), setting == DRAW_NONE);
#endif
}

static void
draw_trailing_spaces_checkbutton_toggled (GtkToggleButton        *button,
                                          PlumaPreferencesDialog *dlg)
{
	pluma_debug (DEBUG_PREFS);

	g_return_if_fail (button == GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton));

	if (gtk_toggle_button_get_active (button))
		g_settings_set_enum (dlg->priv->editor_settings,
				     PLUMA_SETTINGS_DRAWER_SPACE,
				     DRAW_TRAILING);
	else
	{
		gint draw_spaces = g_settings_get_enum (dlg->priv->editor_settings,
						        PLUMA_SETTINGS_DRAWER_SPACE);

		if (draw_spaces)
			g_settings_set_enum (dlg->priv->editor_settings,
					     PLUMA_SETTINGS_DRAWER_SPACE,
					     DRAW_ALL);
		else
			g_settings_set_enum (dlg->priv->editor_settings,
					     PLUMA_SETTINGS_DRAWER_SPACE,
					     DRAW_NONE);
	}
}

static void
draw_tabs_checkbutton_toggled (GtkToggleButton        *button,
                               PlumaPreferencesDialog *dlg)
{
	DrawSpacesSettings setting;
	pluma_debug (DEBUG_PREFS);

	g_return_if_fail (button == GTK_TOGGLE_BUTTON(dlg->priv->draw_tabs_checkbutton));

	if (gtk_toggle_button_get_active (button))
		setting = DRAW_ALL;
	else
		setting = DRAW_NONE;

	g_settings_set_enum (dlg->priv->editor_settings,
			     PLUMA_SETTINGS_DRAWER_TAB,
			     setting);
#ifdef GTK_SOURCE_VERSION_3_24
	if (setting == DRAW_NONE)
		gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton), FALSE);

	gtk_widget_set_sensitive (GTK_WIDGET(dlg->priv->draw_trailing_tabs_checkbutton), setting > DRAW_NONE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON(dlg->priv->draw_trailing_tabs_checkbutton), setting == DRAW_NONE);
#endif
}

static void
draw_trailing_tabs_checkbutton_toggled (GtkToggleButton        *button,
                                        PlumaPreferencesDialog *dlg)
{
	pluma_debug (DEBUG_PREFS);

	g_return_if_fail (button == GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton));

	if (gtk_toggle_button_get_active (button))
		g_settings_set_enum (dlg->priv->editor_settings,
				     PLUMA_SETTINGS_DRAWER_TAB,
				     DRAW_TRAILING);
	else
	{
		gint draw_tabs = g_settings_get_enum (dlg->priv->editor_settings,
						     PLUMA_SETTINGS_DRAWER_TAB);

		if (draw_tabs)
			g_settings_set_enum (dlg->priv->editor_settings,
					     PLUMA_SETTINGS_DRAWER_TAB,
					     DRAW_ALL);
		else
			g_settings_set_enum (dlg->priv->editor_settings,
					     PLUMA_SETTINGS_DRAWER_TAB,
					     DRAW_NONE);
	}
}

static void
setup_editor_page (PlumaPreferencesDialog *dlg)
{
	gboolean auto_save;

	pluma_debug (DEBUG_PREFS);

	/* Get values */
	auto_save = g_settings_get_boolean (dlg->priv->editor_settings,
					    PLUMA_SETTINGS_AUTO_SAVE);

	gtk_widget_set_sensitive (dlg->priv->auto_save_spinbutton,
				  auto_save);

	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_TABS_SIZE,
			 dlg->priv->tabs_width_spinbutton,
			 "value",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_INSERT_SPACES,
			 dlg->priv->insert_spaces_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_AUTO_INDENT,
			 dlg->priv->auto_indent_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_CREATE_BACKUP_COPY,
			 dlg->priv->backup_copy_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_BRACKET_MATCHING,
			 dlg->priv->bracket_matching_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_AUTO_SAVE,
			 dlg->priv->auto_save_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_AUTO_SAVE_INTERVAL,
			 dlg->priv->auto_save_spinbutton,
			 "value",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET | G_SETTINGS_BIND_NO_SENSITIVITY);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_DRAWER_NEWLINE,
			 dlg->priv->draw_newlines_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);

	g_signal_connect (dlg->priv->editor_settings,
			  "changed::auto-save",
			  G_CALLBACK (on_auto_save_changed),
			  dlg);

	gint draw_spaces = g_settings_get_enum (dlg->priv->editor_settings, PLUMA_SETTINGS_DRAWER_SPACE);
	gint draw_tabs = g_settings_get_enum (dlg->priv->editor_settings, PLUMA_SETTINGS_DRAWER_TAB);

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_spaces_checkbutton),
				      draw_spaces > DRAW_NONE);
#ifdef GTK_SOURCE_VERSION_3_24
	gtk_widget_set_sensitive (GTK_WIDGET (dlg->priv->draw_trailing_spaces_checkbutton), draw_spaces > DRAW_NONE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), draw_spaces == DRAW_NONE);
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), draw_spaces == DRAW_TRAILING);
#else
	gtk_widget_set_sensitive (GTK_WIDGET (dlg->priv->draw_trailing_spaces_checkbutton), FALSE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), TRUE);
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_spaces_checkbutton), FALSE);
#endif
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_tabs_checkbutton), draw_tabs > DRAW_NONE);
#ifdef GTK_SOURCE_VERSION_3_24
	gtk_widget_set_sensitive (GTK_WIDGET (dlg->priv->draw_trailing_tabs_checkbutton), draw_tabs > DRAW_NONE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton), draw_tabs == DRAW_NONE);
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton), draw_tabs == DRAW_TRAILING);
#else
	gtk_widget_set_sensitive (GTK_WIDGET (dlg->priv->draw_trailing_tabs_checkbutton), FALSE);
	gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton), FALSE);
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->draw_trailing_tabs_checkbutton), FALSE);
#endif

	g_signal_connect (dlg->priv->draw_spaces_checkbutton,
	                  "toggled",
	                  G_CALLBACK (draw_spaces_checkbutton_toggled),
	                  dlg);
	g_signal_connect (dlg->priv->draw_trailing_spaces_checkbutton,
	                  "toggled",
	                  G_CALLBACK (draw_trailing_spaces_checkbutton_toggled),
	                  dlg);
	g_signal_connect (dlg->priv->draw_tabs_checkbutton,
	                  "toggled",
	                  G_CALLBACK (draw_tabs_checkbutton_toggled),
	                  dlg);
	g_signal_connect (dlg->priv->draw_trailing_tabs_checkbutton,
	                  "toggled",
	                  G_CALLBACK (draw_trailing_tabs_checkbutton_toggled),
	                  dlg);
}

static gboolean split_button_state = TRUE;

static void
wrap_mode_checkbutton_toggled (GtkToggleButton        *button,
			       PlumaPreferencesDialog *dlg)
{
	GtkWrapMode mode;

	if (!gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dlg->priv->wrap_text_checkbutton)))
	{
		mode = GTK_WRAP_NONE;

		gtk_widget_set_sensitive (dlg->priv->split_checkbutton, FALSE);

		gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), TRUE);
	}
	else
	{
		gtk_widget_set_sensitive (dlg->priv->split_checkbutton, TRUE);

		gtk_toggle_button_set_inconsistent (GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), FALSE);

		if (gtk_toggle_button_get_active (GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton)))
		{
			split_button_state = TRUE;

			mode = GTK_WRAP_WORD;
		}
		else
		{
			split_button_state = FALSE;

			mode = GTK_WRAP_CHAR;
		}
	}

	pluma_settings_set_wrap_mode (dlg->priv->editor_settings,
				      PLUMA_SETTINGS_WRAP_MODE,
				      mode);
}

static void
right_margin_checkbutton_toggled (GtkToggleButton        *button,
				  PlumaPreferencesDialog *dlg)
{
	gboolean active;

	g_return_if_fail (button == GTK_TOGGLE_BUTTON (dlg->priv->right_margin_checkbutton));

	active = gtk_toggle_button_get_active (button);

	g_settings_set_boolean (dlg->priv->editor_settings, PLUMA_SETTINGS_DISPLAY_RIGHT_MARGIN,
				active);


	gtk_widget_set_sensitive (dlg->priv->right_margin_position_spinbutton,
				  active);
}

static void
grid_checkbutton_toggled (GtkToggleButton        *button,
                          PlumaPreferencesDialog *dlg)
{
	GtkSourceBackgroundPatternType background_type;

	background_type = gtk_toggle_button_get_active (button) ?
	                  GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID :
		          GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE;
	g_settings_set_enum (dlg->priv->editor_settings,
	                     PLUMA_SETTINGS_BACKGROUND_PATTERN,
	                     background_type);
}

static void
setup_view_page (PlumaPreferencesDialog *dlg)
{
	GtkWrapMode wrap_mode;
	GtkSourceBackgroundPatternType background_pattern;
	gboolean display_right_margin;

	pluma_debug (DEBUG_PREFS);

	/* Get values */
	display_right_margin = g_settings_get_boolean (dlg->priv->editor_settings,
						       PLUMA_SETTINGS_DISPLAY_RIGHT_MARGIN);

	/* Set initial state */
	wrap_mode = pluma_settings_get_wrap_mode (dlg->priv->editor_settings,
						  PLUMA_SETTINGS_WRAP_MODE);

	background_pattern = g_settings_get_enum (dlg->priv->editor_settings,
	                                          PLUMA_SETTINGS_BACKGROUND_PATTERN);

	switch (wrap_mode)
	{
		case GTK_WRAP_WORD:
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->wrap_text_checkbutton), TRUE);
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), TRUE);
			break;
		case GTK_WRAP_CHAR:
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->wrap_text_checkbutton), TRUE);
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), FALSE);
			break;
		default:
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->wrap_text_checkbutton), FALSE);
			gtk_toggle_button_set_active (
				GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), split_button_state);
			gtk_toggle_button_set_inconsistent (
				GTK_TOGGLE_BUTTON (dlg->priv->split_checkbutton), TRUE);

	}

	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->right_margin_checkbutton),
				      display_right_margin);

	gtk_toggle_button_set_active (
		GTK_TOGGLE_BUTTON (dlg->priv->display_grid_checkbutton),
		background_pattern == GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID);

	/* Set widgets sensitivity */
	gtk_widget_set_sensitive (dlg->priv->split_checkbutton, (wrap_mode != GTK_WRAP_NONE));

	gtk_widget_set_sensitive (dlg->priv->right_margin_position_spinbutton, display_right_margin);

	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS,
			 dlg->priv->display_line_numbers_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_HIGHLIGHT_CURRENT_LINE,
			 dlg->priv->highlight_current_line_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_RIGHT_MARGIN_POSITION,
			 dlg->priv->right_margin_position_spinbutton,
			 "value",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET | G_SETTINGS_BIND_NO_SENSITIVITY);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_DISPLAY_OVERVIEW_MAP,
			 dlg->priv->display_overview_map_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);

	g_signal_connect (dlg->priv->wrap_text_checkbutton,
			  "toggled",
			  G_CALLBACK (wrap_mode_checkbutton_toggled),
			  dlg);
	g_signal_connect (dlg->priv->split_checkbutton,
			  "toggled",
			  G_CALLBACK (wrap_mode_checkbutton_toggled),
			  dlg);
	g_signal_connect (dlg->priv->right_margin_checkbutton,
			  "toggled",
			  G_CALLBACK (right_margin_checkbutton_toggled),
			  dlg);
	g_signal_connect (dlg->priv->display_grid_checkbutton,
			  "toggled",
			  G_CALLBACK (grid_checkbutton_toggled),
			  dlg);
}

static void
on_use_default_font_changed (GSettings              *settings,
                             const gchar            *key,
                             PlumaPreferencesDialog *dlg)
{
	gboolean value;

	pluma_debug (DEBUG_PREFS);

	value = g_settings_get_boolean (settings, key);

	gtk_widget_set_sensitive (dlg->priv->font_hbox, !value);
}

static void
setup_font_colors_page_font_section (PlumaPreferencesDialog *dlg)
{
	PlumaSettings *settings;
	gboolean use_default_font;
	gchar *system_font = NULL;
	gchar *label;

	pluma_debug (DEBUG_PREFS);

	gtk_widget_set_tooltip_text (dlg->priv->font_button,
			 _("Click on this button to select the font to be used by the editor"));

	pluma_utils_set_atk_relation (dlg->priv->font_button,
				      dlg->priv->default_font_checkbutton,
				      ATK_RELATION_CONTROLLED_BY);
	pluma_utils_set_atk_relation (dlg->priv->default_font_checkbutton,
				      dlg->priv->font_button,
				      ATK_RELATION_CONTROLLER_FOR);

	/* Get values */
	settings = _pluma_settings_get_singleton ();
	system_font = pluma_settings_get_system_font (settings);
	use_default_font = g_settings_get_boolean (dlg->priv->editor_settings,
						   PLUMA_SETTINGS_USE_DEFAULT_FONT);

	label = g_strdup_printf(_("_Use the system fixed width font (%s)"), system_font);
	gtk_button_set_label (GTK_BUTTON (dlg->priv->default_font_checkbutton),
			      label);
	g_free (system_font);
	g_free (label);

	/* read current config and setup initial state */
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (dlg->priv->default_font_checkbutton),
				      use_default_font);

	/* Connect signals */
	g_signal_connect (dlg->priv->editor_settings,
			  "changed::use-default-font",
			  G_CALLBACK (on_use_default_font_changed),
			  dlg);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_USE_DEFAULT_FONT,
			 dlg->priv->default_font_checkbutton,
			 "active",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);
	g_settings_bind (dlg->priv->editor_settings,
			 PLUMA_SETTINGS_EDITOR_FONT,
			 dlg->priv->font_button,
			 "font-name",
			 G_SETTINGS_BIND_GET | G_SETTINGS_BIND_SET);

	/* Set initial widget sensitivity */
	gtk_widget_set_sensitive (dlg->priv->font_hbox, !use_default_font);
}

static void
set_buttons_sensisitivity_according_to_scheme (PlumaPreferencesDialog *dlg,
					       const gchar            *scheme_id)
{
	gboolean editable;

	editable = (scheme_id != NULL) &&
	           _pluma_style_scheme_manager_scheme_is_pluma_user_scheme (
						pluma_get_style_scheme_manager (),
						scheme_id);

	gtk_widget_set_sensitive (dlg->priv->uninstall_scheme_button, editable);
}

static void
style_scheme_changed (GtkWidget              *treeview,
		      PlumaPreferencesDialog *dlg)
{
	GtkTreePath *path;
	GtkTreeIter iter;
	gchar *id;

	gtk_tree_view_get_cursor (GTK_TREE_VIEW (dlg->priv->schemes_treeview), &path, NULL);
	gtk_tree_model_get_iter (GTK_TREE_MODEL (dlg->priv->schemes_treeview_model),
				 &iter, path);
	gtk_tree_path_free (path);
	gtk_tree_model_get (GTK_TREE_MODEL (dlg->priv->schemes_treeview_model),
			    &iter, ID_COLUMN, &id, -1);

	g_settings_set_string (dlg->priv->editor_settings, PLUMA_SETTINGS_COLOR_SCHEME, id);

	set_buttons_sensisitivity_according_to_scheme (dlg, id);

	g_free (id);
}

static const gchar *
ensure_color_scheme_id (PlumaPreferencesDialog *dlg,
                        const gchar            *id)
{
	GtkSourceStyleScheme *scheme = NULL;
	GtkSourceStyleSchemeManager *manager = pluma_get_style_scheme_manager ();

	if (id == NULL)
	{
		gchar *pref_id;

		pref_id = g_settings_get_string (dlg->priv->editor_settings,
						 PLUMA_SETTINGS_COLOR_SCHEME);

		scheme = gtk_source_style_scheme_manager_get_scheme (manager,
								     pref_id);
		g_free (pref_id);
	}
	else
	{
		scheme = gtk_source_style_scheme_manager_get_scheme (manager,
								     id);
	}

	if (scheme == NULL)
	{
		/* Fall-back to classic style scheme */
		scheme = gtk_source_style_scheme_manager_get_scheme (manager,
								     "classic");
	}

	if (scheme == NULL)
	{
		/* Cannot determine default style scheme -> broken GtkSourceView installation */
		return NULL;
	}

	return 	gtk_source_style_scheme_get_id (scheme);
}

/* If def_id is NULL, use the default scheme as returned by
 * pluma_style_scheme_manager_get_default_scheme. If this one returns NULL
 * use the first available scheme as default */
static const gchar *
populate_color_scheme_list (PlumaPreferencesDialog *dlg, const gchar *def_id)
{
	GSList *schemes;
	GSList *l;

	gtk_list_store_clear (dlg->priv->schemes_treeview_model);

	def_id = ensure_color_scheme_id (dlg, def_id);
	if (def_id == NULL)
	{
		g_warning ("Cannot build the list of available color schemes.\n"
		           "Please check your GtkSourceView installation.");
		return NULL;
	}

	schemes = pluma_style_scheme_manager_list_schemes_sorted (pluma_get_style_scheme_manager ());
	l = schemes;
	while (l != NULL)
	{
		GtkSourceStyleScheme *scheme;
		const gchar *id;
		const gchar *name;
		const gchar *description;
		GtkTreeIter iter;

		scheme = GTK_SOURCE_STYLE_SCHEME (l->data);

		id = gtk_source_style_scheme_get_id (scheme);
		name = gtk_source_style_scheme_get_name (scheme);
		description = gtk_source_style_scheme_get_description (scheme);

		gtk_list_store_append (dlg->priv->schemes_treeview_model, &iter);
		gtk_list_store_set (dlg->priv->schemes_treeview_model,
				    &iter,
				    ID_COLUMN, id,
				    NAME_COLUMN, name,
				    DESC_COLUMN, description,
				    -1);

		g_return_val_if_fail (def_id != NULL, NULL);
		if (strcmp (id, def_id) == 0)
		{
			GtkTreeSelection *selection;

			selection = gtk_tree_view_get_selection (GTK_TREE_VIEW (dlg->priv->schemes_treeview));
			gtk_tree_selection_select_iter (selection, &iter);
		}

		l = g_slist_next (l);
	}

	g_slist_free (schemes);

	return def_id;
}

static void
add_scheme_chooser_response_cb (GtkDialog              *chooser,
				gint                    res_id,
				PlumaPreferencesDialog *dlg)
{
	gchar* filename;
	const gchar *scheme_id;

	if (res_id != GTK_RESPONSE_ACCEPT)
	{
		gtk_widget_hide (GTK_WIDGET (chooser));
		return;
	}

	filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (chooser));
	if (filename == NULL)
		return;

	gtk_widget_hide (GTK_WIDGET (chooser));

	scheme_id = _pluma_style_scheme_manager_install_scheme (
					pluma_get_style_scheme_manager (),
					filename);
	g_free (filename);

	if (scheme_id == NULL)
	{
		pluma_warning (GTK_WINDOW (dlg),
			       _("The selected color scheme cannot be installed."));

		return;
	}

	g_settings_set_string (dlg->priv->editor_settings, PLUMA_SETTINGS_COLOR_SCHEME,
			       scheme_id);

	scheme_id = populate_color_scheme_list (dlg, scheme_id);

	set_buttons_sensisitivity_according_to_scheme (dlg, scheme_id);
}

static GtkWidget *
scheme_file_chooser_dialog_new_valist (const gchar          *title,
				       GtkWindow            *parent,
				       GtkFileChooserAction  action,
				       const gchar          *first_button_text,
				       va_list               varargs)
{
	GtkWidget *result;
	const char *button_text = first_button_text;
	gint response_id;

	result = g_object_new (GTK_TYPE_FILE_CHOOSER_DIALOG,
			       "title", title,
			       "action", action,
			       NULL);

	if (parent)
		gtk_window_set_transient_for (GTK_WINDOW (result), parent);

	while (button_text)
		{
			response_id = va_arg (varargs, gint);

			if (g_strcmp0 (button_text, "process-stop") == 0)
				pluma_dialog_add_button (GTK_DIALOG (result), _("_Cancel"), button_text, response_id);
			else
				gtk_dialog_add_button (GTK_DIALOG (result), button_text, response_id);

			button_text = va_arg (varargs, const gchar *);
		}

	return result;
}

static GtkWidget *
scheme_file_chooser_dialog_new (const gchar          *title,
				GtkWindow            *parent,
				GtkFileChooserAction  action,
				const gchar          *first_button_text,
				...)
{
	GtkWidget *result;
	va_list varargs;

	va_start (varargs, first_button_text);
	result = scheme_file_chooser_dialog_new_valist (title, parent, action,
							first_button_text,
							varargs);
	va_end (varargs);

	return result;
}

static void
install_scheme_clicked (GtkButton              *button,
			PlumaPreferencesDialog *dlg)
{
	GtkWidget      *chooser;
	GtkFileFilter  *filter;

	if (dlg->priv->install_scheme_file_schooser != NULL) {
		gtk_window_present (GTK_WINDOW (dlg->priv->install_scheme_file_schooser));
		gtk_widget_grab_focus (dlg->priv->install_scheme_file_schooser);
		return;
	}

	chooser = scheme_file_chooser_dialog_new (_("Add Scheme"),
						  GTK_WINDOW (dlg),
						  GTK_FILE_CHOOSER_ACTION_OPEN,
						  "process-stop", GTK_RESPONSE_CANCEL,
						  NULL);

	pluma_dialog_add_button (GTK_DIALOG (chooser),
				 _("A_dd Scheme"),
				 "list-add",
				 GTK_RESPONSE_ACCEPT);

	gtk_window_set_destroy_with_parent (GTK_WINDOW (chooser), TRUE);

	/* Filters */
	filter = gtk_file_filter_new ();
	gtk_file_filter_set_name (filter, _("Color Scheme Files"));
	gtk_file_filter_add_pattern (filter, "*.xml");
	gtk_file_chooser_add_filter (GTK_FILE_CHOOSER (chooser), filter);

	gtk_file_chooser_set_filter (GTK_FILE_CHOOSER (chooser), filter);

	filter = gtk_file_filter_new ();
	gtk_file_filter_set_name (filter, _("All Files"));
	gtk_file_filter_add_pattern (filter, "*");
	gtk_file_chooser_add_filter (GTK_FILE_CHOOSER (chooser), filter);

	gtk_dialog_set_default_response (GTK_DIALOG (chooser), GTK_RESPONSE_ACCEPT);

	g_signal_connect (chooser,
			  "response",
			  G_CALLBACK (add_scheme_chooser_response_cb),
			  dlg);

	dlg->priv->install_scheme_file_schooser = chooser;

	g_object_add_weak_pointer (G_OBJECT (chooser),
				   (gpointer) &dlg->priv->install_scheme_file_schooser);

	gtk_widget_show (chooser);
}

static void
uninstall_scheme_clicked (GtkButton              *button,
			  PlumaPreferencesDialog *dlg)
{
	GtkTreeSelection *selection;
	GtkTreeModel *model;
	GtkTreeIter iter;

	selection = gtk_tree_view_get_selection (GTK_TREE_VIEW (dlg->priv->schemes_treeview));
	model = GTK_TREE_MODEL (dlg->priv->schemes_treeview_model);

	if (gtk_tree_selection_get_selected (selection,
					     &model,
					     &iter))
	{
		gchar *id;
		gchar *name;

		gtk_tree_model_get (model, &iter,
				    ID_COLUMN, &id,
				    NAME_COLUMN, &name,
				    -1);

		if (!_pluma_style_scheme_manager_uninstall_scheme (pluma_get_style_scheme_manager (), id))
		{
			pluma_warning (GTK_WINDOW (dlg),
				       _("Could not remove color scheme \"%s\"."),
				       name);
		}
		else
		{
			const gchar *real_new_id;
			gchar *new_id = NULL;
			GtkTreePath *path;
			GtkTreeIter new_iter;
			gboolean new_iter_set = FALSE;

			/* If the removed style scheme is the last of the list,
			 * set as new default style scheme the previous one,
			 * otherwise set the next one.
			 * To make this possible, we need to get the id of the
			 * new default style scheme before re-populating the list.
			 * Fall back to "classic" if it is not possible to get
			 * the id
			 */
			path = gtk_tree_model_get_path (model, &iter);

			/* Try to move to the next path */
			gtk_tree_path_next (path);
			if (!gtk_tree_model_get_iter (model, &new_iter, path))
			{
				/* It seems the removed style scheme was the
				 * last of the list. Try to move to the
				 * previous one */
				gtk_tree_path_free (path);

				path = gtk_tree_model_get_path (model, &iter);

				gtk_tree_path_prev (path);
				if (gtk_tree_model_get_iter (model, &new_iter, path))
					new_iter_set = TRUE;
			}
			else
				new_iter_set = TRUE;

			gtk_tree_path_free (path);

			if (new_iter_set)
				gtk_tree_model_get (model, &new_iter,
						    ID_COLUMN, &new_id,
						    -1);

			real_new_id = populate_color_scheme_list (dlg, new_id);
			g_free (new_id);

			set_buttons_sensisitivity_according_to_scheme (dlg, real_new_id);

			if (real_new_id != NULL)
			{
				g_settings_set_string (dlg->priv->editor_settings,
						       PLUMA_SETTINGS_COLOR_SCHEME,
						       real_new_id);
			}

		}

		g_free (id);
		g_free (name);
	}
}

static void
scheme_description_cell_data_func (GtkTreeViewColumn *column,
				   GtkCellRenderer   *renderer,
				   GtkTreeModel      *model,
				   GtkTreeIter       *iter,
				   gpointer           data)
{
	gchar *name;
	gchar *desc;
	gchar *text;

	gtk_tree_model_get (model, iter,
			    NAME_COLUMN, &name,
			    DESC_COLUMN, &desc,
			    -1);

	if (desc != NULL)
	{
		text = g_markup_printf_escaped ("<b>%s</b> - %s",
						name,
						desc);
	}
	else
	{
		text = g_markup_printf_escaped ("<b>%s</b>",
						name);
	}

	g_free (name);
	g_free (desc);

	g_object_set (G_OBJECT (renderer),
		      "markup",
		      text,
		      NULL);

	g_free (text);
}

static void
setup_font_colors_page_style_scheme_section (PlumaPreferencesDialog *dlg)
{
	GtkCellRenderer *renderer;
	GtkTreeViewColumn *column;
	GtkTreeSelection *selection;
	const gchar *def_id;

	pluma_debug (DEBUG_PREFS);

	/* Create GtkListStore for styles & setup treeview. */
	dlg->priv->schemes_treeview_model = gtk_list_store_new (NUM_COLUMNS,
								G_TYPE_STRING,
								G_TYPE_STRING,
								G_TYPE_STRING,
								G_TYPE_STRING);

	gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (dlg->priv->schemes_treeview_model),
					      0,
					      GTK_SORT_ASCENDING);
	gtk_tree_view_set_model (GTK_TREE_VIEW (dlg->priv->schemes_treeview),
				 GTK_TREE_MODEL (dlg->priv->schemes_treeview_model));

	column = gtk_tree_view_column_new ();

	renderer = gtk_cell_renderer_text_new ();
	g_object_set (renderer, "ellipsize", PANGO_ELLIPSIZE_END, NULL);
	gtk_tree_view_column_pack_start (column, renderer, TRUE);
	gtk_tree_view_column_set_cell_data_func (column,
						 renderer,
						 scheme_description_cell_data_func,
						 dlg,
						 NULL);

	gtk_tree_view_append_column (GTK_TREE_VIEW (dlg->priv->schemes_treeview),
				     column);

	selection = gtk_tree_view_get_selection (GTK_TREE_VIEW (dlg->priv->schemes_treeview));
	gtk_tree_selection_set_mode (selection, GTK_SELECTION_BROWSE);

	def_id = populate_color_scheme_list (dlg, NULL);

	gtk_button_set_image (GTK_BUTTON (dlg->priv->uninstall_scheme_button),
			      gtk_image_new_from_icon_name ("list-remove", GTK_ICON_SIZE_BUTTON));

	/* Connect signals */
	g_signal_connect (dlg->priv->schemes_treeview,
			  "cursor-changed",
			  G_CALLBACK (style_scheme_changed),
			  dlg);
	g_signal_connect (dlg->priv->install_scheme_button,
			  "clicked",
			  G_CALLBACK (install_scheme_clicked),
			  dlg);
	g_signal_connect (dlg->priv->uninstall_scheme_button,
			  "clicked",
			  G_CALLBACK (uninstall_scheme_clicked),
			  dlg);

	/* Set initial widget sensitivity */
	set_buttons_sensisitivity_according_to_scheme (dlg, def_id);
}

static void
setup_font_colors_page (PlumaPreferencesDialog *dlg)
{
	setup_font_colors_page_font_section (dlg);
	setup_font_colors_page_style_scheme_section (dlg);
}

static void
setup_plugins_page (PlumaPreferencesDialog *dlg)
{
	GtkWidget *page_content;

	pluma_debug (DEBUG_PREFS);

	page_content = peas_gtk_plugin_manager_new (NULL);
	g_return_if_fail (page_content != NULL);

	gtk_box_pack_start (GTK_BOX (dlg->priv->plugin_manager_place_holder),
			    page_content,
			    TRUE,
			    TRUE,
			    0);

	gtk_widget_show_all (page_content);
}

static gboolean
on_notebook_scroll_event (GtkWidget        *widget,
                          GdkEventScroll   *event)

{
    GtkNotebook *notebook = GTK_NOTEBOOK (widget);
    GtkWidget *child, *event_widget, *action_widget;

    child = gtk_notebook_get_nth_page (notebook, gtk_notebook_get_current_page (notebook));
    if (child == NULL)
        return FALSE;

    event_widget = gtk_get_event_widget ((GdkEvent*) event);

    /* Ignore scroll events from the content of the page */
    if (event_widget == NULL || event_widget == child || gtk_widget_is_ancestor (event_widget, child))
        return FALSE;

    /* And also from the action widgets */
    action_widget = gtk_notebook_get_action_widget (notebook, GTK_PACK_START);
    if (event_widget == action_widget || (action_widget != NULL && gtk_widget_is_ancestor (event_widget, action_widget)))
        return FALSE;

    action_widget = gtk_notebook_get_action_widget (notebook, GTK_PACK_END);
    if (event_widget == action_widget || (action_widget != NULL && gtk_widget_is_ancestor (event_widget, action_widget)))
        return FALSE;

    switch (event->direction) {
        case GDK_SCROLL_RIGHT:
        case GDK_SCROLL_DOWN:
            gtk_notebook_next_page (notebook);
            break;
        case GDK_SCROLL_LEFT:
        case GDK_SCROLL_UP:
            gtk_notebook_prev_page (notebook);
            break;
        case GDK_SCROLL_SMOOTH:
            switch (gtk_notebook_get_tab_pos (notebook)) {
                case GTK_POS_LEFT:
                case GTK_POS_RIGHT:
                    if (event->delta_y > 0)
                        gtk_notebook_next_page (notebook);
                    else if (event->delta_y < 0)
                        gtk_notebook_prev_page (notebook);
                    break;
                case GTK_POS_TOP:
                case GTK_POS_BOTTOM:
                    if (event->delta_x > 0)
                        gtk_notebook_next_page (notebook);
                    else if (event->delta_x < 0)
                        gtk_notebook_prev_page (notebook);
                    break;
            }
            break;
    }

    return TRUE;
}

static void
pluma_preferences_dialog_init (PlumaPreferencesDialog *dlg)
{
	GtkWidget *error_widget;
	gboolean ret;
	gchar *root_objects[] = {
		"notebook",
		"adjustment1",
		"adjustment2",
		"adjustment3",
		"install_scheme_image",
		NULL
	};

	pluma_debug (DEBUG_PREFS);

	dlg->priv = pluma_preferences_dialog_get_instance_private (dlg);

	dlg->priv->editor_settings = g_settings_new (PLUMA_SCHEMA_ID);

	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_Close"), "window-close", GTK_RESPONSE_CLOSE);
	pluma_dialog_add_button (GTK_DIALOG (dlg), _("_Help"), "help-browser", GTK_RESPONSE_HELP);

	gtk_window_set_title (GTK_WINDOW (dlg), _("Pluma Preferences"));
	gtk_window_set_resizable (GTK_WINDOW (dlg), FALSE);
	gtk_window_set_destroy_with_parent (GTK_WINDOW (dlg), TRUE);

	/* HIG defaults */
	gtk_container_set_border_width (GTK_CONTAINER (dlg), 5);
	gtk_box_set_spacing (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))), 2); /* 2 * 5 + 2 = 12 */

	g_signal_connect (dlg,
			  "response",
			  G_CALLBACK (dialog_response_handler),
			  NULL);

	ret = pluma_utils_get_ui_objects (PLUMA_DATADIR "/ui/pluma-preferences-dialog.ui",
		root_objects,
		&error_widget,

		"notebook", &dlg->priv->notebook,

		"display_line_numbers_checkbutton", &dlg->priv->display_line_numbers_checkbutton,
		"highlight_current_line_checkbutton", &dlg->priv->highlight_current_line_checkbutton,
		"bracket_matching_checkbutton", &dlg->priv->bracket_matching_checkbutton,
		"display_overview_map_checkbutton", &dlg->priv->display_overview_map_checkbutton,
		"display_grid_checkbutton", &dlg->priv->display_grid_checkbutton,
		"wrap_text_checkbutton", &dlg->priv->wrap_text_checkbutton,
		"split_checkbutton", &dlg->priv->split_checkbutton,

		"right_margin_checkbutton", &dlg->priv->right_margin_checkbutton,
		"right_margin_position_spinbutton", &dlg->priv->right_margin_position_spinbutton,

		"tabs_width_spinbutton", &dlg->priv->tabs_width_spinbutton,
		"tabs_width_hbox", &dlg->priv->tabs_width_hbox,
		"insert_spaces_checkbutton", &dlg->priv->insert_spaces_checkbutton,

		"auto_indent_checkbutton", &dlg->priv->auto_indent_checkbutton,

		"draw_spaces_checkbutton", &dlg->priv->draw_spaces_checkbutton,
		"draw_trailing_spaces_checkbutton", &dlg->priv->draw_trailing_spaces_checkbutton,
		"draw_tabs_checkbutton", &dlg->priv->draw_tabs_checkbutton,
		"draw_trailing_tabs_checkbutton", &dlg->priv->draw_trailing_tabs_checkbutton,
		"draw_newlines_checkbutton", &dlg->priv->draw_newlines_checkbutton,

		"backup_copy_checkbutton", &dlg->priv->backup_copy_checkbutton,
		"auto_save_checkbutton", &dlg->priv->auto_save_checkbutton,
		"auto_save_spinbutton", &dlg->priv->auto_save_spinbutton,

		"default_font_checkbutton", &dlg->priv->default_font_checkbutton,
		"font_button", &dlg->priv->font_button,
		"font_hbox", &dlg->priv->font_hbox,

		"schemes_treeview", &dlg->priv->schemes_treeview,
		"install_scheme_button", &dlg->priv->install_scheme_button,
		"uninstall_scheme_button", &dlg->priv->uninstall_scheme_button,

		"plugin_manager_place_holder", &dlg->priv->plugin_manager_place_holder,

		NULL);

	if (!ret)
	{
		gtk_widget_show (error_widget);

		gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
		                    error_widget,
		                    TRUE, TRUE, 0);

		return;
	}

	gtk_box_pack_start (GTK_BOX (gtk_dialog_get_content_area (GTK_DIALOG (dlg))),
			    dlg->priv->notebook, FALSE, FALSE, 0);
	g_object_unref (dlg->priv->notebook);
	gtk_container_set_border_width (GTK_CONTAINER (dlg->priv->notebook), 5);

	gtk_widget_add_events (dlg->priv->notebook, GDK_SCROLL_MASK);
	g_signal_connect (dlg->priv->notebook,
			  "scroll-event",
			  G_CALLBACK (on_notebook_scroll_event),
			  NULL);

	setup_editor_page (dlg);
	setup_view_page (dlg);
	setup_font_colors_page (dlg);
	setup_plugins_page (dlg);
}

void
pluma_show_preferences_dialog (PlumaWindow *parent)
{
	pluma_debug (DEBUG_PREFS);

	g_return_if_fail (PLUMA_IS_WINDOW (parent));

	if (preferences_dialog == NULL)
	{
		preferences_dialog = GTK_WIDGET (g_object_new (PLUMA_TYPE_PREFERENCES_DIALOG, NULL));
		g_signal_connect (preferences_dialog,
				  "destroy",
				  G_CALLBACK (gtk_widget_destroyed),
				  &preferences_dialog);
	}

	if (GTK_WINDOW (parent) != gtk_window_get_transient_for (GTK_WINDOW (preferences_dialog)))
	{
		gtk_window_set_transient_for (GTK_WINDOW (preferences_dialog),
					      GTK_WINDOW (parent));
	}

	gtk_window_present (GTK_WINDOW (preferences_dialog));
}
