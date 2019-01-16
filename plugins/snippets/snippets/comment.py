#    Pluma comment functions
#    Copyright (C) 2019 Andrew Fowlie
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



def split_leading_space(txt):
    """
    @returns Text split into leading spaces and content
    """
    index = len(txt.lstrip())
    spaces = txt[:-index]
    content = txt[-index:]
    return spaces, content

def toggle_line(line, comment="#", after_leading_space=True, comment_empty=False):
    """
    @param line Line of text to toggle comments
    @param comment String used for inline comments
    @param after_leading_space Whether to comment after any leading white space
    @param comment_empty Whether to comment empty lines

    @returns Text with comments toggled
    """
    if not comment_empty and not line.strip():
        return line

    spaces, content = split_leading_space(line)

    if content.startswith(comment):
        return "{}{}".format(spaces, content[len(comment):])
    elif after_leading_space:
        return "{}{}{}".format(spaces, comment, content)
    else:
        return "{}{}{}".format(comment, spaces, content)

def toggle_lines(lines, **kwargs):
    """
    @param lines Multiple lines of text
    @type lines str
    @returns Text with comments toggled
    """
    lines = [toggle_line(line, **kwargs) for line in lines.split("\n")]
    return "\n".join(lines)
