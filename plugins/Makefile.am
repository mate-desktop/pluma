DIST_SUBDIRS =		\
	changecase 	\
	docinfo 	\
	externaltools	\
	filebrowser 	\
	modelines	\
	pythonconsole	\
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
	pythonconsole	\
	sort		\
	taglist		\
	time		\
	trailsave

# python plugins are disabled for now
#SUBDIRS      += snippets quickopen

if ENABLE_ENCHANT
SUBDIRS      += spell
endif

-include $(top_srcdir)/git.mk
