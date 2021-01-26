# docinfo plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) 				\
	$(PLUMA_CFLAGS) 				\
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libdocinfo.la

libdocinfo_la_SOURCES = \
	pluma-docinfo-plugin.h	\
	pluma-docinfo-plugin.c

libdocinfo_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libdocinfo_la_LIBADD  = $(PLUMA_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/docinfo
ui_files = docinfo.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

plugin_DATA = docinfo.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

EXTRA_DIST = $(ui_DATA) $(plugin_in_in_files) ui-a11y.suppr

CLEANFILES = $(plugin_DATA)
DISTCLEANFILES = $(plugin_in_files)

-include $(top_srcdir)/git.mk
