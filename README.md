# Pluma - The MATE text editor

![pluma-icon](pixmaps/pluma.ico)

## General Information

Pluma (pluma) is a small and lightweight UTF-8 text editor for the MATE environment. It started as a fork of Gedit (at version 2.30) in 2011, back then the text editor for the GNOME 2 environment.

Pluma is part of MATE and uses the latest GTK+ and MATE libraries.
Complete MATE integration is featured, with support for Drag and Drop from Caja (the MATE file manager), the use of the MATE help system,
the MATE Virtual File System and the MATE print framework.

Pluma uses a Multiple Document Interface, which lets you edit more than
one document at the same time.

Pluma supports most standard editing features, plus several not found in your
average text editor (plugins being the most notable of these).

Although new features are always under development, currently Pluma has:

- **Complete support for UTF-8 text**
- **Syntax highlighting**
- **Support for editing remote files**
- **Search and Replace**
- **Printing and Print Previewing Support**
- **File Revert**
- **A complete preferences interface**
- **Configurable Plugin system**


Some of the plugins, packaged and installed with Pluma include, among others:

- **Spell checker** - *Checks the spelling of the current document*
- **File Browser** - *Easy file access from the side pane*
- **Sort** - *Sorts a document or selected text*
- **Insert Date/Time** - *Inserts current date and time at the cursor position*
- **Tag list** - *Provides a method to easily insert code tags.*

Other external plugins are also available.

Pluma is released under the GNU General Public License (GPL) version 2, see the file 'COPYING' for more information.

The official web site is:

    https://mate-desktop.org/

You can download the latest Pluma tarball from:

    https://pub.mate-desktop.org/releases/

## Build/Installation

Pluma requires GTK+ (>= 3.22) and GtkSourceView (>= 4.0.2). For a complete list of dependencies see the [build.yml](https://github.com/mate-desktop/pluma/blob/master/.build.yml).

**Warning**: This procedure doesn't install in a separate prefix, so it may
overwrite your system binaries.

Simple install procedure:

```
$ git submodule update --init --recursive   # Init git submodules
$ NOCONFIGURE=1 ./autogen.sh                # Copy configuration requirements
$ ./configure                               # Build configuration
$ make                                      # Build
[ Become root if necessary ]
$ make install                              # Installation
```
For installation to a separate prefix change the above `./configure` command to

```
$ ./configure --prefix=/an/other/path
```
To get more information type the command below:
```
$ ./configure --help
```


## Running Tests

Pluma has several test that can be run after compilation. Run them by issueing "make check". However there are a couple of requirements that need to be satisfied before they will pass.

* You need the gsettings schemas installed for some tests to be able to run.
* You need to mount sftp://localhost/ with gvfs-mount for one test to pass.

If test fail and you have setup the above correctly then please file a bug report as described below.

## How to report bugs

Bugs should be reported to the MATE bug tracking system:

  https://github.com/mate-desktop/Pluma/issues

You will need to create an account for yourself.

In the bug report please include:

* Information about your system. For instance:
    - What operating system and version
    - What version of X
    - What version of the gtk+, glib and mate libraries
    - For Linux, what version of the C library

* And anything else you think is relevant. For example:

    - How to reproduce the bug.

    - If the bug was a crash, the exact text that was printed out when the crash occurred.

    - Further information such as stack traces may be useful, but is not necessary. If you do send a stack trace, and the error is an X error, it will be more useful if the stack trace is produced running the test program with the `--sync` command line option.

## Patches

Patches should also be submitted to https://github.com/mate-desktop/pluma, preferably via pull requests.

The Pluma team.
