# docinfo plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) 				\
	$(PLUMA_CFLAGS) 				\
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libdocinfo.la

BUILT_SOURCES = \
	pluma-docinfo-resources.c

nodist_libdocinfo_la_SOURCES = $(BUILT_SOURCES)

libdocinfo_la_SOURCES = \
	pluma-docinfo-plugin.h	\
	pluma-docinfo-plugin.c

libdocinfo_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libdocinfo_la_LIBADD  = $(PLUMA_LIBS)

# Generate resources
pluma-docinfo-resources.c: pluma-docinfo.gresource.xml Makefile $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir $(srcdir) $(srcdir)/pluma-docinfo.gresource.xml)
	$(AM_V_GEN) XMLLINT=$(XMLLINT) $(GLIB_COMPILE_RESOURCES) --target $@ --sourcedir $(srcdir) --generate --c-name pluma $<

include $(top_srcdir)/gla11y.mk

plugin_DATA = docinfo.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

EXTRA_DIST = \
	$(plugin_in_files) \
	pluma-docinfo.gresource.xml \
	pluma-docinfo-plugin.ui \
	ui-a11y.suppr

CLEANFILES = $(BUILT_SOURCES) $(plugin_DATA)
DISTCLEANFILES = $(plugin_in_files)

-include $(top_srcdir)/git.mk
