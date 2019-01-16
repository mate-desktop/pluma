#    Pluma snippets plugin
#    Copyright (C) 2005-2006  Jesse van den Kieboom <jesse@icecrew.nl>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

import os
from gi.repository import GObject, GLib, Gtk, Peas, Pluma

from .WindowHelper import WindowHelper
from .Library import Library
from .Manager import Manager
from .comment import toggle_lines

class SnippetsPlugin(GObject.Object, Peas.Activatable):
    __gtype_name__ = "SnippetsPlugin"

    object = GObject.Property(type=GObject.Object)

    def __init__(self):
        GObject.Object.__init__(self)

        self.dlg = None

    def system_dirs(self):
        if 'XDG_DATA_DIRS' in os.environ:
            datadirs = os.environ['XDG_DATA_DIRS']
        else:
            datadirs = '/usr/local/share' + os.pathsep + '/usr/share'

        dirs = []

        for d in datadirs.split(os.pathsep):
            d = os.path.join(d, 'pluma', 'plugins', 'snippets')

            if os.path.isdir(d):
                dirs.append(d)

        dirs.append(self.plugin_info.get_data_dir())
        return dirs

    def do_activate(self):
        library = Library()
        library.add_accelerator_callback(self.accelerator_activated)

        snippetsdir = os.path.join(GLib.get_user_config_dir(), 'pluma/snippets')
        library.set_dirs(snippetsdir, self.system_dirs())

        self._helper = WindowHelper(self)

        window = self.object
        self._helper.run(window)

    def do_deactivate(self):
        library = Library()
        library.remove_accelerator_callback(self.accelerator_activated)

        self._helper.stop()
        self._helper = None

    def do_update_state(self):
        self._helper.update()

    def create_configure_dialog(self):
        window = Pluma.App.get_default().get_active_window()

        if not self.dlg:
            self.dlg = Manager(self.plugin_info.get_data_dir(), window)
        else:
            self.dlg.run(window)

        return self.dlg.dlg

    def accelerator_activated(self, group, obj, keyval, mod):
        ret = False

        if self._helper:
            ret = self._helper.accelerator_activated(keyval, mod)

        return ret

# ex:ts=4:et:
