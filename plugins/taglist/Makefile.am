# Tag list plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

taglistdir = $(PLUMA_PLUGINS_DATA_DIR)/taglist

taglist_in_files = \
	HTML.tags.xml.in		\
	Latex.tags.xml.in		\
	XSLT.tags.xml.in		\
	XUL.tags.xml.in

taglist_DATA = $(taglist_in_files:.tags.xml.in=.tags.gz)

AM_CPPFLAGS = \
	-I$(top_srcdir) 		\
	$(PLUMA_CFLAGS)			\
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libtaglist.la

libtaglist_la_SOURCES = \
	pluma-taglist-plugin-parser.c	\
	pluma-taglist-plugin-parser.h	\
	pluma-taglist-plugin-panel.c	\
	pluma-taglist-plugin-panel.h	\
	pluma-taglist-plugin.c		\
	pluma-taglist-plugin.h

libtaglist_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libtaglist_la_LIBADD  = $(PLUMA_LIBS)

plugin_DATA = taglist.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

GZIP_ENV = -9

%.tags.gz: %.tags.xml.in
	$(AM_V_GEN) GETTEXTDATADIR=$(top_srcdir) $(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $(@:.gz=)
	GZIP=$(GZIP_ENV) gzip -n -f $(@:.gz=)

EXTRA_DIST = \
	$(taglist_in_files) \
	$(plugin_in_in_files)

CLEANFILES = \
	$(taglist_DATA)	\
	$(plugin_DATA)

DISTCLEANFILES = \
	$(plugin_in_files)

-include $(top_srcdir)/git.mk
