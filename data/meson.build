desktop_conf = configuration_data()
desktop_conf.set('VERSION', meson.project_version())
desktop_conf.set('FULL_LIBEXECDIR', join_paths(libexecdir, 'pluma'))
desktop_in = configure_file(
  input: 'pluma.desktop.in.in',
  output: 'pluma.desktop.in',
  configuration: desktop_conf,
)
i18n.merge_file(
  input: desktop_in,
  output: 'pluma.desktop',
  type: 'desktop',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  install: true,
  install_dir: join_paths(datadir, 'applications'),
)

appdata_conf = configuration_data()
appdata_conf.set('VERSION', meson.project_version())
appdata_in = configure_file(
  input: 'pluma.appdata.xml.in.in',
  output: 'pluma.appdata.xml.in',
  configuration: appdata_conf,
)
i18n.merge_file(
  input: appdata_in,
  output: 'pluma.appdata.xml',
  type: 'xml',
  po_dir: join_paths(meson.project_source_root(), 'po'),
  install: true,
  install_dir: join_paths(datadir, 'metainfo'),
)

schema_conf = configuration_data()
schema_conf.set('GETTEXT_PACKAGE', 'pluma')
schema_conf.set('TOOLBAR_STYLE',   'PLUMA_TOOLBAR_SYSTEM')
schema_xml = configure_file(
  input: 'org.mate.pluma.gschema.xml.in',
  output: 'org.mate.pluma.gschema.xml',
  configuration: schema_conf,
  install: true,
  install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)

glib_compile_schemas = find_program('glib-compile-schemas')
gsettings_schema_builddir = meson.current_build_dir()
gsettings_schema_target = custom_target(
  'gsettings-schema-compiled',
  output: 'gschemas.compiled',
  input: schema_xml,
  command: [glib_compile_schemas, '--targetdir', gsettings_schema_builddir, gsettings_schema_builddir],
  build_by_default: true,
)

install_man('pluma.1')

pluma_pc_conf = configuration_data()
pluma_pc_conf.set('prefix',      prefix)
pluma_pc_conf.set('exec_prefix', '${prefix}')
pluma_pc_conf.set('libdir',      libdir)
pluma_pc_conf.set('includedir',  includedir)
pluma_pc_conf.set('VERSION',     meson.project_version())
configure_file(
  input: 'pluma.pc.in',
  output: 'pluma.pc',
  configuration: pluma_pc_conf,
  install: true,
  install_dir: join_paths(libdir, 'pkgconfig'),
)

bugreport_conf = configuration_data()
bugreport_conf.set('libexecdir', libexecdir)
configure_file(
  input: 'pluma-bugreport.sh.in',
  output: 'pluma-bugreport.sh',
  configuration: bugreport_conf,
  install: true,
  install_dir: join_paths(libexecdir, 'pluma'),
  install_mode: 'rwxr-xr-x',
)
