# changecase plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) 				\
	$(PLUMA_CFLAGS) 				\
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libchangecase.la

libchangecase_la_SOURCES = \
	pluma-changecase-plugin.h	\
	pluma-changecase-plugin.c

libchangecase_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libchangecase_la_LIBADD = $(PLUMA_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/changecase
ui_DATA =

plugin_in_files = changecase.plugin.desktop.in
plugin_DATA = $(plugin_in_files:.plugin.desktop.in=.plugin)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

EXTRA_DIST = $(ui_DATA) $(plugin_in_files)

CLEANFILES = $(plugin_DATA)
DISTCLEANFILES = $(plugin_DATA)


-include $(top_srcdir)/git.mk
