# filebrowser

plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir)				\
	$(PLUMA_CFLAGS) 			\
	$(WARN_CFLAGS)

BUILT_SOURCES = \
	pluma-file-browser-enum-types.h		\
	pluma-file-browser-enum-types.c

plugin_LTLIBRARIES = libfilebrowser.la

NOINST_H_FILES = \
	pluma-file-bookmarks-store.h 		\
	pluma-file-browser-store.h 		\
	pluma-file-browser-view.h 		\
	pluma-file-browser-widget.h 		\
	pluma-file-browser-error.h		\
	pluma-file-browser-utils.h		\
	pluma-file-browser-plugin.h		\
	pluma-file-browser-messages.h

libfilebrowser_la_SOURCES = \
	$(BUILT_SOURCES) 			\
	pluma-file-bookmarks-store.c 		\
	pluma-file-browser-store.c 		\
	pluma-file-browser-view.c 		\
	pluma-file-browser-widget.c 		\
	pluma-file-browser-utils.c 		\
	pluma-file-browser-plugin.c		\
	pluma-file-browser-messages.c		\
	$(NOINST_H_FILES)

libfilebrowser_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libfilebrowser_la_LIBADD = $(PLUMA_LIBS)

# UI files (if you use ui for your plugin, list those files here)
uidir = $(PLUMA_PLUGINS_DATA_DIR)/filebrowser
ui_DATA = pluma-file-browser-widget-ui.xml

plugin_DATA = filebrowser.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

pluma-file-browser-enum-types.h: pluma-file-browser-enum-types.h.template $(NOINST_H_FILES) $(GLIB_MKENUMS)
	(cd $(srcdir) && $(GLIB_MKENUMS) --template pluma-file-browser-enum-types.h.template $(NOINST_H_FILES)) > $@

pluma-file-browser-enum-types.c: pluma-file-browser-enum-types.c.template pluma-file-browser-enum-register.c.template $(NOINST_H_FILES) $(GLIB_MKENUMS)
	$(AM_V_GEN) (cd $(srcdir) && \
	$(GLIB_MKENUMS) --template pluma-file-browser-enum-types.c.template $(NOINST_H_FILES) && \
	$(GLIB_MKENUMS) --template pluma-file-browser-enum-register.c.template $(NOINST_H_FILES)) > $@

filebrowser_gschema_in = org.mate.pluma.plugins.filebrowser.gschema.xml.in
gsettings_SCHEMAS = $(filebrowser_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = \
	$(ui_DATA)					\
	$(plugin_in_in_files)				\
	$(filebrowser_gschema_in)			\
	pluma-file-browser-enum-types.h.template	\
	pluma-file-browser-enum-types.c.template	\
	pluma-file-browser-enum-register.c.template

CLEANFILES = \
	$(plugin_DATA)			\
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)		\
	$(BUILT_SOURCES)

DISTCLEANFILES = \
	$(plugin_in_files)		\
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)		\
	$(BUILT_SOURCES)

-include $(top_srcdir)/git.mk
