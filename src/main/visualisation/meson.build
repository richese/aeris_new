visualisation_src = [
  'main.cpp',
  'visualisation_agent.cpp',
  'visualisation/visualisation.cpp'
]

executable('visualisation',
  visualisation_src,
  dependencies: [thread_dep, glut_dep, glu_dep],
  link_with: common_lib,
  name_suffix: 'elf'
)
