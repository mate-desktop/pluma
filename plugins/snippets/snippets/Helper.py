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

from xml.sax import saxutils
import xml.etree.ElementTree as et
import re
import codecs

from gi.repository import Gtk

def message_dialog(par, typ, msg):
    d = Gtk.MessageDialog(par, Gtk.DialogFlags.MODAL, typ, Gtk.ButtonsType.OK, msg)
    d.set_property('use-markup', True)

    d.run()
    d.destroy()

def compute_indentation(view, piter):
    line = piter.get_line()
    start = view.get_buffer().get_iter_at_line(line)
    end = start.copy()

    ch = end.get_char()

    while (ch.isspace() and ch != '\r' and ch != '\n' and \
            end.compare(piter) < 0):
        if not end.forward_char():
            break;

        ch = end.get_char()

    if start.equal(end):
        return ''

    return start.get_slice(end)

def markup_escape(text):
    return saxutils.escape(text)

def spaces_instead_of_tabs(view, text):
    if not view.get_insert_spaces_instead_of_tabs():
        return text

    return text.replace("\t", view.get_tab_width() * ' ')

def insert_with_indent(view, piter, text, indentfirst = True, context = None):
    text = spaces_instead_of_tabs(view, text)
    lines = text.split('\n')
    buf = view.get_buffer()

    buf._snippets_context = context

    if len(lines) == 1:
        view.get_buffer().insert(piter, text)
    else:
        # Compute indentation
        indent = compute_indentation(view, piter)
        text = ''

        for i in range(0, len(lines)):
            if indentfirst or i > 0:
                text += indent + lines[i] + '\n'
            else:
                text += lines[i] + '\n'

        buf.insert(piter, text[:-1])

    buf._snippets_context = None

def get_buffer_context(buf):
    if hasattr(buf, "_snippets_context"):
        return buf._snippets_context
    return None

def snippets_debug(*s):
    return

def write_xml(node, f, cdata_nodes=()):
    assert node is not None

    if not hasattr(f, "write"):
        f = codecs.open(f, "wb", encoding="utf-8")

    # Encoding
    f.write("<?xml version='1.0' encoding='utf-8'?>\n")

    _write_node(node, f, cdata_nodes)

def _write_indent(file, text, indent):
    file.write('  ' * indent + text)

def _write_node(node, file, cdata_nodes=(), indent=0):
    # write XML to file
    tag = node.tag

    if node is et.Comment:
        _write_indent(file, "<!-- %s -->\n" % saxutils.escape(node.text), indent)
    elif node is et.ProcessingInstruction:
        _write_indent(file, "<?%s?>\n" % saxutils.escape(node.text), indent)
    else:
        items = node.items()

        if items or node.text or len(node):
            _write_indent(file, "<" + tag, indent)

            if items:
                items.sort() # lexical order
                for k, v in items:
                    file.write(" %s=%s" % (k, saxutils.quoteattr(v)))
            if node.text or len(node):
                file.write(">")
                if node.text and node.text.strip() != "":
                    if tag in cdata_nodes:
                        file.write(_cdata(node.text))
                    else:
                        file.write(saxutils.escape(node.text))
                else:
                    file.write("\n")

                for n in node:
                    _write_node(n, file, cdata_nodes, indent + 1)

                if not len(node):
                    file.write("</" + tag + ">\n")
                else:
                    _write_indent(file, "</" + tag + ">\n", indent)
            else:
                file.write(" />\n")

        if node.tail and node.tail.strip() != "":
            file.write(saxutils.escape(node.tail))

def _cdata(text):
    return '<![CDATA[' + text.replace(']]>', ']]]]><![CDATA[>') + ']]>'

def buffer_word_boundary(buf):
    iter = buf.get_iter_at_mark(buf.get_insert())
    start = iter.copy()

    if not iter.starts_word() and (iter.inside_word() or iter.ends_word()):
        start.backward_word_start()

    if not iter.ends_word() and iter.inside_word():
        iter.forward_word_end()

    return (start, iter)

def buffer_line_boundary(buf):
    iter = buf.get_iter_at_mark(buf.get_insert())
    start = iter.copy()
    start.set_line_offset(0)

    if not iter.ends_line():
        iter.forward_to_line_end()

    return (start, iter)

def drop_get_uris(selection):
    uris = []
    if selection.targets_include_uri():
        data = selection.get_data()
        lines = re.split('\\s*[\\n\\r]+\\s*', data.strip())

        for line in lines:
            if not line.startswith('#'):
                uris.append(line)

    return uris

# ex:ts=4:et:
