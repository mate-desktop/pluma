project(
  'pluma', 'c',
  version: '1.28.1',
  meson_version: '>= 0.61.2',
  license: 'GPL2',
  default_options: ['warning_level=1', 'buildtype=debugoptimized', 'c_std=gnu11'],
)

gnome = import('gnome')
i18n = import('i18n')
cc = meson.get_compiler('c')

version_arr = meson.project_version().split('.')
pluma_major_version = version_arr[0].to_int()
pluma_minor_version = version_arr[1].to_int()
pluma_micro_version = version_arr[2].to_int()

prefix      = get_option('prefix')
bindir      = join_paths(prefix, get_option('bindir'))
libdir      = join_paths(prefix, get_option('libdir'))
datadir     = join_paths(prefix, get_option('datadir'))
includedir  = join_paths(prefix, get_option('includedir'))
libexecdir  = join_paths(prefix, get_option('libexecdir'))
localedir   = join_paths(prefix, get_option('localedir'))
pkgdatadir  = join_paths(datadir, 'pluma')
pkglibdir   = join_paths(libdir, 'pluma')
pluginsdir  = join_paths(pkglibdir, 'plugins')

config_h = configuration_data()
config_h.set_quoted('PACKAGE',      'pluma')
config_h.set_quoted('PACKAGE_URL',  'https://github.com/mate-desktop/pluma')
config_h.set_quoted('VERSION',      meson.project_version())
config_h.set_quoted('GETTEXT_PACKAGE', 'pluma')
config_h.set_quoted('DATADIR',      datadir)
config_h.set_quoted('PLUMA_DATADIR', pkgdatadir)
config_h.set_quoted('LIBDIR',       libdir)
config_h.set_quoted('PLUMA_LIBDIR', pkglibdir)
config_h.set_quoted('PLUMA_LOCALEDIR', localedir)
config_h.set('PLUMA_MAJOR_VERSION', pluma_major_version)
config_h.set('PLUMA_MINOR_VERSION', pluma_minor_version)
config_h.set('PLUMA_MICRO_VERSION', pluma_micro_version)

add_project_arguments('-DHAVE_CONFIG_H', language: 'c')
add_project_arguments('-I' + meson.project_build_root(), language: 'c')

if get_option('gvfs-metadata')
  config_h.set('ENABLE_GVFS_METADATA', 1)
endif

# Required dependencies
libxml_dep        = dependency('libxml-2.0',        version: '>= 2.5.0')
glib_dep          = dependency('glib-2.0',          version: '>= 2.50.0')
gmodule_dep       = dependency('gmodule-2.0',       required: false)
gthread_dep       = dependency('gthread-2.0',       version: '>= 2.13.0')
gio_dep           = dependency('gio-2.0',           version: '>= 2.50.0')
gtk_dep           = dependency('gtk+-3.0',          version: '>= 3.22.0')
gtksourceview_dep = dependency('gtksourceview-4',   version: '>= 4.0.2')
libpeas_dep       = dependency('libpeas-1.0',       version: '>= 1.2.0')
libpeas_gtk_dep   = dependency('libpeas-gtk-1.0',   version: '>= 1.2.0')
mate_desktop_dep  = dependency('mate-desktop-2.0',  version: '>= 1.27.1')
x11_dep           = dependency('x11')
sm_dep            = dependency('sm',                version: '>= 1.0.0')
ice_dep           = dependency('ice',               version: '>= 1.0.0')
m_dep             = cc.find_library('m', required: false)

mate_submodules_dep = dependency('mate-submodules', version: '1.24.0',
  fallback: ['mate-submodules', 'mate_submodules_dep'])

pluma_deps = [
  libxml_dep,
  glib_dep,
  gthread_dep,
  gio_dep,
  gtk_dep,
  gtksourceview_dep,
  libpeas_dep,
  libpeas_gtk_dep,
  mate_desktop_dep,
  x11_dep,
]
if m_dep.found()
  pluma_deps += [m_dep]
endif
if gmodule_dep.found()
  pluma_deps += [gmodule_dep]
endif

# Optional: GObject Introspection
have_introspection = false
gobject_introspection_dep = dependency('gobject-introspection-1.0',
  version: '>= 0.9.3',
  required: get_option('introspection'))
if gobject_introspection_dep.found()
  have_introspection = true
  config_h.set('HAVE_INTROSPECTION', 1)
endif

# Optional: Spell plugin (enchant + iso-codes)
have_enchant = false
if get_option('spell')
  enchant_dep = dependency('enchant-2', version: '>= 1.6.0', required: false)
  if not enchant_dep.found()
    enchant_dep = dependency('enchant', version: '>= 1.6.0', required: false)
  endif
  if enchant_dep.found()
    iso_codes_dep = dependency('iso-codes', version: '>= 0.35', required: false)
    if iso_codes_dep.found()
      have_enchant = true
      config_h.set('HAVE_ISO_CODES', 1)
      config_h.set_quoted('ISO_CODES_PREFIX',
        iso_codes_dep.get_variable(pkgconfig: 'prefix'))
    else
      error('iso-codes is required for spell plugin. Use -Dspell=false to disable.')
    endif
  endif
endif

configure_file(output: 'config.h', configuration: config_h)

root_inc = include_directories('.')

subdir('pluma')
subdir('data')
subdir('po')
subdir('plugins')
subdir('help')
if get_option('tests')
  subdir('tests')
endif

gnome.post_install(
  glib_compile_schemas: true,
  update_desktop_database: find_program('update-desktop-database', required: false).found(),
)

summary({
  'GObject introspection': have_introspection,
  'Spell checking':        have_enchant,
  'GVFS metadata':         get_option('gvfs-metadata'),
  'Tests':                 get_option('tests'),
})
