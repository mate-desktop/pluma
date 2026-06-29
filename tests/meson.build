test_targets = {
  'smart-converter':        'smart-converter.c',
  'document-input-stream':  'document-input-stream.c',
  'document-output-stream': 'document-output-stream.c',
  'document-loader':        'document-loader.c',
  'document-saver':         'document-saver.c',
}

test_env = environment()
test_env.set('GSETTINGS_SCHEMA_DIR', gsettings_schema_builddir)

foreach t, src : test_targets
  test_exe = executable(
    t,
    sources: src,
    include_directories: [root_inc, pluma_inc],
    dependencies: pluma_deps,
    link_with: libpluma,
    c_args: pluma_cflags,
  )
  test(
    t,
    test_exe,
    env: test_env,
    depends: gsettings_schema_target,
  )
endforeach
