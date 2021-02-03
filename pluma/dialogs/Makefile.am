uidir = $(datadir)/pluma/ui/

AM_CPPFLAGS = 					\
	-I$(top_srcdir)				\
	-I$(top_builddir)			\
	-I$(top_srcdir)/pluma 			\
	-I$(top_builddir)/pluma			\
	$(PLUMA_CFLAGS) 			\
	$(WARN_CFLAGS)				\
	-DPLUMA_DATADIR=\""$(datadir)/pluma"\"

noinst_LTLIBRARIES = libdialogs.la

libdialogs_la_SOURCES = 			\
	pluma-preferences-dialog.h		\
	pluma-preferences-dialog.c		\
	pluma-close-confirmation-dialog.c 	\
	pluma-close-confirmation-dialog.h 	\
	pluma-encodings-dialog.c		\
	pluma-encodings-dialog.h		\
	pluma-search-dialog.h			\
	pluma-search-dialog.c

ui_files =					\
	pluma-encodings-dialog.ui		\
	pluma-preferences-dialog.ui		\
	pluma-search-dialog.ui

include $(top_srcdir)/gla11y.mk

ui_DATA = $(ui_files)

EXTRA_DIST = $(ui_DATA) ui-a11y.suppr

-include $(top_srcdir)/git.mk
