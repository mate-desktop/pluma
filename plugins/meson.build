plugin_cflags = [
  '-I' + meson.project_source_root(),
  '-I' + meson.project_source_root() / 'pluma',
]

subdir('docinfo')
subdir('externaltools')
subdir('filebrowser')
subdir('modelines')
subdir('pythonconsole')
subdir('quickopen')
subdir('snippets')
subdir('sort')
subdir('taglist')
subdir('time')
subdir('trailsave')
if have_enchant
  subdir('spell')
endif
