# Spell checker plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = 							\
	-I$(top_srcdir)						\
	$(PLUMA_CFLAGS) 					\
	$(ENCHANT_CFLAGS)					\
	$(WARN_CFLAGS)

BUILT_SOURCES = 					\
	pluma-spell-marshal.c				\
	pluma-spell-marshal.h

plugin_LTLIBRARIES = libspell.la

libspell_la_SOURCES = \
	pluma-spell-plugin.c 				\
	pluma-spell-plugin.h 				\
	pluma-spell-checker.c 				\
	pluma-spell-checker.h				\
	pluma-spell-checker-dialog.c			\
	pluma-spell-checker-dialog.h			\
	pluma-spell-checker-language.c			\
	pluma-spell-checker-language.h			\
	pluma-spell-language-dialog.c			\
	pluma-spell-language-dialog.h			\
	pluma-automatic-spell-checker.c			\
	pluma-automatic-spell-checker.h			\
	pluma-spell-utils.c				\
	pluma-spell-utils.h				\
	$(BUILT_SOURCES)			

libspell_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS) 
libspell_la_LIBADD  = $(PLUMA_LIBS) $(ENCHANT_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/spell
ui_files = spell-checker.ui languages-dialog.ui pluma-spell-setup-dialog.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

pluma-spell-marshal.h: pluma-spell-marshal.list $(GLIB_GENMARSHAL)
	$(AM_V_GEN) $(GLIB_GENMARSHAL) $< --header --prefix=pluma_marshal > $@

pluma-spell-marshal.c: pluma-spell-marshal.list $(GLIB_GENMARSHAL)
	$(AM_V_GEN) echo "#include \"pluma-spell-marshal.h\"" > $@ && \
	$(GLIB_GENMARSHAL) $< --body --prefix=pluma_marshal >> $@

plugin_in_files = spell.plugin.desktop.in
plugin_DATA = $(plugin_in_files:.plugin.desktop.in=.plugin)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

spell_gschema_in = org.mate.pluma.plugins.spell.gschema.xml.in
gsettings_SCHEMAS = $(spell_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@


EXTRA_DIST = 					\
	$(ui_DATA)				\
	$(plugin_in_files)			\
	pluma-spell-marshal.list    	        \
	$(spell_gschema_in)			\
	ui-a11y.suppr

CLEANFILES = $(BUILT_SOURCES) $(plugin_DATA) $(gsettings_SCHEMAS)

dist-hook:
	cd $(distdir); rm -f $(BUILT_SOURCES)

-include $(top_srcdir)/git.mk
