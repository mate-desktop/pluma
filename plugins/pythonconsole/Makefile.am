# Python Console Plugin
SUBDIRS = pythonconsole
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

plugin_DATA = pythonconsole.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

pythonconsole_gschema_in = org.mate.pluma.plugins.pythonconsole.gschema.xml.in
gsettings_SCHEMAS = $(pythonconsole_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = \
	$(plugin_in_in_files)		\
	$(pythonconsole_gschema_in)

CLEANFILES = \
	$(plugin_DATA)			\
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

DISTCLEANFILES = \
	$(plugin_in_files)		\
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

-include $(top_srcdir)/git.mk
