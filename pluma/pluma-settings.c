/*
 * pluma-settings.c
 * This file is part of pluma
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
 * Copyright (C) 2009 - Ignacio Casal Quinteiro
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

#include <string.h>

#include "pluma-settings.h"
#include "pluma-debug.h"
#include "pluma-view.h"
#include "pluma-window.h"
#include "pluma-style-scheme-manager.h"
#include "pluma-window-private.h"

#define PLUMA_SETTINGS_LOCKDOWN_COMMAND_LINE "disable-command-line"
#define PLUMA_SETTINGS_LOCKDOWN_PRINTING "disable-printing"
#define PLUMA_SETTINGS_LOCKDOWN_PRINT_SETUP "disable-print-setup"
#define PLUMA_SETTINGS_LOCKDOWN_SAVE_TO_DISK "disable-save-to-disk"

#define PLUMA_SETTINGS_SYSTEM_FONT "monospace-font-name"

struct _PlumaSettingsPrivate
{
    GSettings *editor_settings;
    GSettings *lockdown_settings;
    GSettings *interface_settings;

    gchar *old_scheme;
};

/* PlumaSettings is a singleton. */
static PlumaSettings *singleton = NULL;

G_DEFINE_TYPE_WITH_PRIVATE (PlumaSettings, pluma_settings, G_TYPE_OBJECT)

static void
pluma_settings_dispose (GObject *object)
{
    PlumaSettingsPrivate *priv = pluma_settings_get_instance_private (PLUMA_SETTINGS(object));

    g_clear_object (&priv->lockdown_settings);
    g_clear_object (&priv->interface_settings);
    g_clear_object (&priv->editor_settings);

    G_OBJECT_CLASS (pluma_settings_parent_class)->dispose (object);
}

static void
pluma_settings_finalize (GObject *object)
{
    PlumaSettings *self = PLUMA_SETTINGS (object);

    g_free (self->priv->old_scheme);

    if (singleton == self)
    {
        singleton = NULL;
    }

    G_OBJECT_CLASS (pluma_settings_parent_class)->finalize (object);
}

#ifdef GTK_SOURCE_VERSION_3_24
static void
pluma_settings_space_drawer_generic (GSettings              *settings,
                                     gint                    level,
                                     GtkSourceSpaceTypeFlags type)
{
    GList *views;
    GList *l;

    pluma_debug (DEBUG_PREFS);

    views = pluma_app_get_views (pluma_app_get_default ());
    l = views;

    while (l != NULL)
    {
        pluma_set_source_space_drawer_by_level (GTK_SOURCE_VIEW (l->data),
                                                level, type);
        l = l->next;
    }

    g_list_free (views);
}
#else
static void
pluma_settings_draw_generic (GSettings              *settings,
                             gint                    level,
                             GtkSourceSpaceTypeFlags type)
{
    GList *views;
    GList *l;

    pluma_debug (DEBUG_PREFS);

    views = pluma_app_get_views (pluma_app_get_default ());
    l = views;

    while (l != NULL)
    {
        GtkSourceSpaceTypeFlags value;

        value = gtk_source_view_get_draw_spaces (GTK_SOURCE_VIEW (l->data));
        if (level > 0)
            value |= type;
        else
            value &= ~type;
        gtk_source_view_set_draw_spaces (GTK_SOURCE_VIEW (l->data),
                                         value);
        l = l->next;
    }

    g_list_free (views);
}
#endif

static void
on_lockdown_changed (GSettings   *settings,
                     const gchar *key,
                     gpointer     useless)
{
    gboolean locked;
    PlumaApp *app;

    locked = g_settings_get_boolean (settings, key);
    app = pluma_app_get_default ();

    if (strcmp (key, PLUMA_SETTINGS_LOCKDOWN_COMMAND_LINE) == 0)
        _pluma_app_set_lockdown_bit (app,
                                     PLUMA_LOCKDOWN_COMMAND_LINE,
                                     locked);
    else if (strcmp (key, PLUMA_SETTINGS_LOCKDOWN_PRINTING) == 0)
        _pluma_app_set_lockdown_bit (app,
                                     PLUMA_LOCKDOWN_PRINTING,
                                     locked);
    else if (strcmp (key, PLUMA_SETTINGS_LOCKDOWN_PRINT_SETUP) == 0)
        _pluma_app_set_lockdown_bit (app,
                                     PLUMA_LOCKDOWN_PRINT_SETUP,
                                     locked);
    else if (strcmp (key, PLUMA_SETTINGS_LOCKDOWN_SAVE_TO_DISK) == 0)
        _pluma_app_set_lockdown_bit (app,
                                     PLUMA_LOCKDOWN_SAVE_TO_DISK,
                                     locked);
}

static void
set_font (PlumaSettings *self,
          const gchar   *font)
{
    GList *views, *l;
    guint ts;

    ts = g_settings_get_uint (self->priv->editor_settings, PLUMA_SETTINGS_TABS_SIZE);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        /* Note: we use def=FALSE to avoid PlumaView to query gconf */
        pluma_view_set_font (PLUMA_VIEW (l->data), FALSE, font);

        gtk_source_view_set_tab_width (GTK_SOURCE_VIEW (l->data), ts);
    }

    g_list_free (views);
}

static void
on_system_font_changed (GSettings     *settings,
                        const gchar   *key,
                        PlumaSettings *self)
{
    gboolean use_default_font;
    gchar *font;

    use_default_font = g_settings_get_boolean (self->priv->editor_settings,
                                               PLUMA_SETTINGS_USE_DEFAULT_FONT);
    if (!use_default_font)
        return;

    font = g_settings_get_string (settings, key);

    set_font (self, font);

    g_free (font);
}

static void
on_use_default_font_changed (GSettings     *settings,
                             const gchar   *key,
                             PlumaSettings *self)
{
    gboolean def;
    gchar *font;

    def = g_settings_get_boolean (settings, key);

    if (def)
    {
        font = g_settings_get_string (self->priv->interface_settings,
                                      PLUMA_SETTINGS_SYSTEM_FONT);
    }
    else
    {
        font = g_settings_get_string (self->priv->editor_settings,
                                      PLUMA_SETTINGS_EDITOR_FONT);
    }

    set_font (self, font);

    g_free (font);
}

static void
on_editor_font_changed (GSettings     *settings,
                        const gchar   *key,
                        PlumaSettings *self)
{
    gboolean use_default_font;
    gchar *font;

    use_default_font = g_settings_get_boolean (self->priv->editor_settings,
                                               PLUMA_SETTINGS_USE_DEFAULT_FONT);
    if (use_default_font)
        return;

    font = g_settings_get_string (settings, key);

    set_font (self, font);

    g_free (font);
}

static void
on_scheme_changed (GSettings     *settings,
                   const gchar   *key,
                   PlumaSettings *self)
{
    GtkSourceStyleScheme *style;
    gchar *scheme;
    GList *docs;
    GList *l;

    scheme = g_settings_get_string (settings, key);

    if (self->priv->old_scheme != NULL && (strcmp (scheme, self->priv->old_scheme) == 0))
    {
        g_free (scheme);
        return;
    }

    g_free (self->priv->old_scheme);
    self->priv->old_scheme = scheme;

    style = gtk_source_style_scheme_manager_get_scheme (pluma_get_style_scheme_manager (),
                                                        scheme);

    if (style == NULL)
    {
        g_warning ("Default style scheme '%s' not found, falling back to 'classic'", scheme);

        style = gtk_source_style_scheme_manager_get_scheme (pluma_get_style_scheme_manager (),
                                                            "classic");

        if (style == NULL)
        {
            g_warning ("Style scheme 'classic' cannot be found, check your GtkSourceView installation.");
            return;
        }
    }

    docs = pluma_app_get_documents (pluma_app_get_default ());
    for (l = docs; l != NULL; l = g_list_next (l))
    {
        g_return_if_fail (GTK_SOURCE_IS_BUFFER (l->data));

        gtk_source_buffer_set_style_scheme (GTK_SOURCE_BUFFER (l->data), style);
    }

    g_list_free (docs);
}

static void
on_auto_save_changed (GSettings     *settings,
                      const gchar   *key,
                      PlumaSettings *self)
{
    GList *docs, *l;
    gboolean auto_save;

    auto_save = g_settings_get_boolean (settings, key);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        PlumaTab *tab = pluma_tab_get_from_document (PLUMA_DOCUMENT (l->data));

        pluma_tab_set_auto_save_enabled (tab, auto_save);
    }

    g_list_free (docs);
}

static void
on_auto_save_interval_changed (GSettings     *settings,
                               const gchar   *key,
                               PlumaSettings *self)
{
    GList *docs, *l;
    guint auto_save_interval;

    auto_save_interval = g_settings_get_uint (settings, key);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        PlumaTab *tab = pluma_tab_get_from_document (PLUMA_DOCUMENT (l->data));

        pluma_tab_set_auto_save_interval (tab, auto_save_interval);
    }

    g_list_free (docs);
}

static void
on_undo_actions_limit_changed (GSettings     *settings,
                               const gchar   *key,
                               PlumaSettings *self)
{
    GList *docs, *l;
    gint ul;

    ul = g_settings_get_int (settings, key);

    ul = CLAMP (ul, -1, 250);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        gtk_source_buffer_set_max_undo_levels (GTK_SOURCE_BUFFER (l->data), ul);
    }

    g_list_free (docs);
}

static void
on_wrap_mode_changed (GSettings     *settings,
                      const gchar   *key,
                      PlumaSettings *self)
{
    GtkWrapMode wrap_mode;
    GList *views, *l;

    wrap_mode = pluma_settings_get_wrap_mode (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_text_view_set_wrap_mode (GTK_TEXT_VIEW (l->data), wrap_mode);
    }

    g_list_free (views);
}

static void
on_tabs_size_changed (GSettings     *settings,
                      const gchar   *key,
                      PlumaSettings *self)
{
    GList *views, *l;
    guint ts;

    ts = g_settings_get_uint (settings, key);

    ts = CLAMP (ts, 1, 24);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_tab_width (GTK_SOURCE_VIEW (l->data), ts);
    }

    g_list_free (views);
}

static void
on_insert_spaces_changed (GSettings     *settings,
                          const gchar   *key,
                          PlumaSettings *self)
{
    GList *views, *l;
    gboolean spaces;

    spaces = g_settings_get_boolean (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_insert_spaces_instead_of_tabs (GTK_SOURCE_VIEW (l->data),
                                                           spaces);
    }

    g_list_free (views);
}

static void
on_auto_indent_changed (GSettings     *settings,
                        const gchar   *key,
                        PlumaSettings *self)
{
    GList *views, *l;
    gboolean enable;

    enable = g_settings_get_boolean (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_auto_indent (GTK_SOURCE_VIEW (l->data), enable);
    }

    g_list_free (views);
}

static void
on_display_line_numbers_changed (GSettings     *settings,
                                 const gchar   *key,
                                 PlumaSettings *self)
{
    GList *views, *l;
    gboolean line_numbers;

    line_numbers = g_settings_get_boolean (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_show_line_numbers (GTK_SOURCE_VIEW (l->data), line_numbers);
    }

    g_list_free (views);
}

static void
on_hl_current_line_changed (GSettings     *settings,
                            const gchar   *key,
                            PlumaSettings *self)
{
    GList *views, *l;
    gboolean hl;

    hl = g_settings_get_boolean (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_highlight_current_line (GTK_SOURCE_VIEW (l->data), hl);
    }

    g_list_free (views);
}

static void
on_bracket_matching_changed (GSettings     *settings,
                             const gchar   *key,
                             PlumaSettings *self)
{
    GList *docs, *l;
    gboolean enable;

    enable = g_settings_get_boolean (settings, key);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        gtk_source_buffer_set_highlight_matching_brackets (GTK_SOURCE_BUFFER (l->data),
                                                           enable);
    }

    g_list_free (docs);
}

static void
on_display_right_margin_changed (GSettings     *settings,
                                 const gchar   *key,
                                 PlumaSettings *self)
{
    GList *views, *l;
    gboolean display;

    display = g_settings_get_boolean (settings, key);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_show_right_margin (GTK_SOURCE_VIEW (l->data), display);
    }

    g_list_free (views);
}

static void
on_right_margin_position_changed (GSettings     *settings,
                                  const gchar   *key,
                                  PlumaSettings *self)
{
    GList *views, *l;
    guint pos;

    pos = g_settings_get_uint (settings, key);

    pos = CLAMP (pos, 1, 160);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_right_margin_position (GTK_SOURCE_VIEW (l->data), pos);
    }

    g_list_free (views);
}

static void
on_smart_home_end_changed (GSettings     *settings,
                           const gchar   *key,
                           PlumaSettings *self)
{
    GtkSourceSmartHomeEndType smart_he;
    GList *views, *l;

    smart_he = pluma_settings_get_smart_home_end (self);

    views = pluma_app_get_views (pluma_app_get_default ());

    for (l = views; l != NULL; l = g_list_next (l))
    {
        gtk_source_view_set_smart_home_end (GTK_SOURCE_VIEW (l->data), smart_he);
    }

    g_list_free (views);
}

static void
on_syntax_highlighting_changed (GSettings     *settings,
                                const gchar   *key,
                                PlumaSettings *self)
{
    const GList *windows;
    GList *docs, *l;
    gboolean enable;

    enable = g_settings_get_boolean (settings, key);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        gtk_source_buffer_set_highlight_syntax (GTK_SOURCE_BUFFER (l->data), enable);
    }

    g_list_free (docs);

    /* update the sensitivity of the Higlight Mode menu item */
    windows = pluma_app_get_windows (pluma_app_get_default ());
    while (windows != NULL)
    {
        GtkUIManager *ui;
        GtkAction *a;

        ui = pluma_window_get_ui_manager (PLUMA_WINDOW (windows->data));

        a = gtk_ui_manager_get_action (ui, "/MenuBar/ViewMenu/ViewHighlightModeMenu");

        gtk_action_set_sensitive (a, enable);

        windows = g_list_next (windows);
    }
}

static void
on_search_highlighting_changed (GSettings     *settings,
                                const gchar   *key,
                                PlumaSettings *self)
{
    GList *docs, *l;
    gboolean enable;

    enable = g_settings_get_boolean (settings, key);

    docs = pluma_app_get_documents (pluma_app_get_default ());

    for (l = docs; l != NULL; l = g_list_next (l))
    {
        pluma_document_set_enable_search_highlighting (PLUMA_DOCUMENT (l->data),
                                                       enable);
    }

    g_list_free (docs);
}

static void
on_max_recents_changed (GSettings     *settings,
                        const gchar   *key,
                        PlumaSettings *self)
{
    const GList *windows;
    guint max;

    max = g_settings_get_uint (settings, key);

    windows = pluma_app_get_windows (pluma_app_get_default ());
    while (windows != NULL)
    {
        PlumaWindow *w = PLUMA_WINDOW (windows->data);

        gtk_recent_chooser_set_limit (GTK_RECENT_CHOOSER (w->priv->toolbar_recent_menu),
                                      max);

        windows = g_list_next (windows);
    }

    /* FIXME: we have no way at the moment to trigger the
     * update of the inline recents in the File menu */
}

static void
on_draw_spaces_changed (GSettings *settings,
                        gchar     *key,
                        gpointer   user_data)
{
    pluma_debug (DEBUG_PREFS);

    if (strcmp (key, PLUMA_SETTINGS_DRAWER_SPACE))
        return;

#ifdef GTK_SOURCE_VERSION_3_24
    pluma_settings_space_drawer_generic (settings,
                                         g_settings_get_enum (settings, key),
                                         GTK_SOURCE_SPACE_TYPE_SPACE);
#else
    pluma_settings_draw_generic (settings,
                                 g_settings_get_enum (settings, key),
                                 GTK_SOURCE_DRAW_SPACES_SPACE);
#endif
}

static void
on_draw_tabs_changed (GSettings *settings,
                      gchar     *key,
                      gpointer   user_data)
{
    pluma_debug (DEBUG_PREFS);

    if (strcmp (key, PLUMA_SETTINGS_DRAWER_TAB))
        return;

#ifdef GTK_SOURCE_VERSION_3_24
    pluma_settings_space_drawer_generic (settings,
                                         g_settings_get_enum (settings, key),
                                         GTK_SOURCE_SPACE_TYPE_TAB);
#else
    pluma_settings_draw_generic (settings,
                                 g_settings_get_enum (settings, key),
                                 GTK_SOURCE_DRAW_SPACES_TAB);
#endif
}

static void
on_draw_newlines_changed (GSettings *settings,
                          gchar     *key,
                          gpointer   user_data)
{
    pluma_debug (DEBUG_PREFS);

    if (strcmp (key, PLUMA_SETTINGS_DRAWER_NEWLINE))
        return;

#ifdef GTK_SOURCE_VERSION_3_24
    pluma_settings_space_drawer_generic (settings,
                                         g_settings_get_boolean (settings, key) ? 1 : 0,
                                         GTK_SOURCE_SPACE_TYPE_NEWLINE);
#else
    pluma_settings_draw_generic (settings,
                                 g_settings_get_boolean (settings, key) ? 1 : 0,
                                 GTK_SOURCE_DRAW_SPACES_NEWLINE);
#endif
}

static void
on_draw_nbsp_changed (GSettings *settings,
                      gchar     *key,
                      gpointer   user_data)
{
    pluma_debug (DEBUG_PREFS);

    if (strcmp (key, PLUMA_SETTINGS_DRAWER_NBSP))
        return;

#ifdef GTK_SOURCE_VERSION_3_24
    pluma_settings_space_drawer_generic (settings,
                                         g_settings_get_enum (settings, key),
                                         GTK_SOURCE_SPACE_TYPE_NBSP);
#else
    pluma_settings_draw_generic (settings,
                                 g_settings_get_enum (settings, key),
                                 GTK_SOURCE_DRAW_SPACES_NBSP);
#endif
}

static void
pluma_settings_class_init (PlumaSettingsClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS (klass);

    object_class->finalize = pluma_settings_finalize;
    object_class->dispose = pluma_settings_dispose;
}

static void
pluma_settings_init (PlumaSettings *self)
{
    self->priv = pluma_settings_get_instance_private (self);

    self->priv->old_scheme = NULL;

    self->priv->editor_settings = g_settings_new (PLUMA_SCHEMA_ID);

    /* Load settings */
    self->priv->lockdown_settings = g_settings_new ("org.mate.lockdown");

    g_signal_connect (self->priv->lockdown_settings,
                      "changed",
                      G_CALLBACK (on_lockdown_changed),
                      NULL);

    self->priv->interface_settings = g_settings_new ("org.mate.interface");

    g_signal_connect (self->priv->interface_settings,
                      "changed::monospace-font-name",
                      G_CALLBACK (on_system_font_changed),
                      self);

    /* editor changes */
    g_signal_connect (self->priv->editor_settings,
                      "changed::use-default-font",
                      G_CALLBACK (on_use_default_font_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::editor-font",
                      G_CALLBACK (on_editor_font_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::color-scheme",
                      G_CALLBACK (on_scheme_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::auto-save",
                      G_CALLBACK (on_auto_save_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::auto-save-interval",
                      G_CALLBACK (on_auto_save_interval_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::undo-actions-limit",
                      G_CALLBACK (on_undo_actions_limit_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::wrap-mode",
                      G_CALLBACK (on_wrap_mode_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::tabs-size",
                      G_CALLBACK (on_tabs_size_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::insert-spaces",
                      G_CALLBACK (on_insert_spaces_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::auto-indent",
                      G_CALLBACK (on_auto_indent_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::display-line-numbers",
                      G_CALLBACK (on_display_line_numbers_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::highlight-current-line",
                      G_CALLBACK (on_hl_current_line_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::bracket-matching",
                      G_CALLBACK (on_bracket_matching_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::display-right-margin",
                      G_CALLBACK (on_display_right_margin_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::right-margin-position",
                      G_CALLBACK (on_right_margin_position_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::smart-home-end",
                      G_CALLBACK (on_smart_home_end_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::syntax-highlighting",
                      G_CALLBACK (on_syntax_highlighting_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::search-highlighting",
                      G_CALLBACK (on_search_highlighting_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::max-recents",
                      G_CALLBACK (on_max_recents_changed),
                      self);
    g_signal_connect (self->priv->editor_settings,
                      "changed::enable-space-drawer-space",
                      G_CALLBACK (on_draw_spaces_changed),
                      NULL);
    g_signal_connect (self->priv->editor_settings,
                      "changed::enable-space-drawer-tab",
                      G_CALLBACK (on_draw_tabs_changed),
                      NULL);
    g_signal_connect (self->priv->editor_settings,
                      "changed::enable-space-drawer-newline",
                      G_CALLBACK (on_draw_newlines_changed),
                      NULL);
    g_signal_connect (self->priv->editor_settings,
                      "changed::enable-space-drawer-nbsp",
                      G_CALLBACK (on_draw_nbsp_changed),
                      NULL);
}

PlumaSettings *
_pluma_settings_get_singleton (void)
{
    if (singleton == NULL)
    {
        singleton = g_object_new (PLUMA_TYPE_SETTINGS, NULL);
    }

    return singleton;
}

void
pluma_settings_unref_singleton (void)
{
    if (singleton != NULL)
    {
        g_object_unref (singleton);
    }

    /* singleton is not set to NULL here, it is set to NULL in
     * pluma_settings_finalize() (i.e. when we are sure that the ref count
     * reaches 0).
     */
}

PlumaLockdownMask
pluma_settings_get_lockdown (PlumaSettings *self)
{
    guint lockdown = 0;
    gboolean command_line, printing, print_setup, save_to_disk;

    command_line = g_settings_get_boolean (self->priv->lockdown_settings,
                                           PLUMA_SETTINGS_LOCKDOWN_COMMAND_LINE);
    printing = g_settings_get_boolean (self->priv->lockdown_settings,
                                       PLUMA_SETTINGS_LOCKDOWN_PRINTING);
    print_setup = g_settings_get_boolean (self->priv->lockdown_settings,
                                          PLUMA_SETTINGS_LOCKDOWN_PRINT_SETUP);
    save_to_disk = g_settings_get_boolean (self->priv->lockdown_settings,
                                           PLUMA_SETTINGS_LOCKDOWN_SAVE_TO_DISK);

    if (command_line)
        lockdown |= PLUMA_LOCKDOWN_COMMAND_LINE;

    if (printing)
        lockdown |= PLUMA_LOCKDOWN_PRINTING;

    if (print_setup)
        lockdown |= PLUMA_LOCKDOWN_PRINT_SETUP;

    if (save_to_disk)
        lockdown |= PLUMA_LOCKDOWN_SAVE_TO_DISK;

    return lockdown;
}

gchar *
pluma_settings_get_system_font (PlumaSettings *self)
{
    gchar *system_font;

    g_return_val_if_fail (PLUMA_IS_SETTINGS (self), NULL);

    system_font = g_settings_get_string (self->priv->interface_settings,
                                         "monospace-font-name");

    return system_font;
}

PlumaToolbarSetting
pluma_settings_get_toolbar_style (PlumaSettings *self)
{
    PlumaToolbarSetting res;
    gchar *str;

    g_return_val_if_fail (PLUMA_IS_SETTINGS (self), 0);

    str = g_settings_get_string (self->priv->editor_settings,
                                 "toolbar-buttons-style");

    g_return_val_if_fail (str != NULL, 0);

    if (strcmp (str, "PLUMA_TOOLBAR_ICONS") == 0)
        res = PLUMA_TOOLBAR_ICONS;
    else
    {
        if (strcmp (str, "PLUMA_TOOLBAR_ICONS_AND_TEXT") == 0)
            res = PLUMA_TOOLBAR_ICONS_AND_TEXT;
        else
        {
            if (strcmp (str, "PLUMA_TOOLBAR_ICONS_BOTH_HORIZ") == 0)
                res = PLUMA_TOOLBAR_ICONS_BOTH_HORIZ;
            else
                res = PLUMA_TOOLBAR_SYSTEM;
        }
    }

    g_free (str);

    return res;
}

GtkSourceSmartHomeEndType
pluma_settings_get_smart_home_end (PlumaSettings *self)
{
    GtkSourceSmartHomeEndType res;
    gchar *str;

    g_return_val_if_fail (PLUMA_IS_SETTINGS (self), GTK_SOURCE_SMART_HOME_END_AFTER);

    str = g_settings_get_string (self->priv->editor_settings, "smart-home-end");

    g_return_val_if_fail (str != NULL, GTK_SOURCE_SMART_HOME_END_AFTER);

    if (strcmp (str, "DISABLED") == 0)
        res = GTK_SOURCE_SMART_HOME_END_DISABLED;
    else if (strcmp (str, "BEFORE") == 0)
        res = GTK_SOURCE_SMART_HOME_END_BEFORE;
    else if (strcmp (str, "ALWAYS") == 0)
        res = GTK_SOURCE_SMART_HOME_END_ALWAYS;
    else
        res = GTK_SOURCE_SMART_HOME_END_AFTER;

    g_free (str);

    return res;
}

static gchar *
get_wrap_str (guint mode)
{
    gchar *str;

    switch (mode)
    {
        case GTK_WRAP_NONE:
            str = g_strdup ("GTK_WRAP_NONE");
            break;

        case GTK_WRAP_CHAR:
            str = g_strdup ("GTK_WRAP_CHAR");
            break;

        default: /* GTK_WRAP_WORD */
            str = g_strdup ("GTK_WRAP_WORD");
    }

    return str;
}

GtkWrapMode
pluma_settings_get_wrap_mode (GSettings   *settings,
                              const gchar *key)
{
    GtkWrapMode res;
    gchar *str;

    g_return_val_if_fail (G_IS_SETTINGS (settings), GTK_WRAP_WORD);
    g_return_val_if_fail (key != NULL, GTK_WRAP_WORD);

    str = g_settings_get_string (settings, key);

    g_return_val_if_fail (str != NULL, GTK_WRAP_WORD);

    if (strcmp (str, "GTK_WRAP_NONE") == 0)
        res = GTK_WRAP_NONE;
    else
    {
        if (strcmp (str, "GTK_WRAP_CHAR") == 0)
            res = GTK_WRAP_CHAR;
        else
            res = GTK_WRAP_WORD;
    }

    g_free (str);

    return res;
}

void
pluma_settings_set_wrap_mode (GSettings   *settings,
                              const gchar *key,
                              GtkWrapMode  mode)
{
    gchar *str;

    g_return_if_fail (G_IS_SETTINGS (settings));
    g_return_if_fail (key != NULL);

    str = get_wrap_str (mode);

    g_settings_set_string (settings, key, str);
}

/* GSettings/GSList utility functions from mate-panel */

GSList*
pluma_settings_get_list (GSettings *settings, const gchar *key)
{
    gchar **array;
    GSList *list = NULL;
    gint i;
    array = g_settings_get_strv (settings, key);
    if (array != NULL) {
        for (i = 0; array[i]; i++) {
            list = g_slist_append (list, g_strdup (array[i]));
        }
    }
    g_strfreev (array);
    return list;
}

void
pluma_settings_set_list (GSettings *settings, const gchar *key, GSList *list)
{
    GArray *array;
    GSList *l;
    array = g_array_new (TRUE, TRUE, sizeof (gchar *));
    for (l = list; l; l = l->next) {
        array = g_array_append_val (array, l->data);
    }
    g_settings_set_strv (settings, key, (const gchar **) array->data);
    g_array_free (array, TRUE);
}

GSList *
pluma_settings_get_writable_vfs_schemes (GSettings *settings)
{
    GSList *strings;

    pluma_debug (DEBUG_PREFS);

    strings = pluma_settings_get_list (settings, PLUMA_SETTINGS_WRITABLE_VFS_SCHEMES);

    /* The 'file' scheme is writable by default. */
    strings = g_slist_prepend (strings, g_strdup ("file"));

    pluma_debug_message (DEBUG_PREFS, "Done");

    return strings;
}

