plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'time.plugin.desktop.in.in',
  output: 'time.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'time.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

shared_module(
  'time',
  sources: [
    'pluma-time-plugin.c',
    'pluma-time-plugin.h',
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
  'pluma-time-dialog.ui',
  'pluma-time-setup-dialog.ui',
  install_dir: join_paths(datadir, 'pluma', 'plugins', 'time'),
)

schema_conf = configuration_data()
schema_conf.set('GETTEXT_PACKAGE', 'pluma')
configure_file(
  input: 'org.mate.pluma.plugins.time.gschema.xml.in',
  output: 'org.mate.pluma.plugins.time.gschema.xml',
  configuration: schema_conf,
  install: true,
  install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)
