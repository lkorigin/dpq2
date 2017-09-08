project('DPQ2', 'd',
    meson_version: '>=0.40',
    license: 'BSL-1.0',
    version: '0.6.24'
)

project_soversion = '0'

#
# Dependencies
#
pkgc = import('pkgconfig')
derelict_pq_dep = dependency('derelict-pq', version: '>= 2.2.0', fallback: ['derelict-pq', 'derelict_pq_dep'])
vibe_data_dep = dependency('vibe-data', version: '>= 0.8')

#
# Sources
#
dpq2_src = [
    'src/dpq2/connection.d',
    'src/dpq2/value.d',
    'src/dpq2/oids.d',
    'src/dpq2/args.d',
    'src/dpq2/conv/numeric.d',
    'src/dpq2/conv/jsonb.d',
    'src/dpq2/conv/time.d',
    'src/dpq2/conv/to_bson.d',
    'src/dpq2/conv/to_d_types.d',
    'src/dpq2/conv/from_bson.d',
    'src/dpq2/conv/from_d_types.d',
    'src/dpq2/exception.d',
    'src/dpq2/package.d',
    'src/dpq2/result.d',
    'src/dpq2/query.d'
]

src_dir = include_directories('src/')

#
# Targets
#
dpq2_lib = library('dpq2',
        [dpq2_src],
        include_directories: [src_dir],
        dependencies: [derelict_pq_dep, vibe_data_dep],
        install: true,
        version: meson.project_version(),
        soversion: project_soversion,
        d_args: ['-d-version=Derelict_Static', '-d-version=Have_Int64_TimeStamp']
)
pkgc.generate(name: 'dpq2',
              libraries: dpq2_lib,
              subdirs: 'd/dpq2',
              version: meson.project_version(),
              requires: ['derelict-pq', 'vibe-data'],
              description: 'Another attempt to create a good interface to PostgreSQL for the D programming language.'
)

# to allow others to easily use this as a subproject
dpq2_dep = declare_dependency(
    link_with: [dpq2_lib],
    include_directories: [src_dir],
    dependencies: [derelict_pq_dep, vibe_data_dep]
)

#
# Install
#
install_subdir('src/dpq2/', install_dir: 'include/d/dpq2/')
