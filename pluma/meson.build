pluma_enum_types = gnome.mkenums_simple(
  'pluma-enum-types',
  sources: [
    'pluma-app-activatable.h',
    'pluma-app.h',
    'pluma-application.h',
    'pluma-commands.h',
    'pluma-debug.h',
    'pluma-document.h',
    'pluma-encodings.h',
    'pluma-encodings-combo-box.h',
    'pluma-help.h',
    'pluma-message-bus.h',
    'pluma-message-type.h',
    'pluma-message.h',
    'pluma-notebook.h',
    'pluma-panel.h',
    'pluma-progress-message-area.h',
    'pluma-statusbar.h',
    'pluma-status-combo-box.h',
    'pluma-tab.h',
    'pluma-utils.h',
    'pluma-view.h',
    'pluma-view-activatable.h',
    'pluma-window.h',
    'pluma-window-activatable.h',
  ],
  install_header: false,
)

libpluma_c_files = [
  'pluma-app.c',
  'pluma-app-activatable.c',
  'pluma-application.c',
  'pluma-close-button.c',
  'pluma-commands-documents.c',
  'pluma-commands-edit.c',
  'pluma-commands-file.c',
  'pluma-commands-file-print.c',
  'pluma-commands-help.c',
  'pluma-commands-search.c',
  'pluma-commands-view.c',
  'pluma-debug.c',
  'pluma-dirs.c',
  'pluma-document.c',
  'pluma-document-input-stream.c',
  'pluma-document-loader.c',
  'pluma-document-output-stream.c',
  'pluma-document-saver.c',
  'pluma-documents-panel.c',
  'pluma-encodings.c',
  'pluma-encodings-combo-box.c',
  'pluma-file-chooser-dialog.c',
  'pluma-help.c',
  'pluma-history-entry.c',
  'pluma-io-error-message-area.c',
  'pluma-language-manager.c',
  'pluma-message-bus.c',
  'pluma-message-type.c',
  'pluma-message.c',
  'pluma-notebook.c',
  'pluma-panel.c',
  'pluma-pango.c',
  'pluma-plugins-engine.c',
  'pluma-print-job.c',
  'pluma-print-preview.c',
  'pluma-progress-message-area.c',
  'pluma-session.c',
  'pluma-settings.c',
  'pluma-smart-charset-converter.c',
  'pluma-statusbar.c',
  'pluma-status-combo-box.c',
  'pluma-style-scheme-manager.c',
  'pluma-tab.c',
  'pluma-tab-label.c',
  'pluma-utils.c',
  'pluma-view.c',
  'pluma-view-activatable.c',
  'pluma-window.c',
  'pluma-window-activatable.c',
  'plumatextregion.c',
  'bacon-message-connection.c',
]

libpluma_inst_headers = [
  'pluma-app.h',
  'pluma-app-activatable.h',
  'pluma-application.h',
  'pluma-commands.h',
  'pluma-debug.h',
  'pluma-document.h',
  'pluma-encodings.h',
  'pluma-encodings-combo-box.h',
  'pluma-help.h',
  'pluma-message-bus.h',
  'pluma-message-type.h',
  'pluma-message.h',
  'pluma-notebook.h',
  'pluma-panel.h',
  'pluma-progress-message-area.h',
  'pluma-statusbar.h',
  'pluma-status-combo-box.h',
  'pluma-tab.h',
  'pluma-utils.h',
  'pluma-view.h',
  'pluma-view-activatable.h',
  'pluma-window.h',
  'pluma-window-activatable.h',
]

if not get_option('gvfs-metadata')
  libpluma_c_files += ['pluma-metadata-manager.c']
  libpluma_inst_headers += ['pluma-metadata-manager.h']
endif

install_headers(libpluma_inst_headers, subdir: 'pluma')

pluma_inc = include_directories('.')
pluma_dialogs_inc = include_directories('dialogs')

subdir('dialogs')

pluma_cflags = [
  '-I' + meson.current_source_dir(),
  '-DDATADIR="@0@"'.format(datadir),
  '-DPLUMA_DATADIR="@0@"'.format(pkgdatadir),
  '-DPLUMA_LOCALEDIR="@0@"'.format(localedir),
  '-DLIBDIR="@0@"'.format(libdir),
  '-DPLUMA_LIBDIR="@0@"'.format(pkglibdir),
]

libpluma = static_library(
  'pluma',
  sources: libpluma_c_files + pluma_enum_types,
  include_directories: [root_inc, pluma_inc, pluma_dialogs_inc],
  dependencies: pluma_deps + [mate_submodules_dep],
  link_with: [libdialogs],
  c_args: pluma_cflags,
  install: false,
)

pluma_bin = executable(
  'pluma',
  sources: 'pluma.c',
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps + [mate_submodules_dep],
  link_with: libpluma,
  c_args: pluma_cflags,
  export_dynamic: true,
  install: true,
  install_dir: bindir,
)

install_data(
  'pluma.about',
  install_dir: pkgdatadir,
)
install_data(
  'pluma-ui.xml',
  'pluma-print-preferences.ui',
  install_dir: join_paths(pkgdatadir, 'ui'),
)

if have_introspection
  pluma_gir = gnome.generate_gir(
    pluma_bin,
    sources: libpluma_inst_headers + libpluma_c_files + pluma_enum_types,
    namespace: 'Pluma',
    nsversion: '1.0',
    symbol_prefix: 'pluma',
    identifier_prefix: 'Pluma',
    export_packages: 'pluma',
    includes: ['GObject-2.0', 'Gtk-3.0', 'GtkSource-4'],
    extra_args: ['--warn-all', '-I' + meson.current_source_dir()],
    install: true,
    install_dir_gir: join_paths(datadir, 'gir-1.0'),
    install_dir_typelib: join_paths(libdir, 'girepository-1.0'),
  )
endif
