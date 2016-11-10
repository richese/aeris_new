project(
  'Aeris main',
  'cpp',
  default_options: ['cpp_std=c++11'],
  license: 'MIT'
)

thread_dep = dependency('threads')
glut_dep = dependency('freeglut', required: false)
glu_dep = dependency('glu', required: false)

add_global_arguments('-Wextra', '-pedantic', language : 'cpp')

subdir('common')

subdir('agent_test')
subdir('ant')
subdir('arena')
subdir('base')
subdir('border')
subdir('food')
subdir('line')
subdir('pheromone')
subdir('server')

if glut_dep.found() and glu_dep.found()
  subdir('visualisation')
endif

