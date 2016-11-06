DIST_SUBDIRS =		\
	changecase 	\
	docinfo 	\
	externaltools	\
	filebrowser 	\
	modelines	\
	pythonconsole	\
	quickopen	\
	snippets	\
	sort 		\
	spell 		\
	taglist 	\
	time		\
	trailsave

SUBDIRS = 		\
	changecase	\
	docinfo		\
	filebrowser	\
	modelines	\
	sort		\
	taglist		\
	time		\
	trailsave

# python plugins are disabled for now
#SUBDIRS      += externaltools pythonconsole snippets quickopen

if ENABLE_ENCHANT
SUBDIRS      += spell
endif

-include $(top_srcdir)/git.mk
