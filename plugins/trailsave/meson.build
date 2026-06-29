plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'trailsave.plugin.desktop.in.in',
  output: 'trailsave.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'trailsave.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

shared_module(
  'trailsave',
  sources: [
    'pluma-trail-save-plugin.c',
    'pluma-trail-save-plugin.h',
  ],
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps,
  link_with: libpluma,
  c_args: plugin_cflags,
  name_prefix: 'lib',
  install: true,
  install_dir: pluginsdir,
)
