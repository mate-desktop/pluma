# Spell checker plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)

AM_CPPFLAGS = 							\
	-I$(top_srcdir)						\
	$(PLUMA_CFLAGS) 					\
	$(ENCHANT_CFLAGS)					\
	$(WARN_CFLAGS)

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
	pluma-spell-utils.h

libspell_la_LDFLAGS = $(PLUGIN_LIBTOOL_FLAGS)
libspell_la_LIBADD  = $(PLUMA_LIBS) $(ENCHANT_LIBS)

uidir = $(PLUMA_PLUGINS_DATA_DIR)/spell
ui_files = spell-checker.ui languages-dialog.ui pluma-spell-setup-dialog.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

plugin_DATA = spell.plugin
plugin_in_files = $(plugin_DATA:.plugin=.plugin.desktop.in)
plugin_in_in_files = $(plugin_in_files:.plugin.desktop.in=.plugin.desktop.in.in)

$(plugin_DATA): $(plugin_in_files)
	$(AM_V_GEN) $(MSGFMT) --keyword=Name --keyword=Description --desktop --template $< -d $(top_srcdir)/po -o $@

spell_gschema_in = org.mate.pluma.plugins.spell.gschema.xml.in
gsettings_SCHEMAS = $(spell_gschema_in:.xml.in=.xml)
@GSETTINGS_RULES@

EXTRA_DIST = 					\
	$(ui_DATA)				\
	$(plugin_in_in_files)			\
	$(spell_gschema_in)			\
	ui-a11y.suppr

CLEANFILES = $(plugin_DATA) $(gsettings_SCHEMAS)
DISTCLEANFILES = $(plugin_in_files)

-include $(top_srcdir)/git.mk
