/*
 * pluma-settings.h
 * This file is part of pluma
 *
 * Copyright (C) 2009 - Ignacio Casal Quinteiro
 *               2002 - Paolo Maggi
 * Copyright (C) 2012-2021 MATE Developers
 *
 * pluma is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * pluma is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with pluma; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA  02110-1301  USA
 */

#ifndef __PLUMA_SETTINGS_H__
#define __PLUMA_SETTINGS_H__

#include <glib-object.h>
#include <glib.h>
#include "pluma-app.h"

G_BEGIN_DECLS

#define PLUMA_TYPE_SETTINGS             (pluma_settings_get_type ())
#define PLUMA_SETTINGS(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), PLUMA_TYPE_SETTINGS, PlumaSettings))
#define PLUMA_SETTINGS_CONST(obj)       (G_TYPE_CHECK_INSTANCE_CAST ((obj), PLUMA_TYPE_SETTINGS, PlumaSettings const))
#define PLUMA_SETTINGS_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), PLUMA_TYPE_SETTINGS, PlumaSettingsClass))
#define PLUMA_IS_SETTINGS(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PLUMA_TYPE_SETTINGS))
#define PLUMA_IS_SETTINGS_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), PLUMA_TYPE_SETTINGS))
#define PLUMA_SETTINGS_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), PLUMA_TYPE_SETTINGS, PlumaSettingsClass))

typedef struct _PlumaSettings           PlumaSettings;
typedef struct _PlumaSettingsClass      PlumaSettingsClass;
typedef struct _PlumaSettingsPrivate    PlumaSettingsPrivate;

struct _PlumaSettings
{
    GObject parent;

    PlumaSettingsPrivate *priv;
};

struct _PlumaSettingsClass
{
    GObjectClass parent_class;
};

typedef enum {
    PLUMA_TOOLBAR_SYSTEM = 0,
    PLUMA_TOOLBAR_ICONS,
    PLUMA_TOOLBAR_ICONS_AND_TEXT,
    PLUMA_TOOLBAR_ICONS_BOTH_HORIZ
} PlumaToolbarSetting;

GType                   pluma_settings_get_type             (void) G_GNUC_CONST;

G_GNUC_INTERNAL
PlumaSettings *        _pluma_settings_get_singleton        (void);

void                    pluma_settings_unref_singleton      (void);

PlumaLockdownMask       pluma_settings_get_lockdown         (PlumaSettings *self);

gchar                  *pluma_settings_get_system_font      (PlumaSettings *self);

GtkSourceSmartHomeEndType pluma_settings_get_smart_home_end (PlumaSettings *self);

PlumaToolbarSetting     pluma_settings_get_toolbar_style    (PlumaSettings *self);

/* Utility functions */
GSList                 *pluma_settings_get_list             (GSettings   *settings,
                                                             const gchar *key);

void                    pluma_settings_set_list             (GSettings    *settings,
                                                             const gchar  *key,
                                                             GSList *list);

GtkWrapMode             pluma_settings_get_wrap_mode        (GSettings    *settings,
                                                             const gchar  *key);

void                    pluma_settings_set_wrap_mode        (GSettings    *settings,
                                                             const gchar  *key,
                                                             GtkWrapMode   mode);

GSList *                pluma_settings_get_writable_vfs_schemes (GSettings *settings);

#define PLUMA_SCHEMA_ID                    "org.mate.pluma"

/* key constants */
#define PLUMA_SETTINGS_USE_DEFAULT_FONT             "use-default-font"
#define PLUMA_SETTINGS_EDITOR_FONT                  "editor-font"
#define PLUMA_SETTINGS_COLOR_SCHEME                 "color-scheme"
#define PLUMA_SETTINGS_CREATE_BACKUP_COPY           "create-backup-copy"
#define PLUMA_SETTINGS_AUTO_SAVE                    "auto-save"
#define PLUMA_SETTINGS_AUTO_SAVE_INTERVAL           "auto-save-interval"
#define PLUMA_SETTINGS_MAX_UNDO_ACTIONS             "max-undo-actions"
#define PLUMA_SETTINGS_WRAP_MODE                    "wrap-mode"
#define PLUMA_SETTINGS_TABS_SIZE                    "tabs-size"
#define PLUMA_SETTINGS_INSERT_SPACES                "insert-spaces"
#define PLUMA_SETTINGS_AUTO_INDENT                  "auto-indent"
#define PLUMA_SETTINGS_DISPLAY_LINE_NUMBERS         "display-line-numbers"
#define PLUMA_SETTINGS_HIGHLIGHT_CURRENT_LINE       "highlight-current-line"
#define PLUMA_SETTINGS_BRACKET_MATCHING             "bracket-matching"
#define PLUMA_SETTINGS_DISPLAY_RIGHT_MARGIN         "display-right-margin"
#define PLUMA_SETTINGS_RIGHT_MARGIN_POSITION        "right-margin-position"
#define PLUMA_SETTINGS_WRITABLE_VFS_SCHEMES         "writable-vfs-schemes"
#define PLUMA_SETTINGS_RESTORE_CURSOR_POSITION      "restore-cursor-position"
#define PLUMA_SETTINGS_SYNTAX_HIGHLIGHTING          "syntax-highlighting"
#define PLUMA_SETTINGS_SEARCH_HIGHLIGHTING          "search-highlighting"
#define PLUMA_SETTINGS_TOOLBAR_VISIBLE              "toolbar-visible"
#define PLUMA_SETTINGS_STATUSBAR_VISIBLE            "statusbar-visible"
#define PLUMA_SETTINGS_SIDE_PANE_VISIBLE            "side-pane-visible"
#define PLUMA_SETTINGS_BOTTOM_PANE_VISIBLE          "bottom-panel-visible"
#define PLUMA_SETTINGS_MAX_RECENTS                  "max-recents"
#define PLUMA_SETTINGS_PRINT_SYNTAX_HIGHLIGHTING    "print-syntax-highlighting"
#define PLUMA_SETTINGS_PRINT_HEADER                 "print-header"
#define PLUMA_SETTINGS_PRINT_WRAP_MODE              "print-wrap-mode"
#define PLUMA_SETTINGS_PRINT_LINE_NUMBERS           "print-line-numbers"
#define PLUMA_SETTINGS_PRINT_FONT_BODY_PANGO        "print-font-body-pango"
#define PLUMA_SETTINGS_PRINT_FONT_HEADER_PANGO      "print-font-header-pango"
#define PLUMA_SETTINGS_PRINT_FONT_NUMBERS_PANGO     "print-font-numbers-pango"
#define PLUMA_SETTINGS_ENCODING_AUTO_DETECTED       "auto-detected-encodings"
#define PLUMA_SETTINGS_ENCODING_SHOWN_IN_MENU       "shown-in-menu-encodings"
#define PLUMA_SETTINGS_ACTIVE_PLUGINS               "active-plugins"
#define PLUMA_SETTINGS_SHOW_SINGLE_TAB              "show-single-tab"
#define PLUMA_SETTINGS_SHOW_TABS_WITH_SIDE_PANE     "show-tabs-with-side-pane"
#define PLUMA_SETTINGS_CTRL_TABS_SWITCH_TABS        "ctrl-tab-switch-tabs"
#define PLUMA_SETTINGS_SHOW_SAVE_CONFIRMATION       "show-save-confirmation"
#define PLUMA_SETTINGS_DRAWER_SPACE                 "enable-space-drawer-space"
#define PLUMA_SETTINGS_DRAWER_TAB                   "enable-space-drawer-tab"
#define PLUMA_SETTINGS_DRAWER_NEWLINE               "enable-space-drawer-newline"
#define PLUMA_SETTINGS_DRAWER_NBSP                  "enable-space-drawer-nbsp"
#define PLUMA_SETTINGS_DISPLAY_OVERVIEW_MAP         "display-overview-map"
#define PLUMA_SETTINGS_BACKGROUND_PATTERN           "background-pattern"

/* White list of writable mate-vfs methods */
#define PLUMA_SETTINGS_WRITABLE_VFS_SCHEMES         "writable-vfs-schemes"
#define PLUMA_SETTINGS_SMART_HOME_END               "smart-home-end"

/* window state keys */
#define PLUMA_SETTINGS_WINDOW_STATE                 "state"
#define PLUMA_SETTINGS_WINDOW_SIZE                  "size"
#define PLUMA_SETTINGS_SIDE_PANEL_SIZE              "side-panel-size"
#define PLUMA_SETTINGS_SIDE_PANEL_ACTIVE_PAGE       "side-panel-active-page"
#define PLUMA_SETTINGS_BOTTOM_PANEL_SIZE            "bottom-panel-size"
#define PLUMA_SETTINGS_BOTTOM_PANEL_ACTIVE_PAGE     "bottom-panel-active-page"
#define PLUMA_SETTINGS_ACTIVE_FILE_FILTER           "filter-id"

G_END_DECLS

#endif /* __PLUMA_SETTINGS_H__ */
