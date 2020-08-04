# Terminal Plugin

plugindir = $(PLUMA_PLUGINS_LIBS_DIR)
plugin_PYTHON =		\
	terminal.py

plugin_in_files = terminal.plugin.desktop.in
plugin_DATA = $(plugin_in_files:.plugin.desktop.in=.plugin)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

terminal_gschema_in = org.mate.pluma.plugins.terminal.gschema.xml.in
gsettings_SCHEMAS = $(terminal_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = \
	$(plugin_in_files) \
	$(terminal_gschema_in)

CLEANFILES = \
	$(plugin_DATA) \
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

DISTCLEANFILES = \
	$(plugin_DATA) \
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

-include $(top_srcdir)/git.mk
