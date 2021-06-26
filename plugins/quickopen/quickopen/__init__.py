# -*- coding: utf-8 -*-

#  Copyright (C) 2009 - Jesse van den Kieboom
#  Copyright (C) 2012-2021 MATE Developers
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

from gi.repository import GObject, Peas, Pluma
from .windowhelper import WindowHelper

class QuickOpenPlugin(GObject.Object, Pluma.WindowActivatable):
    __gtype_name__ = "QuickOpenPlugin"

    window = GObject.Property(type=Pluma.Window)

    def __init__(self):
        GObject.Object.__init__(self)

        self._popup_size = (450, 300)

    def do_activate(self):
        self._helper = WindowHelper(self.window, self)

    def do_deactivate(self):
        self._helper.deactivate()
        self._helper = None

    def do_update_state(self):
        self._helper.update_ui()

    def get_popup_size(self):
        return self._popup_size

    def set_popup_size(self, size):
        self._popup_size = size

# ex:ts=4:et:
