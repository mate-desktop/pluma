plugin_conf = configuration_data()
plugin_conf.set('PACKAGE_URL', 'https://github.com/mate-desktop/pluma')

plugin_in = configure_file(
  input: 'taglist.plugin.desktop.in.in',
  output: 'taglist.plugin.desktop.in',
  configuration: plugin_conf,
)
i18n.merge_file(
  input: plugin_in,
  output: 'taglist.plugin',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  type: 'desktop',
  install: true,
  install_dir: pluginsdir,
)

shared_module(
  'taglist',
  sources: [
    'pluma-taglist-plugin-parser.c',
    'pluma-taglist-plugin-parser.h',
    'pluma-taglist-plugin-panel.c',
    'pluma-taglist-plugin-panel.h',
    'pluma-taglist-plugin.c',
    'pluma-taglist-plugin.h',
  ],
  include_directories: [root_inc, pluma_inc],
  dependencies: pluma_deps,
  link_with: libpluma,
  c_args: plugin_cflags,
  name_prefix: 'lib',
  install: true,
  install_dir: pluginsdir,
)

taglist_files = [
  'HTML.tags.xml.in',
  'Latex.tags.xml.in',
  'XSLT.tags.xml.in',
  'XUL.tags.xml.in',
]

gzip = find_program('gzip')
foreach tf : taglist_files
  stem = tf.replace('.tags.xml.in', '')
  xml_translated = i18n.merge_file(
    input: tf,
    output: stem + '.tags.xml',
    type: 'xml',
    po_dir: join_paths(meson.project_source_root(), 'po'),
    data_dirs: [meson.project_source_root()],
  )
  tags_gz = custom_target(
    stem + '.tags.gz',
    input: xml_translated,
    output: stem + '.tags.gz',
    command: [gzip, '-9', '-n', '-c', '@INPUT@'],
    capture: true,
    build_by_default: true,
    install: true,
    install_dir: join_paths(datadir, 'pluma', 'plugins', 'taglist'),
  )
endforeach
