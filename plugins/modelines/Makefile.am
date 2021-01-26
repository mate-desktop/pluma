# Modelines Plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) 				\
	$(PLUMA_CFLAGS) 				\
	$(WARN_CFLAGS)

modelinesdir = $(PLUMA_PLUGINS_DATA_DIR)/modelines
modelines_DATA = \
	language-mappings

plugin_LTLIBRARIES = libmodelines.la

libmodelines_la_SOURCES = \
	pluma-modeline-plugin.h				\
	pluma-modeline-plugin.c				\
	modeline-parser.h				\
	modeline-parser.c

libmodelines_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libmodelines_la_LIBADD  = $(PLUMA_LIBS)

plugin_DATA = modelines.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

EXTRA_DIST = \
	$(plugin_in_in_files)				\
	$(modelines_DATA)

CLEANFILES = $(plugin_DATA)
DISTCLEANFILES = $(plugin_in_files)

-include $(top_srcdir)/git.mk
