DIST_SUBDIRS =		\
	changecase 	\
	docinfo 	\
	externaltools	\
	filebrowser 	\
	modelines	\
	sort 		\
	spell 		\
	taglist 	\
	time		\
	trailsave

SUBDIRS = 		\
	changecase	\
	docinfo		\
	externaltools	\
	filebrowser	\
	modelines	\
	sort		\
	taglist		\
	time		\
	trailsave

# python plugins are disabled for now
#SUBDIRS      += pythonconsole snippets quickopen

if ENABLE_ENCHANT
SUBDIRS      += spell
endif

-include $(top_srcdir)/git.mk
