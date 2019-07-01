# Python snippets plugin
plugindir = $(PLUMA_PLUGINS_LIBS_DIR)/snippets

plugin_PYTHON = \
	__init__.py \
	WindowHelper.py \
	Document.py \
	Library.py \
	Snippet.py \
	Parser.py \
	Placeholder.py \
	Manager.py \
	Helper.py \
	SubstitutionParser.py \
	Importer.py \
	Exporter.py \
	LanguageManager.py \
	Completion.py \
	comment.py

uidir = $(PLUMA_PLUGINS_DATA_DIR)/snippets/ui
ui_files = snippets.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

EXTRA_DIST = $(ui_DATA) ui-a11y.suppr

CLEANFILES = *.bak *.gladep *.pyc
DISTCLEANFILES = *.bak *.gladep *.pyc

-include $(top_srcdir)/git.mk
