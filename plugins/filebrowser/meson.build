plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'filebrowser.plugin.desktop.in.in',
  output: 'filebrowser.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'filebrowser.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

filebrowser_enum_headers = files(
  'pluma-file-bookmarks-store.h',
  'pluma-file-browser-store.h',
  'pluma-file-browser-view.h',
  'pluma-file-browser-widget.h',
  'pluma-file-browser-error.h',
  'pluma-file-browser-utils.h',
  'pluma-file-browser-plugin.h',
  'pluma-file-browser-messages.h',
)

glib_mkenums = find_program('glib-mkenums')

filebrowser_enum_types_h = custom_target(
  'pluma-file-browser-enum-types.h',
  input: filebrowser_enum_headers,
  output: 'pluma-file-browser-enum-types.h',
  command: [
    glib_mkenums,
    '--template', meson.current_source_dir() / 'pluma-file-browser-enum-types.h.template',
    '@INPUT@',
  ],
  capture: true,
)

filebrowser_enum_types_c_part = custom_target(
  'pluma-file-browser-enum-types.c.part',
  input: filebrowser_enum_headers,
  output: 'pluma-file-browser-enum-types.c.part',
  command: [
    glib_mkenums,
    '--template', meson.current_source_dir() / 'pluma-file-browser-enum-types.c.template',
    '@INPUT@',
  ],
  capture: true,
)

filebrowser_enum_register_c_part = custom_target(
  'pluma-file-browser-enum-register.c.part',
  input: filebrowser_enum_headers,
  output: 'pluma-file-browser-enum-register.c.part',
  command: [
    glib_mkenums,
    '--template', meson.current_source_dir() / 'pluma-file-browser-enum-register.c.template',
    '@INPUT@',
  ],
  capture: true,
)

filebrowser_enum_types_c = custom_target(
  'pluma-file-browser-enum-types.c',
  input: [filebrowser_enum_types_c_part, filebrowser_enum_register_c_part],
  output: 'pluma-file-browser-enum-types.c',
  command: ['cat', '@INPUT@'],
  capture: true,
)

shared_module(
  'filebrowser',
  sources: [
    filebrowser_enum_types_h,
    filebrowser_enum_types_c,
    'pluma-file-bookmarks-store.c',
    'pluma-file-browser-store.c',
    'pluma-file-browser-view.c',
    'pluma-file-browser-widget.c',
    'pluma-file-browser-utils.c',
    'pluma-file-browser-plugin.c',
    'pluma-file-browser-messages.c',
  ],
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps,
  link_with: libpluma,
  c_args: plugin_cflags,
  name_prefix: 'lib',
  install: true,
  install_dir: pluginsdir,
)

install_data(
  'pluma-file-browser-widget-ui.xml',
  install_dir: join_paths(datadir, 'pluma', 'plugins', 'filebrowser'),
)

schema_conf = configuration_data()
schema_conf.set('GETTEXT_PACKAGE', 'pluma')
configure_file(
  input: 'org.mate.pluma.plugins.filebrowser.gschema.xml.in',
  output: 'org.mate.pluma.plugins.filebrowser.gschema.xml',
  configuration: schema_conf,
  install: true,
  install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)
