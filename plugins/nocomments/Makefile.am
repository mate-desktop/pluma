# nocomments plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) 				\
	$(PLUMA_CFLAGS) 				\
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libnocomments.la

libnocomments_la_SOURCES = \
	pluma-nocomments-plugin.h	\
	pluma-nocomments-plugin.c

libnocomments_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libnocomments_la_LIBADD = $(PLUMA_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/nocomments
ui_DATA =

plugin_in_files = nocomments.plugin.desktop.in

%.plugin: %.plugin.desktop.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

plugin_DATA = $(plugin_in_files:.plugin.desktop.in=.plugin)

EXTRA_DIST = $(ui_DATA) $(plugin_in_files)

CLEANFILES = $(plugin_DATA)
DISTCLEANFILES = $(plugin_DATA)


-include $(top_srcdir)/git.mk
