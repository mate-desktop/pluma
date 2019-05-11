# Python Console Plugin
SUBDIRS = pythonconsole
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

plugin_in_files = pythonconsole.plugin.desktop.in
%.plugin: %.plugin.desktop.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

plugin_DATA = $(plugin_in_files:.plugin.desktop.in=.plugin)

pythonconsole_gschema_in = org.mate.pluma.plugins.pythonconsole.gschema.xml.in
gsettings_SCHEMAS = $(pythonconsole_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = \
	$(plugin_in_files) \
	$(pythonconsole_gschema_in)

CLEANFILES = \
	$(plugin_DATA) \
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

DISTCLEANFILES = \
	$(plugin_DATA) \
	$(gsettings_SCHEMAS_in)		\
	$(gsettings_SCHEMAS)

-include $(top_srcdir)/git.mk
