#    Pluma snippets plugin
#    Copyright (C) 2005-2006  Jesse van den Kieboom <jesse@icecrew.nl>
#    Copyright (C) 2012-2021 MATE Developers
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
import re

from gi.repository import GLib, Gio, Gdk, Gtk, Pluma

from .Library import Library
from .Snippet import Snippet
from .Placeholder import *
from . import Completion

class DynamicSnippet(dict):
    def __init__(self, text):
        self['text'] = text
        self.valid = True

class Document:
    TAB_KEY_VAL = ('Tab', 'ISO_Left_Tab')

    def __init__(self, instance, view):
        self.view = None
        self.instance = instance

        self.placeholders = []
        self.active_snippets = []
        self.active_placeholder = None
        self.signal_ids = {}

        self.ordered_placeholders = []
        self.update_placeholders = []
        self.jump_placeholders = []
        self.language_id = 0
        self.timeout_update_id = 0

        self.provider = Completion.Provider(_('Snippets'), self.language_id, self.on_proposal_activated)

        # Always have a reference to the global snippets
        Library().ref(None)
        self.set_view(view)

    # Stop controlling the view. Remove all active snippets, remove references
    # to the view and the plugin instance, disconnect all signal handlers
    def stop(self):
        if self.timeout_update_id != 0:
            GLib.source_remove(self.timeout_update_id)
            self.timeout_update_id = 0
            del self.update_placeholders[:]
            del self.jump_placeholders[:]

        # Always release the reference to the global snippets
        Library().unref(None)
        self.set_view(None)
        self.instance = None
        self.active_placeholder = None

    def disconnect_signal(self, obj, signal):
        if (obj, signal) in self.signal_ids:
            obj.disconnect(self.signal_ids[(obj, signal)])
            del self.signal_ids[(obj, signal)]

    def connect_signal(self, obj, signal, cb):
        self.disconnect_signal(obj, signal)
        self.signal_ids[(obj, signal)] = obj.connect(signal, cb)

    def connect_signal_after(self, obj, signal, cb):
        self.disconnect_signal(obj, signal)
        self.signal_ids[(obj, signal)] = obj.connect_after(signal, cb)

    # Set the view to be controlled. Installs signal handlers and sets current
    # language. If there is already a view set this function will first remove
    # all currently active snippets and disconnect all current signals. So
    # self.set_view(None) will effectively remove all the control from the
    # current view
    def _set_view(self, view):
        if self.view:
            buf = self.view.get_buffer()

            # Remove signals
            signals = {self.view: ('key-press-event', 'destroy',
                           'notify::editable', 'drag-data-received', 'expose-event'),
                   buf:       ('notify::language', 'changed', 'cursor-moved', 'insert-text'),
                   self.view.get_completion(): ('hide',)}

            for obj, sig in signals.items():
                if obj:
                    for s in sig:
                        self.disconnect_signal(obj, s)

            # Remove all active snippets
            for snippet in list(self.active_snippets):
                self.deactivate_snippet(snippet, True)

            completion = self.view.get_completion()
            if completion and self.provider in completion.get_providers():
                completion.remove_provider(self.provider)

        self.view = view

        if view != None:
            buf = view.get_buffer()

            self.connect_signal(view, 'destroy', self.on_view_destroy)

            if view.get_editable():
                self.connect_signal(view, 'key-press-event', self.on_view_key_press)

            self.connect_signal(buf, 'notify::language', self.on_notify_language)
            self.connect_signal(view, 'notify::editable', self.on_notify_editable)
            self.connect_signal(view, 'drag-data-received', self.on_drag_data_received)
            self.connect_signal_after(view, 'draw', self.on_draw)

            self.update_language()

            completion = view.get_completion()
            completion.add_provider(self.provider)
        elif self.language_id != 0:
            langid = self.language_id

            self.language_id = None;
            self.provider.language_id = self.language_id

            if self.instance:
                self.instance.language_changed(self)

            Library().unref(langid)

    def set_view(self, view):
        if view == self.view:
            return

        self._set_view(view)

    # Call this whenever the language in the view changes. This makes sure that
    # the correct language is used when finding snippets
    def update_language(self):
        lang = self.view.get_buffer().get_language()

        if lang == None and self.language_id == None:
            return
        elif lang and lang.get_id() == self.language_id:
            return

        langid = self.language_id

        if lang:
            self.language_id = lang.get_id()
        else:
            self.language_id = None

        if self.instance:
            self.instance.language_changed(self)

        if langid != 0:
            Library().unref(langid)

        Library().ref(self.language_id)
        self.provider.language_id = self.language_id

    def accelerator_activate(self, keyval, mod):
        if not self.view or not self.view.get_editable():
            return False

        accelerator = Gtk.accelerator_name(keyval, mod)
        snippets = Library().from_accelerator(accelerator, \
                self.language_id)

        if len(snippets) == 0:
            return False
        elif len(snippets) == 1:
            self.apply_snippet(snippets[0])
        else:
            # Do the fancy completion dialog
            provider = Completion.Provider(_('Snippets'), self.language_id, self.on_proposal_activated)
            provider.set_proposals(snippets)

            cm = self.view.get_completion()
            cm.show([provider], cm.create_context(None))

        return True

    def first_snippet_inserted(self):
        buf = self.view.get_buffer()

        self.connect_signal(buf, 'changed', self.on_buffer_changed)
        self.connect_signal(buf, 'cursor-moved', self.on_buffer_cursor_moved)
        self.connect_signal_after(buf, 'insert-text', self.on_buffer_insert_text)

    def last_snippet_removed(self):
        buf = self.view.get_buffer()
        self.disconnect_signal(buf, 'changed')
        self.disconnect_signal(buf, 'cursor-moved')
        self.disconnect_signal(buf, 'insert-text')

    def current_placeholder(self):
        buf = self.view.get_buffer()

        piter = buf.get_iter_at_mark(buf.get_insert())
        found = []

        for placeholder in self.placeholders:
            begin = placeholder.begin_iter()
            end = placeholder.end_iter()

            if piter.compare(begin) >= 0 and piter.compare(end) <= 0:
                found.append(placeholder)

        if self.active_placeholder in found:
            return self.active_placeholder
        elif len(found) > 0:
            return found[0]
        else:
            return None

    def advance_placeholder(self, direction):
        # Returns (CurrentPlaceholder, NextPlaceholder), depending on direction
        buf = self.view.get_buffer()

        piter = buf.get_iter_at_mark(buf.get_insert())
        found = current = next = None
        length = len(self.placeholders)

        placeholders = list(self.placeholders)

        if self.active_placeholder:
            begin = self.active_placeholder.begin_iter()
            end = self.active_placeholder.end_iter()

            if piter.compare(begin) >= 0 and piter.compare(end) <= 0:
                current = self.active_placeholder
                currentIndex = placeholders.index(self.active_placeholder)

        if direction == 1:
            # w = piter, x = begin, y = end, z = found
            nearest = lambda w, x, y, z: (w.compare(x) <= 0 and (not z or \
                    x.compare(z.begin_iter()) < 0))
            indexer = lambda x: x < length - 1
        else:
            # w = piter, x = begin, y = end, z = prev
            nearest = lambda w, x, y, z: (w.compare(x) >= 0 and (not z or \
                    x.compare(z.begin_iter()) >= 0))
            indexer = lambda x: x > 0

        for index in range(0, length):
            placeholder = placeholders[index]
            begin = placeholder.begin_iter()
            end = placeholder.end_iter()

            # Find the nearest placeholder
            if nearest(piter, begin, end, found):
                found = placeholder

            # Find the current placeholder
            if piter.compare(begin) >= 0 and \
                    piter.compare(end) <= 0 and \
                    current == None:
                currentIndex = index
                current = placeholder

        if current and found and current != found and \
           (current.begin_iter().compare(found.begin_iter()) == 0 or \
            current.end_iter().compare(found.begin_iter()) == 0) and \
           self.active_placeholder and \
           current.begin_iter().compare(self.active_placeholder.begin_iter()) == 0:
            # if current and found are at the same place, then
            # resolve the 'hugging' problem
            current = self.active_placeholder
            currentIndex = placeholders.index(current)

        if current:
            if indexer(currentIndex):
                next = placeholders[currentIndex + direction]
        elif found:
            next = found
        elif length > 0:
            next = self.placeholders[0]

        return current, next

    def next_placeholder(self):
        return self.advance_placeholder(1)

    def previous_placeholder(self):
        return self.advance_placeholder(-1)

    def cursor_on_screen(self):
        buf = self.view.get_buffer()
        self.view.scroll_mark_onscreen(buf.get_insert())

    def set_active_placeholder(self, placeholder):
        self.active_placeholder = placeholder

    def goto_placeholder(self, current, next):
        last = None

        if current:
            # Signal this placeholder to end action
            self.view.get_completion().hide()
            current.leave()

            if current.__class__ == PlaceholderEnd:
                last = current

        self.set_active_placeholder(next)

        if next:
            next.enter()

            if next.__class__ == PlaceholderEnd:
                last = next
            elif len(next.defaults) > 1 and next.get_text() == next.default:
                provider = Completion.Defaults(self.on_default_activated)
                provider.set_defaults(next.defaults)

                cm = self.view.get_completion()
                cm.show([provider], cm.create_context(None))

        if last:
            # This is the end of the placeholder, remove the snippet etc
            for snippet in list(self.active_snippets):
                if snippet.placeholders[0] == last:
                    self.deactivate_snippet(snippet)
                    break

        self.cursor_on_screen()

        return next != None

    def skip_to_next_placeholder(self):
        (current, next) = self.next_placeholder()
        return self.goto_placeholder(current, next)

    def skip_to_previous_placeholder(self):
        (current, prev) = self.previous_placeholder()
        return self.goto_placeholder(current, prev)

    def env_get_selected_text(self, buf):
        bounds = buf.get_selection_bounds()

        if bounds:
            return buf.get_text(bounds[0], bounds[1], False)
        else:
            return ''

    def env_get_current_word(self, buf):
        start, end = buffer_word_boundary(buf)
        return buf.get_text(start, end, False)

    def env_get_current_line(self, buf):
        start, end = buffer_line_boundary(buf)
        return buf.get_text(start, end, False)

    def env_get_current_line_number(self, buf):
        start, end = buffer_line_boundary(buf)
        return str(start.get_line() + 1)

    def location_uri_for_env(self, location):
        if location:
            return location.get_uri()
        return ''

    def location_name_for_env(self, location):
        if location:
            return location.get_basename()
        return ''

    def location_scheme_for_env(self, location):
        if location:
            return location.get_uri_scheme()
        return ''

    def location_path_for_env(self, location):
        if location:
            return location.get_path()
        return ''

    def location_dir_for_env(self, location):
        if location:
            parent = location.get_parent()

            if parent and parent.has_uri_scheme('file'):
                return parent.get_path() or ''

        return ''

    def env_add_for_location(self, environ, location, prefix):
        parts = {
            'URI': self.location_uri_for_env,
            'NAME': self.location_name_for_env,
            'SCHEME': self.location_scheme_for_env,
            'PATH': self.location_path_for_env,
            'DIR': self.location_dir_for_env,
        }

        for k in parts:
            v = parts[k](location)
            key = prefix + '_' + k
            environ[key] = str(v)

        return environ

    def env_get_document_type(self, buf):
        typ = buf.get_mime_type()

        if typ:
            return typ
        else:
            return ''

    def env_get_documents_uri(self, buf):
        toplevel = self.view.get_toplevel()

        if isinstance(toplevel, Pluma.Window):
            documents_uri = [doc.get_location().get_uri()
                     for doc in toplevel.get_documents()
                     if doc.get_location() is not None]
        else:
            documents_uri = []

        return ' '.join(documents_uri)

    def env_get_documents_path(self, buf):
        toplevel = self.view.get_toplevel()

        if isinstance(toplevel, Pluma.Window):
            documents_location = [doc.get_location()
                          for doc in toplevel.get_documents()
                          if doc.get_location() is not None]

            documents_path = [location.get_path()
                      for location in documents_location
                      if Pluma.utils_uri_has_file_scheme(location.get_uri())]
        else:
            documents_path = []

        return ' '.join(documents_path)

    def get_environment(self):
        buf = self.view.get_buffer()
        environ = {}

        for k in os.environ:
            # Get the original environment
            v = os.environ[k]
            environ[k] = v

        variables = {
                 'PLUMA_SELECTED_TEXT': self.env_get_selected_text,
                 'PLUMA_CURRENT_WORD': self.env_get_current_word,
                 'PLUMA_CURRENT_LINE': self.env_get_current_line,
                 'PLUMA_CURRENT_LINE_NUMBER': self.env_get_current_line_number,
                 'PLUMA_CURRENT_DOCUMENT_TYPE': self.env_get_document_type,
                 'PLUMA_DOCUMENTS_URI': self.env_get_documents_uri,
                 'PLUMA_DOCUMENTS_PATH': self.env_get_documents_path,
            }

        for var in variables:
            environ[var] = variables[var](buf)

        self.env_add_for_location(environ, buf.get_location(), 'PLUMA_CURRENT_DOCUMENT')
        return environ

    def uses_current_word(self, snippet):
        matches = re.findall('(\\\\*)\\$PLUMA_CURRENT_WORD', snippet['text'])

        for match in matches:
            if len(match) % 2 == 0:
                return True

        return False

    def uses_current_line(self, snippet):
        matches = re.findall('(\\\\*)\\$PLUMA_CURRENT_LINE', snippet['text'])

        for match in matches:
            if len(match) % 2 == 0:
                return True

        return False

    def apply_snippet(self, snippet, start = None, end = None, environ = {}):
        if not snippet.valid:
            return False

        # Set environmental variables
        env = self.get_environment()

        if environ:
            for k in environ:
                env[k] = environ[k]

        buf = self.view.get_buffer()
        s = Snippet(snippet, env)

        if not start:
            start = buf.get_iter_at_mark(buf.get_insert())

        if not end:
            end = buf.get_iter_at_mark(buf.get_selection_bound())

        if start.equal(end) and self.uses_current_word(s):
            # There is no tab trigger and no selection and the snippet uses
            # the current word. Set start and end to the word boundary so that
            # it will be removed
            start, end = buffer_word_boundary(buf)
        elif start.equal(end) and self.uses_current_line(s):
            # There is no tab trigger and no selection and the snippet uses
            # the current line. Set start and end to the line boundary so that
            # it will be removed
            start, end = buffer_line_boundary(buf)

        # You know, we could be in an end placeholder
        (current, next) = self.next_placeholder()
        if current and current.__class__ == PlaceholderEnd:
            self.goto_placeholder(current, None)

        buf.begin_user_action()

        # Remove the tag, selection or current word
        buf.delete(start, end)

        # Insert the snippet
        if len(self.active_snippets) == 0:
            self.first_snippet_inserted()

        sn = s.insert_into(self, start)
        self.active_snippets.append(sn)

        # Put cursor at first tab placeholder
        keys = [x for x in sn.placeholders.keys() if x > 0]

        if len(keys) == 0:
            if 0 in sn.placeholders:
                self.goto_placeholder(self.active_placeholder, sn.placeholders[0])
            else:
                buf.place_cursor(sn.begin_iter())
        else:
            self.goto_placeholder(self.active_placeholder, sn.placeholders[keys[0]])

        if sn in self.active_snippets:
            # Check if we can get end_iter in view without moving the
            # current cursor position out of view
            cur = buf.get_iter_at_mark(buf.get_insert())
            last = sn.end_iter()

            curloc = self.view.get_iter_location(cur)
            lastloc = self.view.get_iter_location(last)

            if (lastloc.y + lastloc.height) - curloc.y <= \
               self.view.get_visible_rect().height:
                self.view.scroll_mark_onscreen(sn.end_mark)

        buf.end_user_action()
        self.view.grab_focus()

        return True

    def get_tab_tag(self, buf, end = None):
        if not end:
            end = buf.get_iter_at_mark(buf.get_insert())

        start = end.copy()
        word = None

        if start.backward_word_start():
            # Check if we were at a word start ourselves
            tmp = start.copy()
            tmp.forward_word_end()

            if tmp.equal(end):
                word = buf.get_text(start, end, False)
            else:
                start = end.copy()
        else:
            start = end.copy()

        if not word or word == '':
            if start.backward_char():
                word = start.get_char()

                if word.isalnum() or word.isspace():
                    return (None, None, None)
            else:
                return (None, None, None)

        return (word, start, end)

    def parse_and_run_snippet(self, data, iter):
        self.apply_snippet(DynamicSnippet(data), iter, iter)

    def run_snippet_trigger(self, trigger, bounds):
        if not self.view:
            return False

        snippets = Library().from_tag(trigger, self.language_id)
        buf = self.view.get_buffer()

        if snippets:
            if len(snippets) == 1:
                return self.apply_snippet(snippets[0], bounds[0], bounds[1])
            else:
                # Do the fancy completion dialog
                provider = Completion.Provider(_('Snippets'), self.language_id, self.on_proposal_activated)
                provider.set_proposals(snippets)

                cm = self.view.get_completion()
                cm.show([provider], cm.create_context(None))

                return True

        return False

    def run_snippet(self):
        if not self.view:
            return False

        buf = self.view.get_buffer()

        # get the word preceding the current insertion position
        (word, start, end) = self.get_tab_tag(buf)

        if not word:
            return self.skip_to_next_placeholder()

        if not self.run_snippet_trigger(word, (start, end)):
            return self.skip_to_next_placeholder()
        else:
            return True

    def deactivate_snippet(self, snippet, force = False):
        remove = []
        ordered_remove = []

        for tabstop in snippet.placeholders:
            if tabstop == -1:
                placeholders = snippet.placeholders[-1]
            else:
                placeholders = [snippet.placeholders[tabstop]]

            for placeholder in placeholders:
                if placeholder in self.placeholders:
                    if placeholder in self.update_placeholders:
                        placeholder.update_contents()

                        self.update_placeholders.remove(placeholder)
                    elif placeholder in self.jump_placeholders:
                        placeholder[0].leave()

                    remove.append(placeholder)
                elif placeholder in self.ordered_placeholders:
                    ordered_remove.append(placeholder)

        for placeholder in remove:
            if placeholder == self.active_placeholder:
                self.active_placeholder = None

            self.placeholders.remove(placeholder)
            self.ordered_placeholders.remove(placeholder)

            placeholder.remove(force)

        for placeholder in ordered_remove:
            self.ordered_placeholders.remove(placeholder)
            placeholder.remove(force)

        snippet.deactivate()
        self.active_snippets.remove(snippet)

        if len(self.active_snippets) == 0:
            self.last_snippet_removed()

        self.view.queue_draw()

    def update_snippet_contents(self):
        self.timeout_update_id = 0

        for placeholder in self.update_placeholders:
            placeholder.update_contents()

        for placeholder in self.jump_placeholders:
            self.goto_placeholder(placeholder[0], placeholder[1])

        del self.update_placeholders[:]
        del self.jump_placeholders[:]

        return False

    # Callbacks
    def on_view_destroy(self, view):
        self.stop()
        return

    def on_buffer_cursor_moved(self, buf):
        piter = buf.get_iter_at_mark(buf.get_insert())

        # Check for all snippets if the cursor is outside its scope
        for snippet in list(self.active_snippets):
            if snippet.begin_mark.get_deleted() or snippet.end_mark.get_deleted():
                self.deactivate(snippet)
            else:
                begin = snippet.begin_iter()
                end = snippet.end_iter()

                if piter.compare(begin) < 0 or piter.compare(end) > 0:
                    # Oh no! Remove the snippet this instant!!
                    self.deactivate_snippet(snippet)

        current = self.current_placeholder()

        if current != self.active_placeholder:
            self.jump_placeholders.append((self.active_placeholder, current))

            if self.timeout_update_id == 0:
                self.timeout_update_id = GLib.timeout_add(0,
                        self.update_snippet_contents)

    def on_buffer_changed(self, buf):
        for snippet in list(self.active_snippets):
            begin = snippet.begin_iter()
            end = snippet.end_iter()

            if begin.compare(end) >= 0:
                # Begin collapsed on end, just remove it
                self.deactivate_snippet(snippet)

        current = self.current_placeholder()

        if current:
            if not current in self.update_placeholders:
                self.update_placeholders.append(current)

            if self.timeout_update_id == 0:
                self.timeout_update_id = GLib.timeout_add(0, \
                        self.update_snippet_contents)

    def on_buffer_insert_text(self, buf, piter, text, length):
        ctx = get_buffer_context(buf)

        # do nothing special if there is no context and no active
        # placeholder
        if (not ctx) and (not self.active_placeholder):
            return

        if not ctx:
            ctx = self.active_placeholder

        if not ctx in self.ordered_placeholders:
            return

        # move any marks that were incorrectly moved by this insertion
        # back to where they belong
        begin = ctx.begin_iter()
        end = ctx.end_iter()
        idx = self.ordered_placeholders.index(ctx)

        for placeholder in self.ordered_placeholders:
            if placeholder == ctx:
                continue

            ob = placeholder.begin_iter()
            oe = placeholder.end_iter()

            if ob.compare(begin) == 0 and ((not oe) or oe.compare(end) == 0):
                oidx = self.ordered_placeholders.index(placeholder)

                if oidx > idx and ob:
                    buf.move_mark(placeholder.begin, end)
                elif oidx < idx and oe:
                    buf.move_mark(placeholder.end, begin)
            elif ob.compare(begin) >= 0 and ob.compare(end) < 0 and (oe and oe.compare(end) >= 0):
                buf.move_mark(placeholder.begin, end)
            elif (oe and oe.compare(begin) > 0) and ob.compare(begin) <= 0:
                buf.move_mark(placeholder.end, begin)

    def on_notify_language(self, buf, spec):
        self.update_language()

    def on_notify_editable(self, view, spec):
        self._set_view(view)

    def on_view_key_press(self, view, event):
        library = Library()

        state = event.get_state()
        keyname = Gdk.keyval_name(event.keyval)

        if not (state & Gdk.ModifierType.CONTROL_MASK) and \
                not (state & Gdk.ModifierType.MOD1_MASK) and \
                keyname in self.TAB_KEY_VAL:
            if not state & Gdk.ModifierType.SHIFT_MASK:
                return self.run_snippet()
            else:
                return self.skip_to_previous_placeholder()
        elif not library.loaded and \
                library.valid_accelerator(event.keyval, state):
            library.ensure_files()
            library.ensure(self.language_id)
            self.accelerator_activate(event.keyval, \
                    state & Gtk.accelerator_get_default_mod_mask())

        return False

    def path_split(self, path, components=[]):
        head, tail = os.path.split(path)

        if not tail and head:
            return [head] + components
        elif tail:
            return self.path_split(head, [tail] + components)
        else:
            return components

    def relative_path(self, first, second, mime):
        prot1 = re.match(r'(^[a-z]+:\/\/|\/)(.*)', first)
        prot2 = re.match(r'(^[a-z]+:\/\/|\/)(.*)', second)

        if not prot1 or not prot2:
            return second

        # Different protocols
        if prot1.group(1) != prot2.group(1):
            return second

        # Split on backslash
        path1 = self.path_split(prot1.group(2))
        path2 = self.path_split(prot2.group(2))

        # Remove as long as common
        while path1 and path2 and path1[0] == path2[0]:
            path1.pop(0)
            path2.pop(0)

        # If we need to ../ more than 3 times, then just return
        # the absolute path
        if len(path1) - 1 > 3:
            return second

        if mime.startswith('x-directory'):
            # directory, special case
            if not path2:
                result = './'
            else:
                result = '../' * (len(path1) - 1)
        else:
            # Insert ../
            result = '../' * (len(path1) - 1)

            if not path2:
                result = os.path.basename(second)

        if path2:
            result += os.path.join(*path2)

        return result

    def apply_uri_snippet(self, snippet, mime, uri):
        # Remove file scheme
        gfile = Gio.file_new_for_uri(uri)
        pathname = ''
        dirname = ''
        ruri = ''
        environ = {'PLUMA_DROP_DOCUMENT_TYPE': mime}

        self.env_add_for_location(environ, gfile, 'PLUMA_DROP_DOCUMENT')

        buf = self.view.get_buffer()
        location = buf.get_location()
        if location:
            ruri = location.get_uri()

        relpath = self.relative_path(ruri, uri, mime)

        environ['PLUMA_DROP_DOCUMENT_RELATIVE_PATH'] = relpath

        mark = buf.get_mark('gtk_drag_target')

        if not mark:
            mark = buf.get_insert()

        piter = buf.get_iter_at_mark(mark)
        self.apply_snippet(snippet, piter, piter, environ)

    def in_bounds(self, x, y):
        rect = self.view.get_visible_rect()
        rect.x, rect.y = self.view.buffer_to_window_coords(Gtk.TextWindowType.WIDGET, rect.x, rect.y)

        return not (x < rect.x or x > rect.x + rect.width or y < rect.y or y > rect.y + rect.height)

    def on_drag_data_received(self, view, context, x, y, data, info, timestamp):
        if not self.view.get_editable():
            return

        uris = drop_get_uris(data)
        if not uris:
            return

        if not self.in_bounds(x, y):
            return

        uris.reverse()
        stop = False

        for uri in uris:
            try:
                mime = Gio.content_type_guess(uri)
            except:
                mime = None

            if not mime:
                continue

            snippets = Library().from_drop_target(mime, self.language_id)

            if snippets:
                stop = True
                self.apply_uri_snippet(snippets[0], mime, uri)

        if stop:
            context.finish(True, False, timestamp)
            view.stop_emission('drag-data-received')
            view.get_toplevel().present()
            view.grab_focus()

    def find_uri_target(self, context):
        lst = Gtk.target_list_add_uri_targets((), 0)

        return self.view.drag_dest_find_target(context, lst)

    def on_proposal_activated(self, proposal, piter):
        if not self.view.get_editable():
            return False

        buf = self.view.get_buffer()
        bounds = buf.get_selection_bounds()

        if bounds:
            self.apply_snippet(proposal.snippet(), None, None)
        else:
            (word, start, end) = self.get_tab_tag(buf, piter)
            self.apply_snippet(proposal.snippet(), start, end)

        return True

    def on_default_activated(self, proposal, piter):
        buf = self.view.get_buffer()
        bounds = buf.get_selection_bounds()

        if bounds:
            buf.begin_user_action()
            buf.delete(bounds[0], bounds[1])
            buf.insert(bounds[0], proposal.props.label)
            buf.end_user_action()

            return True
        else:
            return False

    def iter_coords(self, piter):
        rect = self.view.get_iter_location(piter)
        rect.x, rect.y = self.view.buffer_to_window_coords(Gtk.TextWindowType.TEXT, rect.x, rect.y)

        return rect

    def placeholder_in_area(self, placeholder, area):
        start = placeholder.begin_iter()
        end = placeholder.end_iter()

        if not start or not end:
            return False

        # Test if start is before bottom, and end is after top
        start_rect = self.iter_coords(start)
        end_rect = self.iter_coords(end)

        return start_rect.y <= area.y + area.height and \
               end_rect.y + end_rect.height >= area.y

    def draw_placeholder_rect(self, ctx, placeholder):
        start = placeholder.begin_iter()
        start_rect = self.iter_coords(start)
        start_line = start.get_line()

        end = placeholder.end_iter()
        end_rect = self.iter_coords(end)
        end_line = end.get_line()

        line = start.copy()
        line.set_line_offset(0)
        geom = self.view.get_window(Gtk.TextWindowType.TEXT).get_geometry()

        ctx.translate(0.5, 0.5)

        while line.get_line() <= end_line:
            ypos, height = self.view.get_line_yrange(line)
            x_, ypos = self.view.window_to_buffer_coords(Gtk.TextWindowType.TEXT, 0, ypos)

            if line.get_line() == start_line and line.get_line() == end_line:
                # Simply draw a box, both are on the same line
                ctx.rectangle(start_rect.x, start_rect.y, end_rect.x - start_rect.x, start_rect.height - 1)
                ctx.stroke()
            elif line.get_line() == start_line or line.get_line() == end_line:
                if line.get_line() == start_line:
                    rect = start_rect
                else:
                    rect = end_rect

                ctx.move_to(0, rect.y + rect.height - 1)
                ctx.rel_line_to(rect.x, 0)
                ctx.rel_line_to(0, -rect.height + 1)
                ctx.rel_line_to(geom[2], 0)
                ctx.stroke()

            if not line.forward_line():
                break

    def draw_placeholder_bar(self, ctx, placeholder):
        start = placeholder.begin_iter()
        start_rect = self.iter_coords(start)

        ctx.translate(0.5, 0.5)
        extend_width = 2.5

        ctx.move_to(start_rect.x - extend_width, start_rect.y)
        ctx.rel_line_to(extend_width * 2, 0)

        ctx.move_to(start_rect.x, start_rect.y)
        ctx.rel_line_to(0, start_rect.height - 1)

        ctx.rel_move_to(-extend_width, 0)
        ctx.rel_line_to(extend_width * 2, 0)
        ctx.stroke()

    def draw_placeholder(self, ctx, placeholder):
        if isinstance(placeholder, PlaceholderEnd):
            return

        col = self.view.get_style_context().get_color(Gtk.StateFlags.INSENSITIVE)
        col.alpha = 0.5
        Gdk.cairo_set_source_rgba(ctx, col)

        if placeholder.tabstop > 0:
            ctx.set_dash([], 0)
        else:
            ctx.set_dash([2], 0)

        start = placeholder.begin_iter()
        end = placeholder.end_iter()

        if start.equal(end):
            self.draw_placeholder_bar(ctx, placeholder)
        else:
            self.draw_placeholder_rect(ctx, placeholder)

    def on_draw(self, view, ctx):
        window = view.get_window(Gtk.TextWindowType.TEXT)

        if not Gtk.cairo_should_draw_window(ctx, window):
            return False

        ctx.set_line_width(1.0)
        Gtk.cairo_transform_to_window(ctx, view, window)
        clipped, clip = Gdk.cairo_get_clip_rectangle(ctx)

        if not clipped:
            return False

        for placeholder in self.ordered_placeholders:
            if not self.placeholder_in_area(placeholder, clip):
                continue

            ctx.save()
            self.draw_placeholder(ctx, placeholder)
            ctx.restore()

        return False

# ex:ts=4:et:
