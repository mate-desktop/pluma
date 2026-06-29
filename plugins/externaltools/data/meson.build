tool_files = [
  'build',
  'open-terminal-here',
  'remove-trailing-spaces',
  'run-command',
  'search-recursive',
  'switch-c',
]

tool_merge = find_program('perl')
merge_script = join_paths(meson.project_source_root(), 'plugins', 'externaltools', 'scripts', 'pluma-tool-merge.pl')

tool_targets = []
foreach t : tool_files
  desktop_in = t + '.desktop.in'
  desktop = i18n.merge_file(
    input: desktop_in,
    output: t + '.desktop',
    po_dir: join_paths(meson.project_source_root(), 'po'),
    type: 'desktop',
  )

  tool_target = custom_target(
    t,
    input: [t + '.tool.in', desktop],
    output: t,
    command: [tool_merge, merge_script, '-o', '@OUTPUT@', '@INPUT0@', '@INPUT1@'],
    install: true,
    install_dir: join_paths(datadir, 'pluma', 'plugins', 'externaltools', 'tools'),
  )
  tool_targets += [tool_target]
endforeach
