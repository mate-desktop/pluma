plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'modelines.plugin.desktop.in.in',
  output: 'modelines.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'modelines.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

shared_module(
  'modelines',
  sources: [
    'pluma-modeline-plugin.c',
    'pluma-modeline-plugin.h',
    'modeline-parser.c',
    'modeline-parser.h',
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
  'language-mappings',
  install_dir: join_paths(datadir, 'pluma', 'plugins', 'modelines'),
)
