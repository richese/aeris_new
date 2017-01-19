agent_group_src = [
  'main.cpp'
]

executable('agent-group',
  agent_group_src,
  dependencies: thread_dep,
  include_directories: global_inc,
  link_with: common_lib,
  name_suffix: 'elf',
  link_args: '-ldl',
  install: true
)
