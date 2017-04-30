opencv_dep = dependency('opencv', version: '>=3.1.0', required: false)

camera_src = [
  'detector.cpp',
  'main_tracking.cpp',
  'robot_tracking.cpp',
  'segmentation.cpp',
  'tracking.cpp'
]

if opencv_dep.found()

  executable('svm-training',
    'svm_training.cpp',
    dependencies: [thread_dep, opencv_dep],
    include_directories: global_inc,
    link_with: common_lib,
    name_suffix: 'elf',
    install: true
  )

  executable('robot-tracking',
    camera_src,
    dependencies: [thread_dep, opencv_dep],
    include_directories: global_inc,
    link_with: common_lib,
    name_suffix: 'elf',
    install: true
  )

else
  message('OpenCV not found. Disabling robot tracking.')
endif
