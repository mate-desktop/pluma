uidir = $(datadir)/pluma/ui/

AM_CPPFLAGS = 							\
	-I$(top_srcdir)						\
	-I$(top_builddir)					\
	-I$(top_srcdir)/pluma 					\
	-I$(top_builddir)/pluma					\
	$(PLUMA_CFLAGS) 					\
	$(WARN_CFLAGS)						\
	$(DISABLE_DEPRECATED_CFLAGS)

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

if WITH_GTK3
ui_DATA =					\
	pluma-encodings-dialog.ui		\
	pluma-preferences-dialog.ui		\
	pluma-search-dialog-gtk3.ui
else
ui_DATA =					\
	pluma-encodings-dialog.ui		\
	pluma-preferences-dialog.ui		\
	pluma-search-dialog.ui
endif

EXTRA_DIST = $(ui_DATA)

-include $(top_srcdir)/git.mk
