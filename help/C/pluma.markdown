% pluma 
Introduction
============

The pluma application enables you to create and edit text files.

The aim of pluma is to be a simple and easy to use text editor. More
powerful features can be enabled with different plugins, allowing a
variety of tasks related to text-editing.

Getting Started
===============

Starting pluma
------------

You can start pluma in the following ways:

Applications menu
:   Choose Accessories: Text Editor.

Command line
:   Execute the following command: `pluma`

By default, when you open a text document in the file manager, pluma
will start, and display the document.

The pluma Window
--------------

When you start pluma, the following window is displayed:

![ Shows pluma main window. ](figures/pluma_window.png)

The pluma window contains the following elements:

Menubar
:   The menus on the menubar contain all of the commands you need to
    work with files in pluma.

Toolbar
:   The toolbar contains a subset of the commands that you can access
    from the menubar.

Display area
:   The display area contains the text of the file that you are editing.

Statusbar
:   The statusbar displays information about current pluma activity and
    contextual information about the menu items. The statusbar also
    displays the following information:

    -   Cursor position: the line number and column number where the
        cursor is located.

    -   Edit mode: If the editor is in insert mode, the statusbar
        contains the text INS. If the editor is in overwrite mode, the
        statusbar contains the text OVR. Press the Insert key to change
        edit mode.

Side Pane
:   The side pane displays a list of open documents, and other
    information depending on which plugins are enabled.

    By default the side pane is not shown. To show it, choose ViewSide
    Pane.

Bottom Pane
:   The bottom pane is used by programming tools such as the Python
    Console plugin to display output.

    By default the bottom pane is not shown. To show it, choose
    ViewBottom Pane.

When you right-click in the pluma window, the application displays a popup
menu. The popup menu contains the most common text editing commands.

Like other MATE applications, actions in pluma can be performed in several
ways: with the menu, with the toolbar, or with shortcut keys. Shortcuts
keys common to all applications are listed in the [User
Guide](ghelp:user-guide?shortcuts-apps).

Running pluma from a Command Line
-------------------------------

You can run pluma from a command line and open a single file or multiple
files. To open multiple files from a command line, type the following
command, then press Return:

`pluma `

Alternatively, you can specify a URI instead of a filename.

For more information on how to run pluma from a command line, see the unix
manual page for pluma, [pluma1](man:pluma).

Working with Files
==================

Creating a New Document
-----------------------

To create a new document, choose FileNew. The application displays a new
blank document in the pluma window.

Opening a File
--------------

To open a file, choose FileOpen to display the Open File dialog. Select
the file that you want to open, then click Open. The file is displayed
in the pluma window.

The application records the paths and filenames of the five most recent
files that you edited and displays the files as menu items on the File
menu. You can also click on the ![Shows Recent Files menu
icon.](figures/pluma_recent_files_menu_icon.png) icon on the toolbar to
display the list of recent files.

> **Note**
>
> You can open multiple files in pluma. The application adds a tab for
> each open file to the window. For more on this see ?.

Saving a File
-------------

You can save files in the following ways:

-   To save changes to an existing file, choose FileSave.

-   To save a new file or to save an existing file under a new filename,
    choose File Save As. Enter a name for the file in the Save As
    dialog, then click Save.

-   To save all of the files that are currently open in pluma, choose
    Documents Save All.

To close all of the files that are currently open in pluma, choose
Documents Close All.

Opening a File from a URI
-------------------------

To open a file from a Uniform Resource Identifier (URI), perform the
following steps:

1.  Choose File Open Location to display the Open Location dialog.

2.  Enter the URI of the file that you want to open.

3.  Use the Character coding drop-down list to select the appropriate
    character coding.

4.  Click Open.

Valid types of URI include `http:`, `ftp:`, `file:`, and all of the
methods supported by `mate-vfs`.

Files from some types of URI are opened as read-only, and any changes
you make must be saved to a different location. HTTP only allows files
to be read. Files opened from FTP are read-only because because not all
FTP servers may correctly work with saving remote files.

> **Warning**
>
> Saving to FTP servers can be enabled with [Configuration
> Editor](ghelp:mateconf-editor), setting the key
> /apps/pluma/preferences/editor/save/writable\_vfs\_schemes, but this
> may cause errors.

Working With Tabs
-----------------

When more than one file is open, pluma shows a tab for each document above
the display area. To switch to another document, click on its tab.

To move a document to another pluma window, drag the tab corresponding to
the file to the window you want to move it to.

To move a document to a new pluma window, either drag its tab to the
desktop, or choose Documents Move to New Window.

Working with Text
=================

Editing Text
------------

You can edit the text of a file in the following ways:

-   Type new text from the keyboard. The blinking insertion cursor marks
    the point where new text appears. To change this, use the arrow keys
    on the keyboard or click with the mouse.

-   To copy the selected text to the clipboard, choose Edit Copy.

-   To delete the selected text from the file and move the selected text
    to the clipboard, choose Edit Cut.

-   To permanently delete the selected text from the file, choose Edit
    Delete.

-   To insert the contents of the clipboard at the cursor position,
    choose Edit Paste. You must cut or copy text before you can paste
    text into the file, either from pluma or another application.

-   To select all of the text in a file, choose Edit Select All.

Undoing and Redoing Changes
---------------------------

To undo a change you have made, choose Edit Undo. To reverse this
action, choose Edit Redo.

Finding and Replacing
=====================

In pluma, there are two ways of searching for text. You can use the Find
dialog to search for a specific piece of text, or Incremental Search to
highlight matching text as you type it.

Finding Text
------------

To search a file for a string of text, perform the following steps:

1.  Choose Search Find to display the Find dialog.

2.  Type the string that you want to find in the Search for field. You
    can include special characters such as a new line or tab: see ?.

3.  Click Find to search the file for the first occurrence of the string
    after your current cursor position. If pluma finds the string, the
    application selects first occurrence of the string. Other
    occurrences of the string are highlighted.

4.  To find the next occurrence of the string, click Find or choose
    Search Find Next. To find the previous occurrence of the text,
    choose Search Find Previous.

After you have closed the Find dialog, you can still move the selection
to other occurrences of the text by choosing Search Find Next and Search
Find Previous.

To remove the highlighting from the text, choose Search Clear Highlight.

Incremental Search
------------------

Incremental search highlights matching text in the document as you type
it letter by letter. (This is similar to the search feature in several
web browsers.)

To start an incremental search, choose Search Incremental Search. The
search box appears at the top of the display area.

Begin typing, and text that matches will be highlighted in the document.
The first instance after the cursor position is also selected.

To advance the selection to the next match while keeping the incremental
search box open, press CtrlG. Press CtrlShiftG to go back to the
previous match.

> **Tip**
>
> You can also use the up and down arrow keys or the mouse wheel to move
> the selection between matches.

Replacing Text
--------------

To search a file for a string, and replace the string with an
alternative string, perform the following steps:

1.  Choose Search Replace to display the Replace dialog.

2.  Type the string that you want to find, in the Search for field. You
    can include special characters such as a new line or tab: see ?.

3.  Type the string that you want to use to replace the string that you
    find, in the Replace with field.

To examine each occurrence of the string before replacing it, click
Find. If pluma finds the string, the application selects the string. Click
Replace to replace the selected occurrence of the string. To find the
next occurrence of the string, click Find again.

To replace all occurrences of the string throughout the document, click
Replace All.

Find and Replace Options
------------------------

The Find dialog and the Replace dialog both have the following options:

-   Select the Match case option to only find occurrences of the string
    that match the case of the text that you type. For example, with
    Match case selected, "TEXT" will not match "text".

-   Select the Match entire word only option to only find occurrences of
    the string that match the entire words of the text that you type.
    For example, with Match entire word only selected, "text" will not
    match "texture".

-   Select the Search backwards option to search backwards towards the
    beginning of the document.

-   Select the Wrap around option to search to one end of the document
    and then continue the search from the other end of the file.

Special Characters
------------------

You can include the following escape sequences in the text to find or
replace to represent special characters:

`\n`
:   Specifies a new line.

`\t`
:   Specifies a tab character.

`\r`
:   Specifies a carriage return.

`\\`
:   The backslash character itself must be escaped if it is being
    searched for. For example, if you are looking for the "`\n`"
    literal, you will have to type "\\\\n" in the Search for field. Or
    if you are looking for a sequence of backslashes, you will have to
    double the number of searched backslashes.

Positioning the Cursor on a Specific Line
-----------------------------------------

To position the cursor on a specific line in the current file, choose
Search Go to Line. The line number box appears at the top of the display
area.

Begin typing the number of the line that you want to move the cursor to
and the document will scroll to the specified line.

To dismiss the box and move the cursor to the specified line, press
Return.

Printing
========

Setting the Page Options
------------------------

To set the page options, choose File Page Setup to display the Page
Setup dialog.

The Page Setup dialog enables you to specify the following print
options:

### General Tabbed Section

Print syntax highlighting
:   Select this option to print syntax highlighting. For more
    information about syntax highlighting, see ?.

Print page headers
:   Select this option to include a header on each page that you print.
    You cannot configure the header.

Line Numbers
:   Select the Print line numbers option to include line numbers when
    you print a file.

    Use the Number every ... lines spin box to specify how often to
    print the line numbers, for example every 5 lines, every 10 lines,
    and so on.

Text Wrapping
:   Select the Enable text wrapping option to wrap text onto the next
    line, at a character level, when you print a file. The application
    counts wrapped lines as one line for line numbering purposes.

    Select the Do not split words over two lines option to wrap text
    onto the next line, at a word level, when you print a file.

### Fonts

Body
:   Click on this button to select the font to use to print the body
    text of a file.

Line numbers
:   Click on this button to select the font to use to print line
    numbers.

Headers and footers
:   Click on this button to select the font to use to print the headers
    and footers in a file.

To reset the fonts to the default fonts for printing a file from pluma,
click Restore Default Fonts.

Printing a Document
-------------------

You can use pluma to perform the following print operations:

-   Print a document to a printer.

-   Print the output of the print command to a file.

If you print to a file, pluma sends the output of the file to a pre-press
format file. The most common pre-press formats are PostScript and
Portable Document Format (PDF).

To preview the pages that you want to print, choose File Print Preview.

To print the current file to a printer or a file, choose File Print to
display the Print dialog.

The Print dialog enables you to specify the following print options:

### Job Tabbed Section

Print range
:   Select one of the following options to determine how many pages to
    print:

    -   All

        Select this option to print all of the pages in the file.

    -   Lines

        Select this option to print the specified lines only. Use the
        From and To spin boxes to specify the line range.

    -   Selection

        Select this option to print the selected text only. This option
        is only available if you select text.

Copies
:   Use the Number of copies spin box to specify the number of copies of
    the file that you want to print.

    If you print multiple copies of the file, select the Collate option
    to collate the printed copies.

### Printer Tabbed Section

Printer
:   Use this drop-down list to select the printer to which you want to
    print the file.

Settings
:   Use this drop-down list to select the printer settings.

    To configure the printer, click Configure. For example, you can
    enable or disable duplex printing, or schedule delayed printing, if
    this functionality is supported by the printer.

Location
:   Use this drop-down list to select one of the following print
    destinations:

    CUPS
    :   Print the file to a CUPS printer.

        > **Note**
        >
        > If the selected printer is a CUPS printer, CUPS is the only
        > entry in this drop-down list.

    lpr
    :   Print the file to a printer.

    File
    :   Print the file to a PostScript file.

        Click Save As to display a dialog where you specify the name and
        location of the PostScript file.

    Custom
    :   Use the specified command to print the file.

        Type the name of the command in the text box. Include all
        command-line arguments.

State
:   This functionality is not supported in this version of pluma.

Type
:   This functionality is not supported in this version of pluma.

Comment
:   This functionality is not supported in this version of pluma.

### Paper Tabbed Section

Paper size
:   Use this drop-down list to select the size of the paper to which you
    want to print the file.

Width
:   Use this spin box to specify the width of the paper. Use the
    adjacent drop-down list to change the measurement unit.

Height
:   Use this spin box to specify the height of the paper.

Feed orientation
:   Use this drop-down list to select the orientation of the paper in
    the printer.

Page orientation
:   Use this drop-down list to select the page orientation.

Layout
:   Use this drop-down list to select the page layout. A preview of each
    layout that you select is displayed in the Preview area.

Paper tray
:   Use this drop-down list to select the paper tray.

Programming Features
====================

Several of pluma's features for programming are provided with plugins. For
example, the Tag List plugin provides a list of commonly-used tags for
different markup languages: see ?.

Syntax Highlighting
-------------------

Syntax highlighting makes source code easier to read by showing
different parts of the text in different colors.

pluma chooses an appropriate syntax highlighting mode based on a
document's type. To override the syntax highlighting mode, choose View
Highlight Mode, then choose one of the following menu items:

Normal
:   Do not display any syntax highlighting.

Sources
:   Display syntax highlighting to edit source code. Use the Sources
    submenu to select the source code type.

Markup
:   Display syntax highlighting to edit markup code. Use the Markup
    submenu to select the markup code type.

Scripts
:   Display syntax highlighting to edit script code. Use the Scripts
    submenu to select the script code type.

Others
:   Display syntax highlighting to edit other types of code. Use the
    Others submenu to select the code type.

Piping the Output of a Command to a File
----------------------------------------

You can use pluma to pipe the output of a command to a text file. For
example, to pipe the output of an `ls` command to a text file, type
`ls | pluma`, then press Return.

The output of the `ls` command is displayed in a new text file in the
pluma window.

Alternatively, you can use the External tools plugin to pipe command
output to the current file.

Shortcut Keys
=============

Use shortcut keys to perform common tasks more quickly than with the
mouse and menus. The following tables list all of pluma's shortcut keys.

For more on shortcut keys, see the [Desktop User
Guide](ghelp:user-guide?keyboard-skills).

**Tabs**

Shortcuts for tabs:

  -------------------------------------------------------------------------
  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  Ctrl + Alt + PageUp                  Switches to the next tab to the
                                       left.

  Ctrl + Alt + PageDown                Switches to the next tab to the
                                       right.

  Ctrl + W                             Close tab.

  Ctrl + Shift + L                     Save all tabs.

  Ctrl + Shift + W                     Close all tabs.

  Alt + n                              Jump to nth tab.
  -------------------------------------------------------------------------

**Files**

Shortcuts for working with files:

  -------------------------------------------------------------------------
  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  Ctrl + N                             Create a new document.

  Ctrl + O                             Open a document.

  Ctrl + L                             Open a location.

  Ctrl + S                             Save the current document to disk.

  Ctrl + Shift + S                     Save the current document with a new
                                       filename.

  Ctrl + P                             Print the current document.

  Ctrl + Shift + P                     Print preview.

  Ctrl + W                             Close the current document.

  Ctrl + Q                             Quit Pluma.
  -------------------------------------------------------------------------

**Edit**

Shortcuts for editing documents:

  -------------------------------------------------------------------------
  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  Ctrl + Z                             Undo the last action.

  Ctrl + Shift + Z                     Redo the last undone action .

  Ctrl + X                             Cut the selected text or region and
                                       place it on the clipboard.

  Ctrl + C                             Copy the selected text or region
                                       onto the clipboard.

  Ctrl + V                             Paste the contents of the clipboard.

  Ctrl + A                             Select all.

  Ctrl + D                             Delete current line.

  Alt + Up                             Move the selected line up one line.

  Alt + Down                           Move the selected line down one
                                       line.
  -------------------------------------------------------------------------

**Panes**

Shortcuts for showing and hiding panes:

  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  F9                                   Show/hide the side pane.
  Ctrl + F9                            Show/hide the bottom pane.

**Search**

Shortcuts for searching:

  -------------------------------------------------------------------------
  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  Ctrl + F                             Find a string.

  Ctrl + G                             Find the next instance of the
                                       string.

  Ctrl + Shift + G                     Find the previous instance of the
                                       string.

  Ctrl + K                             Interactive search.

  Ctrl + H                             Search and replace.

  Ctrl + Shift + K                     Clear highlight.

  Ctrl + I                             Goto line.
  -------------------------------------------------------------------------

**Tools**

Shortcuts for tools:

  -------------------------------------------------------------------------
  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  Shift + F7                           Check spelling (with plugin).

  Alt + F12                            Remove trailing spaces (with
                                       plugin).

  Ctrl + T                             Indent (with plugin).

  Ctrl + Shift + T                     Remove Indent (with plugin).

  F8                                   Run "make" in current directory
                                       (with plugin).

  Ctrl + Shift + D                     Directory listing (with plugin).
  -------------------------------------------------------------------------

**Help**

Shortcuts for help:

  Shortcut Key                         Command
  ------------------------------------ ------------------------------------
  F1                                   Open pluma's user manual.

Preferences
===========

To configure pluma, choose Edit Preferences. The Preferences dialog
contains the following categories:

-   ?

-   ?

-   ?

-   ?

View Preferences
----------------

Text Wrapping
:   Select the Enable text wrapping option to have long lines of text
    flow into paragraphs instead of running off the edge of the text
    window. This avoids having to scroll horizontally

    Select the Do not split words over two lines option to have the text
    wrapping option preserve whole words when flowing text to the next
    line. This makes text easier to read.

Line Numbers
:   Select the Display line numbers option to display line numbers on
    the left side of the pluma window.

Current Line
:   Select the Highlight current line option to highlight the line where
    the cursor is placed.

Right Margin
:   Select the Display right margin option to display a vertical line
    that indicates the right margin.

    Use the Right margin at column spin box to specify the location of
    the vertical line.

Bracket Matching
:   Select the Highlight matching bracket option to highlight the
    corresponding bracket when the cursor is positioned on a bracket
    character.

Editor Preferences
------------------

Tabs
:   Use the Tab width spin box to specify the width of the space that
    pluma inserts when you press the Tab key.

    Select the Insert spaces instead of tabs option to specify that pluma
    inserts spaces instead of a tab character when you press the Tab
    key.

Auto Indentation
:   Select the Enable auto indentation option to specify that the next
    line starts at the indentation level of the current line.

File Saving
:   Select the Create a backup copy of files before saving option to
    create a backup copy of a file each time you save the file. The
    backup copy of the file contains a \~ at the end of the filename.

    Select the Autosave files every ... minutes option to automatically
    save the current file at regular intervals. Use the spin box to
    specify how often you want to save the file.

Font & Colors Preferences
-------------------------

Font
:   Select the Use default theme font option to use the default system
    font for the text in the pluma text window.

    The Editor font field displays the font that pluma uses to display
    text. Click on the button to specify the font type, style, and size
    to use for text.

Color Scheme
:   You can choose a color scheme from the list of color schemes. By
    default, the following color schemes are installed:

    Classic
    :   Classic color scheme based on the gvim color scheme.

    Cobalt
    :   Blue based color scheme.

    Kate
    :   Color scheme used in the Kate text editor.

    Oblivion
    :   Dark color scheme using the Tango color palette.

    Tango
    :   Color scheme using the Tango color scheme.

    You can add a new color scheme by clicking on Add..., and selecting
    a color scheme file

    You can remove the selected color scheme by clicking on Remove

Plugins Preferences
-------------------

Plugins add extra features to pluma. For more information on plugins and
how to use the built-in plugins, see ?.

### Enabling a Plugin

To enable a pluma plugin, perform the following steps:

1.  Choose Edit Preferences.

2.  Select the Plugins tab.

3.  Select the check box next to the name of the plugin that you want to
    enable.

4.  Click Close to close the Preferences dialog.

### Disabling a Plugin

A plugin remains enabled when you quit pluma.

To disable a pluma plugin, perform the following steps:

1.  Choose Edit Preferences.

2.  Select the Plugins tab.

3.  Deselect the check box next to the name of the plugin that you want
    to disable.

4.  Click Close to close the Preferences dialog.

Plugins
=======

Working with Plugins
--------------------

You can add extra features to pluma by enabling plugins. A plugin is a
supplementary program that enhances the functionality of an application.
Plugins add new items to the pluma menus for the new features they
provide.

Several plugins come built-in with pluma, and you can install more. The
[pluma website](http://live.gnome.org/Pluma/Plugins) lists third-party
plugins.

To enable and disable plugins, or see which plugins are currently
enabled, use the [Plugins Preferences](#pluma-prefs-plugins).

The following plugins come built-in with pluma:

-   [Change Case](#pluma-change-case-plugin) allows you to change the
    case of the selected text.

-   [Document Statistics](#pluma-document-statistics-plugin) shows the
    number of lines, words, and characters in the document.

-   [External Tools](#pluma-external-tools-plugin) allows you to execute
    external commands from pluma.

-   File Browser allows you to browse your files and folders in the side
    pane.

-   [Indent Lines](#pluma-indent-lines-plugin) adds or removes
    indentation from the selected lines.

-   [Insert Date/Time](#pluma-insert-date-time-plugin) adds the current
    date and time into a document.

-   [Modelines](#pluma-modelines-plugin) allows you to set editing
    preferences for individual documents, and supports Emacs, Kate and
    Vim-style modelines.

-   [Python Console](#pluma-python-console-plugin) allows you to run
    commands in the python programming language.

-   [Snippets](#pluma-snippets-plugin) allows you to store
    frequently-used pieces of text and insert them quickly into a
    document.

-   [Sort](#pluma-sort-plugin) arranges selected lines of text into
    alphabetical order.

-   [Spell Checker](#pluma-spell-checker-plugin) corrects the spelling
    in the selected text, or marks errors automatically in the document.

-   [Tag List](#pluma-tag-list-plugin) lets you insert commonly-used
    tags for HTML and other languages from a list in the side pane.

> **Note**
>
> For more information on creating plugins, see the [pluma
> website](http://live.gnome.org/Pluma/Plugins).

Change Case Plugin
------------------

The Change Case plugin changes the case of the selected text.

The following items are added to the Edit menu when the Change Case
plugin is enabled:

  --------------------------------------------------------------------------
  Menu Item                Action                   Example
  ------------------------ ------------------------ ------------------------
  Edit Change CaseAll      Change each character to `This text` becomes
  Upper Case               uppercase.               `THIS TEXT`

  Edit Change CaseAll      Change each character to `This Text` becomes
  Lower Case               lowercase.               `this text`

  Edit Change CaseInvert   Change each lowercase    `This Text` becomes
  Case                     character to uppercase,  `tHIS tEXT`
                           and change each          
                           uppercase character to   
                           lowercase.               

  Edit Change CaseTitle    Change the first         `this text` becomes
  Case                     character of each word   `This Text`
                           to uppercase.            
  --------------------------------------------------------------------------

Document Statistics Plugin
--------------------------

The Document Statistics plugin counts the number of lines, words,
characters with spaces, characters without spaces, and bytes in the
current file. The plugin displays the results in a Document Statistics
dialog. To use the Document Statistics plugin, perform the following
steps:

1.  Choose Tools Document Statistics to display the Document Statistics
    dialog. The Document Statistics dialog displays the following
    information about the file:

    -   Number of lines in the current document.

    -   Number of words in the current document.

    -   Number of characters, including spaces, in the current document.

    -   Number of characters, not including spaces, in the current
        document.

    -   Number of bytes in the current document.

2.  You can continue to update the pluma file while the Document
    Statistics dialog is open. To refresh the contents of the Document
    Statistics dialog, click Update.

External Tools Plugin
---------------------

The External Tools plugin allows you to execute external commands from
pluma. You can pipe some content into a command and exploit its output
(for example, sed), or launch a predefined command (for example, make).

Use the External Tools Manager to create and edit commands. To run an
external command, choose it from the Tools menu.

### Built-in Commands

The following commands are provided with the External Tools plugin:

Build
:   Runs make in the current document's directory.

Directory Listing
:   Lists the contents of the current document's directory in a new
    document.

Environment Variables
:   Displays the environment variables list in the bottom pane.

Grep
:   Searches for a term in all files in the current document directory,
    using pattern matching. Results are shown in the bottom pane.

Remove Trailing Spaces
:   Removes all spaces from the end of lines in the document.

### Defining a Command

To add an external command, choose ToolsExternal Tools.

In the External Tools Manager window, click New. You can speficy the
following details for the new command:

Description
:   This description is shown in the statusbar when the menu command is
    chosen.

Accelerator
:   Enter a keyboard shortcut for the command.

Commands
:   The actual commands to be run. Several pluma environment variables can
    be used to pass content to these commands: see ?.

Input
:   The content to give to the commands (as stdin): the entire text of
    the current document, the current selection, line, or word.

Output
:   What to do with the output of the commands: display in the bottom
    pane, put in a new document, or place in the current document, at
    the end, at the cursor position, or replacing the selection or the
    entire document.

Applicability
:   Determines which sort of documents can be affected by the command,
    for example whether saved or not, and local or remote.

### Editing and Removing Tools

To edit a tool, select it in the list and make changes to its
properties.

To rename a tool, click it again in the list.

To restore a built-in tool that you have changed, press Revert.

To remove a tool, select it in the list and press Remove. You can not
remove built-in tools, only those you have created yourself.

### Variables

You can use the following variables in the Commands field of the command
definition:

-   PLUMA\_CURRENT\_DOCUMENT\_URI

-   PLUMA\_CURRENT\_DOCUMENT\_NAME

-   PLUMA\_CURRENT\_DOCUMENT\_SCHEME

-   PLUMA\_CURRENT\_DOCUMENT\_PATH

-   PLUMA\_CURRENT\_DOCUMENT\_DIR

-   PLUMA\_DOCUMENTS\_URI

-   PLUMA\_DOCUMENTS\_PATH

File Browser Plugin
-------------------

The File Browser Plugin shows your files and folders in the side pane,
allowing you to quickly open files.

To view the File Browser, choose View Side Pane and then click on the
tab showing the File Browser icon at the bottom of the side pane.

### Browsing your Files

The File Browser tab initially shows your file manager bookmarks. To
browse the contents of any item, double-click it.

To show a parent folder, choose from the drop-down list, or press the up
arrow on the File Browser's toolbar.

To show the folder that contains the document you are currently working
on, right-click in the file list and choose Set root to active document.

### Opening a File

To open a file in pluma, double-click it in the file list.

### Creating Files and Folders

To create a new, empty text file in the current folder shown in the
browser, right-click in the file list and choose New File.

To create a new folder in the current folder shown in the browser,
right-click in the file list and choose New Folder.

Indent Lines Plugin
-------------------

The Indent Lines plugin adds or removes space from the beginning of
lines of text.

To indent or unindent text, perform the following steps:

1.  Select the lines that you want to indent. To indent or unindent a
    single line, place the cursor anywhere on that line.

2.  -   To indent the text, choose Edit Indent.

    -   To remove the indentation, choose Edit Unindent.

The amount of space used, and whether tab character or space characters
are used, depends on the Tab Stops settings in the Editor Preferences:
see ?.

Insert Date/Time Plugin
-----------------------

The Insert Date/Time plugin inserts the current date and time into a
document. To use the Insert Date/Time plugin, perform the following
steps:

1.  Choose Edit Insert Date and Time.

    If you have not configured the Insert Date/Time plugin to
    automatically insert the date/time without prompting you for the
    format, pluma displays the Insert Date and Time dialog. Select the
    appropriate date/time format from the list. Click Insert to close
    the Insert Date and Time dialog. pluma inserts the date/time at the
    cursor position in the current file.

    If you have configured pluma to use one particular date/time format,
    the Insert Date and Time dialog is not displayed. The date/time is
    automatically entered at the cursor position in the current file.

### Configuring the Insert Date/Time Plugin

To configure the Insert Date/Time plugin, perform the following steps:

1.  Choose Edit Preferences.

2.  Select the Plugins tab.

3.  Select the Insert Date/Time plugin.

4.  Click Configure Plugin to display the Configure insert date/time
    plugin dialog.

5.  Select one of the options, as follows:

    -   To specify the date/time format each time you insert the
        date/time, select the Prompt for a format option.

    -   To use the same pluma-provided date/time format each time you
        insert the date/time, select the Use the selected format option,
        then select the appropriate format from the list. When you
        select this option, pluma does not prompt you for the date/time
        format when you choose Edit Insert Date and Time.

    -   To use the same customized date/time format each time you insert
        the date/time, select the Use custom format option, then enter
        the appropriate format in the text box. For more information
        about how to specify a custom format, see
        [strftime3](man:strftime). When you select this option, pluma does
        not prompt you for the date/time format when you choose Edit
        Insert Date and Time.

6.  Click OK to close the Configure insert date/time plugin dialog.

7.  To close the Preferences dialog, click Close.

Modelines Plugin
----------------

The Modelines plugin allows you to set preferences for individual
documents. A modeline is a line of text at the start or end of the
document with settings that pluma recognises.

Preferences set using modelines take precedence over the ones specified
in the preference dialog.

You can set the following preferences with modelines:

-   Tab width

-   Indent width

-   Insert spaces instead of tabs

-   Text Wrapping

-   Right margin width

The Modelines plugin supports a subset of the options used by other text
editors Emacs, Kate and Vim.

### Emacs Modelines

The first two lines of a document are scanned for Emacs modelines.

The Emacs options for tab-width, indent-offset, indent-tabs-mode and
autowrap are supported. For more information, see the [GNU Emacs
Manual](http://www.delorie.com/gnu/docs/emacs/emacs_486.html).

### Kate Modelines

The first and last ten lines a document are scanned for Kate modelines.

The Kate options for tab-width, indent-width, space-indent, word-wrap
and word-wrap-column are supported. For more information, see the [Kate
website](http://www.kate-editor.org/article/katepart_modelines).

### Vim Modelines

The first and last three lines a document are scanned for Vim modelines.

The Vim options for et, expandtab, ts, tabstop, sw, shiftwidth, wrap,
and textwidth are supported. For more information, see the [Vim
website](http://vimdoc.sourceforge.net/htmldoc/options.html#modeline).

Python Console Plugin
---------------------

The Python Console Plugin allows you to run commands in the python
programming language from pluma. Enabling the plugin adds a tab to the
bottom pane. This shows recent output and a command prompt field.

> **Caution**
>
> Commands entered into the python console are not checked before they
> are run. It is therefore possible to hang pluma, for example by entering
> an infinite loop.

Snippets Plugin
---------------

The Snippets plugin allows you to store frequently-used pieces of text,
called snippets, and insert them quickly into a document.

Snippets are specific to the language syntax of the current document.
For example, when you are working with an HTML document, you can choose
from a list of snippets that are useful for HTML. In addition, some
snippets are global, and are available in all documents.

A number of built-in snippets are installed with pluma, which can be
modified.

### Inserting Snippets

To insert a snippet into a document, type its tab trigger and press Tab.
A snippet's tab trigger is usually the first few letters of the snippet,
or something else that is short and easy to remember.

Alternatively, press CtrlSpace to see a list of snippets you can insert.

### Adding Snippets

To create a new snippet, do the following:

1.  Choose ToolsManage Snippets. The Snippets Manager window opens.

2.  The list of snippets is grouped by language. Select the language you
    want to add a snippet to, or a snippet in that language group. To
    add a snippet for all languages, choose Global at the top of the
    list. The syntax of the document you are currently working with is
    shown by default.

3.  Click New. A new snippet appears in the list.

4.  Enter the following information for the new snippet:

    Name
    :   Enter a name for the snippet in the text field within the
        snippet list. The name of a snippet serves only as a reminder of
        its purpose. You can change name of a snippet you create by
        clicking on it in the list.

    Snippet text
    :   Enter the text of the snippet in the Edit snippet text box. For
        special codes you can use, see ?.

        > **Tip**
        >
        > You can switch back to the document window to copy text
        > without closing the Snippets Manager window.

    Tab Trigger
    :   Enter the tab trigger for the snippet. This is the text that you
        type before pressing Tab to insert the snippet.

        The tag must be either a single word comprising only letters, or
        any single character. The Tab trigger will highlight in red if
        an invalid tab trigger is entered.

    Shortcut key
    :   Type a shortcut key to use for inserting the snippet.

### Editing and Removing Snippets

To edit a snippet, select it in the list and make changes to its text
and activation properties.

To rename a snippet, click it again in the list.

To restore a built-in snippet that you have changed, press Revert.

To remove a snippet, select it in the list and press Remove. You can not
remove built-in snippets, only those you have created yourself.

### Snippet Substitutions

In addition to inserting stored text, a snippet can include customizable
text, or mark spaces where you can add text once the snippet is inserted
in your document.

You can use the following placeholder codes in snippet text:

Tab placeholders
:   `$` defines a tab placeholder, where `n` is any number from 1
    upwards.

    `${:}` defines a tab placeholder with a default value.

    A tab placeholder marks a place in the snippet text where you can
    add extra text after the snippet is inserted.

    To use tab placeholders, insert the snippet as normal. The cursor is
    placed at the first tab placeholder. Type text, and press Tab to
    advance to the next tab placeholder. The number in the placeholder
    code defines the order in which tab advances to each place in the
    text.

    Press ShiftTab to return to the previous tab placeholder. Pressing
    Tab when there are no more tab placeholders moves the cursor to the
    end of the snippet text, or to the end placeholder if it exists.

Mirror placeholders
:   A repeated tab placeholder will mirror the placeholder already
    defined. This allows you to type in text only once that you want to
    appear several times in the snippet.

End placeholder
:   `$0` defines the end placeholder. This allows you to finish working
    with the snippet with the cursor at a point other than the end of
    the snippet text.

Environmental variables
:   Environmental variable such as `$PATH` and `$HOME` are substituted
    in snippet text. The following variables specific to pluma can also be
    used:

    \$PLUMA\_SELECTED\_TEXT
    :   The currently selected text.

    \$PLUMA\_FILENAME
    :   The full filename of the document, or an empty string if the
        document isn't saved yet.

    \$PLUMA\_BASENAME
    :   The basename of the filename of the document, or an empty string
        if the document isn't saved yet.

    \$PLUMA\_CURRENT\_WORD
    :   The word at the cursor's location in the document. When this
        variable is used, the current word will be replaced by the
        snippet text.

Shell placeholders
:   `$()` is replaced by the result of executing cmd in a shell.

    `$(:)` allows you to give this placeholder a reference, where n is
    any number from 1 upwards. Use `$` to use the output from one shell
    placeholder as input in another.

Python placeholders
:   `$<>` is replaced by the result of evaluating cmd in the python
    interpreter.

    `$<:>` specifies another python placeholder as a dependency, where a
    gives its order in the snippet. This allows you to use python
    functions defined in another snippet. To specify several
    dependencies, separate the numbers with commas thus: `$<,:>`

    To use a variable in all other python snippets, declare it as
    `global`.

Sort Plugin
-----------

The Sort plugin arranges selected lines of text into alphabetical order.

> **Caution**
>
> You cannot undo the Sort operation, so you should save the file before
> performing the sort. To revert to the saved version of the file after
> the sort operation, choose File Revert.

To use the Sort plugin, perform the following steps:

1.  Select the lines of text you want to sort.

2.  Choose Edit Sort. The Sort dialog opens.

3.  Choose the options you want for the sort:

    -   To arrange the text in reverse order, select Reverse order.

    -   To delete duplicate lines, select Remove duplicates.

    -   To ignore case sensitivity, select Ignore case.

    -   To have the sort ignore the characters at the start of the
        lines, set the first character that should be used for sorting
        in the Start at column spin box.

4.  To perform the sort operation, click Sort.

Spell Checker Plugin
--------------------

The Spell Checker plugin checks the spelling in the selected text. You
can configure pluma to check the spelling automatically, or you can check
the spelling manually, in the specified language. The language setting,
and the autocheck spelling properties, apply per document. To use the
Spell checker plugin, perform the following steps:

1.  Choose Tools Set Language to display the Set language dialog. Select
    the appropriate language from the list. Click OK to close the Set
    language dialog.

2.  To check the spelling automatically, choose Tools Autocheck
    Spelling. To unset the automatic spell check, choose Tools Autocheck
    Spelling again. When automatic spell checking is set, an icon is
    displayed beside the Autocheck Spelling menu item. Automatic spell
    checking is unset by default, each time pluma starts.

    Unknown spellings are displayed in a different color, and
    underlined. Right-click on an unknown spelling, then select Spelling
    Suggestions from the popup menu:

    -   To replace the unknown spelling with another spelling in the
        list, select the replacement spelling from the Spelling
        Suggestions popup menu.

    -   To add the unknown spelling to your personal dictionary, select
        Spelling Suggestions Add.

    -   To ignore all occurrences of the unknown spelling, so that they
        are no longer flagged as unknown but are not added to your
        personal dictionary, select Spelling Suggestions Ignore All. The
        unknown word is ignored in the current pluma session only.

3.  To check the spelling manually, choose Tools Check Spelling.

    If there are no spelling errors, an Information dialog displays a
    message stating that the document does not contain misspelled words.
    Click OK to close the Information dialog.

    If there are spelling errors, the Check Spelling dialog is
    displayed:

    -   The Misspelled word is displayed at the top of the dialog.

    -   A suggested known spelling is displayed in the Change to text
        box. You can replace this with another known spelling by
        selecting a spelling from the Suggestions list, or you can enter
        text directly into the Change to text box.

    -   To check the spelling of the text in the Change to text box,
        click Check Word. If this is a known word, the Suggestions list
        is replaced with the text `(correct spelling)`. If the word is
        not known, new entries appear in the Suggestions list.

    -   To ignore the current occurrence of the unknown word, click
        Ignore. To ignore all occurrences of the unknown word, click
        Ignore All. The unknown word is ignored in the current pluma
        session only.

    -   To change the current occurrence of the unknown word to the text
        in the Change to text box, click Change. To change all
        occurrences of the unknown word to the text in the Change to
        text box, click Change All.

    -   To add the unknown word to your personal dictionary, click Add
        word.

    -   To close the Check Spelling dialog, click Close.

Tag List Plugin
---------------

The Tag List plugin allows you to insert common tags from a list in the
side pane.

To use the Tag List plugin, perform the following steps:

 1.  Choose View Side Pane.

 2.  By default, the side pane shows a tab containing a list of open
    documents. Click on the tab showing a + icon at the bottom of the
    side pane to show the tag list tab.

 3.  Select the appropriate tag category from the drop-down list. For
    example, HTML - Tags.

 4.  Scroll through the tag list to find the required tag.

 5.  To insert a tag at the cursor position in the current file,
    double-click on the tag in the tag list. You can also insert a tag
    as follows:

    -   To insert a tag in the current file and change the focus from
        the side pane to the display area, press Return.

    -   To insert a tag in the current file and maintain the focus on
        the Tag list plugin window, press ShiftReturn.

 
 
 

