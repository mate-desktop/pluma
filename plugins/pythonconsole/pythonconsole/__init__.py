# -*- coding: utf-8 -*-

# __init__.py -- plugin object
#
# Copyright (C) 2006 - Steve Frécinaux
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.

# Parts from "Interactive Python-GTK Console" (stolen from epiphany's console.py)
#     Copyright (C), 1998 James Henstridge <james@daa.com.au>
#     Copyright (C), 2005 Adam Hooper <adamh@densi.com>
# Bits from pluma Python Console Plugin
#     Copyrignt (C), 2005 Raphaël Slinckx

from gi.repository import GObject, Gtk, Peas, Pluma

from console import PythonConsole
from config import PythonConsoleConfigDialog
from config import PythonConsoleConfig

PYTHON_ICON = 'text-x-python'

class PythonConsolePlugin(GObject.Object, Peas.Activatable):
    __gtype_name__ = "PythonConsolePlugin"

    object = GObject.Property(type=GObject.Object)

    def __init__(self):
        GObject.Object.__init__(self)
        self.dlg = None

    def do_activate(self):
        window = self.object

        self._console = PythonConsole(namespace = {'__builtins__' : __builtins__,
                                             'pluma' : Pluma,
                                             'window' : window})
        self._console.eval('print "You can access the main window through ' \
                     '\'window\' :\\n%s" % window', False)
        bottom = window.get_bottom_panel()
        image = Gtk.Image()
        image.set_from_icon_name(PYTHON_ICON, Gtk.IconSize.MENU)
        bottom.add_item(self._console, _('Python Console'), image)

    def do_deactivate(self):
        window = self.object

        self._console.stop()
        bottom = window.get_bottom_panel()
        bottom.remove_item(self._console)

def create_configure_dialog(self):

    if not self.dlg:
        self.dlg = PythonConsoleConfigDialog(self.get_data_dir())

    dialog = self.dlg.dialog()
    window = pluma.app_get_default().get_active_window()
    if window:
        dialog.set_transient_for(window)

    return dialog

# Here we dynamically insert create_configure_dialog based on if configuration
# is enabled. This has to be done like this because pluma checks if a plugin
# is configurable solely on the fact that it has this member defined or not
if PythonConsoleConfig.enabled():
    PythonConsolePlugin.create_configure_dialog = create_configure_dialog

# ex:et:ts=4:
