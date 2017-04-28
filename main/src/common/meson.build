common_src = [
  'agent_body.cpp',
  'agent_group.cpp',
  'agent_server.cpp',
  'agent.cpp',
  'agent_client.cpp',
  'config.cpp',
  'plugin.cpp',
  'plugin_init.cpp',
  'signals.cpp',
  'socket.cpp',
  'timing.cpp'
]

common_deps = [
  thread_dep
]


common_lib = static_library('common',
  common_src,
  dependencies: common_deps,
  include_directories: global_inc,
  link_args: '-ldl'
)


# Visualisation dependencies
#xorg_dep = dependency('xorg-server', required: false)
#freeglut_dep = dependency('freeglut', required: false)
#glu_dep = dependency('glu', required: false)

#if xorg_dep.found() and freeglut_dep.found() and glu_dep.found()
#  add_global_arguments('-DBUILD_VISUALISATION', language: 'cpp')
#  common_src += ['visualisation_agent.cpp']
#  common_deps += [xorg_dep, freeglut_dep, glu_dep]
#endif
