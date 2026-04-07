plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'spell.plugin.desktop.in.in',
  output: 'spell.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'spell.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

shared_module(
  'spell',
  sources: [
    'pluma-spell-plugin.c',
    'pluma-spell-plugin.h',
    'pluma-spell-checker.c',
    'pluma-spell-checker.h',
    'pluma-spell-checker-dialog.c',
    'pluma-spell-checker-dialog.h',
    'pluma-spell-checker-language.c',
    'pluma-spell-checker-language.h',
    'pluma-spell-language-dialog.c',
    'pluma-spell-language-dialog.h',
    'pluma-automatic-spell-checker.c',
    'pluma-automatic-spell-checker.h',
    'pluma-spell-utils.c',
    'pluma-spell-utils.h',
  ],
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps + [enchant_dep, mate_desktop_dep],
  link_with: libpluma,
  c_args: plugin_cflags,
  name_prefix: 'lib',
  install: true,
  install_dir: pluginsdir,
)

install_data(
  'spell-checker.ui',
  'languages-dialog.ui',
  'pluma-spell-setup-dialog.ui',
  install_dir: join_paths(datadir, 'pluma', 'plugins', 'spell'),
)

schema_conf = configuration_data()
schema_conf.set('GETTEXT_PACKAGE', 'pluma')
configure_file(
  input: 'org.mate.pluma.plugins.spell.gschema.xml.in',
  output: 'org.mate.pluma.plugins.spell.gschema.xml',
  configuration: schema_conf,
  install: true,
  install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)
