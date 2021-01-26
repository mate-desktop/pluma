# time plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = \
	-I$(top_srcdir) \
	$(PLUMA_CFLAGS) \
	$(WARN_CFLAGS)

plugin_LTLIBRARIES = libtime.la

libtime_la_SOURCES = \
	pluma-time-plugin.h \
	pluma-time-plugin.c

libtime_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libtime_la_LIBADD  = $(PLUMA_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/time
ui_files = \
	pluma-time-dialog.ui \
	pluma-time-setup-dialog.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

plugin_DATA = time.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

time_gschema_in = org.mate.pluma.plugins.time.gschema.xml.in
gsettings_SCHEMAS = $(time_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = $(ui_DATA) $(plugin_in_in_files) $(time_gschema_in) ui-a11y.suppr

CLEANFILES = $(plugin_DATA) $(gsettings_SCHEMAS_in) $(gsettings_SCHEMAS)
DISTCLEANFILES = $(plugin_in_files)

-include $(top_srcdir)/git.mk
