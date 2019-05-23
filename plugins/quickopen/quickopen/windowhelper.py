# -*- coding: utf-8 -*-

#  Copyright (C) 2009 - Jesse van den Kieboom
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin St, Fifth Floor,
#  Boston, MA 02110-1301, USA.

import os
import codecs
from gi.repository import Gio, GLib, Gtk, Pluma
from .popup import Popup
from .virtualdirs import RecentDocumentsDirectory
from .virtualdirs import CurrentDocumentsDirectory

ui_str = """<ui>
  <menubar name="MenuBar">
    <menu name="FileMenu" action="File">
      <placeholder name="FileOps_2">
    <menuitem name="QuickOpen" action="QuickOpen"/>
      </placeholder>
    </menu>
  </menubar>
</ui>
"""

class WindowHelper:
    def __init__(self, window, plugin):
        self._window = window
        self._plugin = plugin

        self._popup = None
        self._install_menu()

    def deactivate(self):
        self._uninstall_menu()
        self._window = None
        self._plugin = None

    def update_ui(self):
        pass

    def _uninstall_menu(self):
        manager = self._window.get_ui_manager()

        manager.remove_ui(self._ui_id)
        manager.remove_action_group(self._action_group)

        manager.ensure_update()

    def _install_menu(self):
        manager = self._window.get_ui_manager()
        action = Gtk.Action.new("QuickOpen",
                                _("Quick open"),
                                _("Quickly open documents"))
        action.set_icon_name("document-open")
        action.connect("activate", self.on_quick_open_activate)
        self._action_group = Gtk.ActionGroup("PlumaQuickOpenPluginActions")
        self._action_group.add_action_with_accel(action, "<Ctrl><Alt>O")

        manager.insert_action_group(self._action_group, -1)
        self._ui_id = manager.add_ui_from_string(ui_str)

    def _create_popup(self):
        paths = []

        # Open documents
        paths.append(CurrentDocumentsDirectory(self._window))

        doc = self._window.get_active_document()

        # Current document directory
        if doc and doc.is_local():
            gfile = doc.get_location()
            paths.append(gfile.get_parent())

        # File browser root directory
        bus = self._window.get_message_bus()

        try:
            msg = bus.send_sync('/plugins/filebrowser', 'get_root')

            if msg:
                uri = msg.get_value('uri')

                if uri:
                    gfile = Gio.file_new_for_uri(uri)

                    if gfile and gfile.is_native():
                        paths.append(gfile)

        except Exception:
            pass

        # Recent documents
        paths.append(RecentDocumentsDirectory())

        # Local bookmarks
        for path in self._local_bookmarks():
            paths.append(path)

        # Desktop directory
        desktopdir = self._desktop_dir()

        if desktopdir:
            paths.append(Gio.file_new_for_path(desktopdir))

        # Home directory
        paths.append(Gio.file_new_for_path(os.path.expanduser('~')))

        self._popup = Popup(self._window, paths, self.on_activated)

        self._popup.set_default_size(*self._plugin.get_popup_size())
        self._popup.set_transient_for(self._window)
        self._popup.set_position(Gtk.WindowPosition.CENTER_ON_PARENT)

        self._window.get_group().add_window(self._popup)

        self._popup.connect('destroy', self.on_popup_destroy)

    def _local_bookmarks(self):
        filename = os.path.expanduser('~/.config/gtk-3.0/bookmarks')

        if not os.path.isfile(filename):
            return []

        paths = []

        for line in codecs.open(filename, 'r', encoding='utf-8'):
            uri = line.strip().split(" ")[0]
            f = Gio.file_new_for_uri(uri)

            if f.is_native():
                try:
                    info = f.query_info(Gio.FILE_ATTRIBUTE_STANDARD_TYPE, Gio.FileQueryInfoFlags.NONE, None)

                    if info and info.get_file_type() == Gio.FileType.DIRECTORY:
                        paths.append(f)
                except GLib.GError:
                    pass

        return paths

    def _desktop_dir(self):
        config = os.getenv('XDG_CONFIG_HOME')

        if not config:
            config = os.path.expanduser('~/.config')

        config = os.path.join(config, 'user-dirs.dirs')
        desktopdir = None

        if os.path.isfile(config):
            for line in codecs.open(config, 'r', encoding='utf-8'):
                line = line.strip()

                if line.startswith('XDG_DESKTOP_DIR'):
                    parts = line.split('=', 1)
                    desktopdir = os.path.expandvars(parts[1].strip('"').strip("'"))
                    break

        if not desktopdir:
            desktopdir = os.path.expanduser('~/Desktop')

        return desktopdir

    # Callbacks
    def on_quick_open_activate(self, action):
        if not self._popup:
            self._create_popup()

        self._popup.show()

    def on_popup_destroy(self, popup):
        self._plugin.set_popup_size(popup.get_final_size())
        self._popup = None

    def on_activated(self, gfile):
        Pluma.commands_load_uri(self._window, gfile.get_uri(), None, -1)
        return True

# ex:ts=4:et:
