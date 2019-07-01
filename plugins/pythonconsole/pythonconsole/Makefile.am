# Python console plugin

plugindir = $(PLUMA_PLUGINS_LIBS_DIR)/pythonconsole
plugin_PYTHON =		\
	__init__.py	\
	console.py	\
	config.py

uidir = $(PLUMA_PLUGINS_DATA_DIR)/pythonconsole/ui
ui_files = config.ui
include $(top_srcdir)/gla11y.mk
ui_DATA = $(ui_files)

EXTRA_DIST = $(ui_DATA) ui-a11y.suppr

CLEANFILES =
DISTCLEANFILES =

-include $(top_srcdir)/git.mk
