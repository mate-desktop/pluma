desktopdir          = $(datadir)/applications
desktop_DATA        = pluma.desktop
desktop_in_files    = $(desktop_DATA:.desktop=.desktop.in)
desktop_in_in_files = $(desktop_in_files:.desktop.in=.desktop.in.in)
$(desktop_DATA): $(desktop_in_files)
	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@

appdatadir = $(datadir)/metainfo
appdata_DATA = pluma.appdata.xml
appdata_in_files = $(appdata_DATA:.appdata.xml=.appdata.xml.in)
appdata_in_in_files = $(appdata_in_files:.appdata.xml.in=.appdata.xml.in.in)
$(appdata_DATA): $(appdata_in_files)
	$(AM_V_GEN) GETTEXTDATADIRS=$(top_srcdir) $(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $@

gsettings_SCHEMAS = org.mate.pluma.gschema.xml
@GSETTINGS_RULES@

man_MANS = pluma.1

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = pluma.pc

bugreportdir = $(libexecdir)/pluma
bugreport_SCRIPTS = pluma-bugreport.sh

EXTRA_DIST = 			\
	$(appdata_in_in_files)	\
	$(desktop_in_in_files)	\
	$(man_MANS)		\
	pluma.pc.in		\
	pluma-bugreport.sh.in

CLEANFILES =	 		\
	$(appdata_DATA)		\
	$(desktop_DATA)		\
	$(gsettings_SCHEMAS)	\
	$(pkgconfig_DATA)

DISTCLEANFILES =		\
	$(appdata_in_files)	\
	$(desktop_in_files)


-include $(top_srcdir)/git.mk
