vis_is_build = false
vis_dependencies = [common_deps]
vis_link = []

vis_glu_dep = dependency('glu', required: false)
vis_glut_dep = dependency('freeglut', required: false)

if vis_glu_dep.found()
  vis_is_build = true
  vis_dependencies += [ vis_glu_dep ]

  if vis_glut_dep.found()
    vis_dependencies += [ vis_glut_dep ]
  else
    # Ubuntu for some reason does not provide pkg-config file for glut
    vis_link += '-lglut'
  endif
endif


if vis_is_build == true
  shared_library('visualisation',
    ['plugin.cpp', 'visualisation_agent.cpp'],
    dependencies: vis_dependencies,
    include_directories: global_inc,
    link_with: common_lib,
    link_args: vis_link,
    install: true,
    install_dir: 'lib'
  )
else
  message('Disabling visualisation plugin because of missing dependencies (glu, freeglut).')
endif
