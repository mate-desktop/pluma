## Process this file with automake to produce Makefile.in
SUBDIRS = dialogs mate-submodules

bin_PROGRAMS = pluma

noinst_LTLIBRARIES = libpluma.la

AM_CPPFLAGS =								\
	-I$(top_srcdir)							\
	-I$(srcdir)							\
	-I$(srcdir)/mate-submodules/libegg				\
	$(PLUMA_CFLAGS)							\
	$(WARN_CFLAGS)							\
	$(INTROSPECTION_CFLAGS)						\
	-DDATADIR=\""$(datadir)"\"					\
	-DPLUMA_DATADIR=\""$(datadir)/pluma"\"				\
	-DPLUMA_LOCALEDIR=\""$(datadir)/locale/"\"			\
	-DLIBDIR=\""$(libdir)"\"					\
	-DPLUMA_LIBDIR=\""$(libdir)/pluma"\"

pluma_SOURCES = \
	pluma.c

pluma_LDADD = libpluma.la $(PLUMA_LIBS) $(LIBEGG_LIBS) $(INTROSPECTION_LIBS)

pluma_LDFLAGS = -export-dynamic -no-undefined -export-symbols-regex "^[[^_]].*"

libpluma_la_LDFLAGS = -export-dynamic -no-undefined -export-symbols-regex "^[[^_]].*"

libpluma_la_LIBADD = \
	dialogs/libdialogs.la		\
	mate-submodules/libegg/libegg.la

# PLUMA_LIBS must be the last to ensure correct order on some platforms
libpluma_la_LIBADD += $(PLUMA_LIBS) -lICE

BUILT_SOURCES = 			\
	pluma-enum-types.c		\
	pluma-enum-types.h

NOINST_H_FILES =			\
	pluma-close-button.h		\
	pluma-dirs.h			\
	pluma-document-input-stream.h	\
	pluma-document-loader.h		\
	pluma-document-output-stream.h	\
	pluma-document-saver.h		\
	pluma-documents-panel.h		\
	pluma-file-chooser-dialog.h	\
	pluma-history-entry.h		\
	pluma-io-error-message-area.h	\
	pluma-language-manager.h	\
	pluma-pango.h			\
	pluma-plugins-engine.h		\
	pluma-print-job.h		\
	pluma-print-preview.h		\
	pluma-session.h			\
	pluma-settings.h		\
	pluma-smart-charset-converter.h	\
	pluma-style-scheme-manager.h	\
	pluma-tab-label.h		\
	plumatextregion.h		\
	pluma-ui.h			\
	pluma-window-private.h

INST_H_FILES =				\
	pluma-app.h			\
	pluma-app-activatable.h 	\
	pluma-commands.h		\
	pluma-debug.h			\
	pluma-document.h 		\
	pluma-encodings.h		\
	pluma-encodings-combo-box.h	\
	pluma-help.h 			\
	pluma-message-bus.h		\
	pluma-message-type.h		\
	pluma-message.h			\
	pluma-notebook.h		\
	pluma-panel.h			\
	pluma-progress-message-area.h	\
	pluma-statusbar.h		\
	pluma-status-combo-box.h	\
	pluma-tab.h 			\
	pluma-utils.h 			\
	pluma-view.h 			\
	pluma-view-activatable.h 	\
	pluma-window.h			\
	pluma-window-activatable.h

if !ENABLE_GVFS_METADATA
INST_H_FILES += pluma-metadata-manager.h
endif

headerdir = $(prefix)/include/pluma

header_DATA = 				\
	$(INST_H_FILES)

libpluma_c_files = 			\
	pluma-app.c			\
	pluma-app-activatable.c 	\
	pluma-close-button.c		\
	pluma-commands-documents.c	\
	pluma-commands-edit.c		\
	pluma-commands-file.c		\
	pluma-commands-file-print.c	\
	pluma-commands-help.c		\
	pluma-commands-search.c		\
	pluma-commands-view.c		\
	pluma-debug.c			\
	pluma-dirs.c			\
	pluma-document.c 		\
	pluma-document-input-stream.c	\
	pluma-document-loader.c		\
	pluma-document-output-stream.c	\
	pluma-document-saver.c		\
	pluma-documents-panel.c		\
	pluma-encodings.c		\
	pluma-encodings-combo-box.c	\
	pluma-file-chooser-dialog.c	\
	pluma-help.c			\
	pluma-history-entry.c		\
	pluma-io-error-message-area.c	\
	pluma-language-manager.c	\
	pluma-message-bus.c		\
	pluma-message-type.c		\
	pluma-message.c			\
	pluma-notebook.c		\
	pluma-panel.c			\
	pluma-pango.c			\
	pluma-plugins-engine.c		\
	pluma-print-job.c		\
	pluma-print-preview.c		\
	pluma-progress-message-area.c	\
	pluma-session.c			\
	pluma-settings.c		\
	pluma-smart-charset-converter.c	\
	pluma-statusbar.c		\
	pluma-status-combo-box.c	\
	pluma-style-scheme-manager.c	\
	pluma-tab.c 			\
	pluma-tab-label.c		\
	pluma-utils.c 			\
	pluma-view.c 			\
	pluma-view-activatable.c 	\
	pluma-window.c			\
	pluma-window-activatable.c 	\
	plumatextregion.c

nodist_libpluma_la_SOURCES = 		\
	$(BUILT_SOURCES)

libpluma_la_SOURCES = 			\
	$(libpluma_c_files)		\
	$(BACON_FILES)			\
	$(POSIXIO_FILES)		\
	$(NOINST_H_FILES)		\
	$(INST_H_FILES)

if !ENABLE_GVFS_METADATA
libpluma_la_SOURCES += pluma-metadata-manager.c
endif

pluma-enum-types.h: pluma-enum-types.h.template $(INST_H_FILES) $(GLIB_MKENUMS)
	$(AM_V_GEN) (cd $(srcdir) && $(GLIB_MKENUMS) --template pluma-enum-types.h.template $(INST_H_FILES)) > $@

pluma-enum-types.c: pluma-enum-types.c.template $(INST_H_FILES) $(GLIB_MKENUMS)
	$(AM_V_GEN) (cd $(srcdir) && $(GLIB_MKENUMS) --template pluma-enum-types.c.template $(INST_H_FILES)) > $@

aboutdir = $(datadir)/pluma/
about_DATA =				\
	pluma.about			\
	$(NULL)

uidir = $(datadir)/pluma/ui/
ui_files = pluma-print-preferences.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = 				\
	pluma-ui.xml			\
	$(ui_files)

EXTRA_DIST = 				\
	$(ui_DATA)			\
	$(about_DATA)			\
	pluma-enum-types.h.template	\
	pluma-enum-types.c.template	\
	pluma.rc			\
	ui-a11y.suppr

CLEANFILES = $(BUILT_SOURCES)

if HAVE_INTROSPECTION
-include $(INTROSPECTION_MAKEFILE)
INTROSPECTION_GIRS = Pluma-1.0.gir
INTROSPECTION_SCANNER_ARGS = -I$(top_srcdir) --warn-all

Pluma-1.0.gir: pluma
Pluma_1_0_gir_NAMESPACE = Pluma
Pluma_1_0_gir_VERSION = 1.0
Pluma_1_0_gir_PROGRAM = $(builddir)/pluma
Pluma_1_0_gir_FILES = $(INST_H_FILES) $(libpluma_c_files) $(BUILT_SOURCES)
Pluma_1_0_gir_INCLUDES = Gtk-3.0 GtkSource-4

girdir = $(datadir)/gir-1.0
gir_DATA = $(INTROSPECTION_GIRS)

typelibdir = $(libdir)/girepository-1.0
typelib_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)

CLEANFILES += $(gir_DATA) $(typelib_DATA)
endif

BACON_DIR=$(srcdir)/../../libbacon/src/
BACON_FILES=bacon-message-connection.h bacon-message-connection.c

regenerate-built-sources:
	BACONFILES="$(BACON_FILES)" BACONDIR="$(BACON_DIR)" $(top_srcdir)/pluma/update-from-bacon.sh

-include $(top_srcdir)/git.mk
