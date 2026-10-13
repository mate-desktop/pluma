libdialogs_sources = [
  'pluma-preferences-dialog.c',
  'pluma-close-confirmation-dialog.c',
  'pluma-encodings-dialog.c',
  'pluma-search-dialog.c',
]

libdialogs_inc = include_directories('.')

libdialogs = static_library(
  'dialogs',
  sources: libdialogs_sources,
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps,
  c_args: ['-DPLUMA_DATADIR="@0@"'.format(pkgdatadir)],
  install: false,
)

install_data(
  'pluma-encodings-dialog.ui',
  'pluma-preferences-dialog.ui',
  'pluma-search-dialog.ui',
  install_dir: join_paths(pkgdatadir, 'ui'),
)
