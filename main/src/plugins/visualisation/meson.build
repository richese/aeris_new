vis_glu_dep = dependency('glu', reguired: false)
vis_glut_dep = dependency('freeglut', required: false)

if vis_glut_dep.found()

  shared_library('visualisation',
    ['plugin.cpp', 'visualisation_agent.cpp'],
    dependencies: [common_deps, vis_glu_dep, vis_glut_dep],
    include_directories: global_inc,
    link_with: common_lib,
    install: true,
    install_dir: 'lib'
  )

elif vis_glu_dep.found()

  # Ubuntu for some reason does not provide pkg-config file for glut
  shared_library('visualisation',
    ['plugin.cpp', 'visualisation_agent.cpp'],
    dependencies: [common_deps, vis_glu_dep],
    include_directories: global_inc,
    link_with: common_lib,
    link_args: '-lglut',
    install: true,
    install_dir: 'lib'
  )

endif
