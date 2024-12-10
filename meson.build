project('OPTIMIZMate', 'cpp', default_options : ['cpp_std=c++20'])

incdir = [include_directories('src')]

if get_option('b_sanitize') != ''
  header_only = true
endif

catch_dep = dependency('catch2-with-main', include_type: 'system')
plot_dep = [
    dependency('imgui', include_type: 'system'),
    dependency('implot', include_type: 'system'),
    dependency('SDL2', include_type: 'system'),
    dependency('OpenGL', include_type: 'system'),
]
dependencies = [
    plot_dep,
    catch_dep
]

test_dir = 'test'
src_dir = 'src'

src_app_files = [
    src_dir / 'xyz.cpp',
]

src_all_app_files = src_app_files + [src_dir / 'main.cpp']

src_test_files = {
    'test_xyz.cpp' : src_app_files,
}

foreach test_file, src_files: src_test_files
  test_path = test_dir / test_file
  src_path = []
  foreach file: src_files
    src_path += [file]
  endforeach

  exe = executable(test_file, sources : [test_path] + src_path,
      include_directories : incdir,
      cpp_args : [],
      dependencies : dependencies)
  test(test_file, exe, timeout: 0)
endforeach

exe_name = 'xyz'
executable(exe_name, sources : src_all_app_files, include_directories : incdir, dependencies : dependencies)
