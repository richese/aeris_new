server_src = [
  'main.cpp'
]

executable('server',
  server_src,
  dependencies: thread_dep,
  include_directories: global_inc,
  link_with: common_lib,
  name_suffix: 'elf',
  install: true
)
