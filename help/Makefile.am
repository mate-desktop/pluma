@YELP_HELP_RULES@
 
HELP_ID = pluma
HELP_FILES = index.docbook legal.xml
HELP_MEDIA = \
	figures/pluma_recent_files_menu_icon.png	\
	figures/pluma_window.png	

# Add linguas to be ignored, e.g. IGNORE_HELP_LINGUAS = ca de es fr
IGNORE_HELP_LINGUAS =
HELP_LINGUAS = $(if $(IGNORE_HELP_LINGUAS), \
	$(filter-out $(IGNORE_HELP_LINGUAS),$(subst /,,$(dir $(wildcard */*.po)))), \
	$(subst /,,$(dir $(wildcard */*.po))) )

-include $(top_srcdir)/git.mk
