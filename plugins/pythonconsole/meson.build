subdir('pythonconsole')

plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'pythonconsole.plugin.desktop.in.in',
  output: 'pythonconsole.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'pythonconsole.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

schema_conf = configuration_data()
schema_conf.set('GETTEXT_PACKAGE', 'pluma')
configure_file(
  input: 'org.mate.pluma.plugins.pythonconsole.gschema.xml.in',
  output: 'org.mate.pluma.plugins.pythonconsole.gschema.xml',
  configuration: schema_conf,
  install: true,
  install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)
