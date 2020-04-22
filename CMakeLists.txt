
# -----------------------------------------------------------------------------

# (1) CMake definitions, compiler flags and useful variables

cmake_minimum_required ( VERSION 3.9)              # for static test interface

project (
    "CppUTest_tut"
    VERSION         0.71
    LANGUAGES       CXX
)

include ( build_options.cmake)

set ( source_dir        src        )
set ( unit_test_dir     unit_tests )

#      -      -      -      -      -      -      -      -      -      -      -

include ( compiler_warnings.cmake)
set_compiler_warnings ( compiler_warnings)
										    # Select default required standard
set (   CMAKE_CXX_STANDARD_REQUIRED     ON  )
set (   CMAKE_CXX_STANDARD              17  )
set (   tab_width                       4   )       # for HTML coverage report

#      -      -      -      -      -      -      -      -      -      -      -

set (   app_name                   the_app  )
set (   app_lib_name        the_app_as_lib  )


# -----------------------------------------------------------------------------

# (2) Include application build instructions
# syntax:  add_subdirectory ( <src_dir> [bin_dir] )
# The subproject doesn't have to reside in an actual subdirectory

add_subdirectory ( ${source_dir})


# -----------------------------------------------------------------------------

# (3) optionally include tests build instructions

if ( unit_testing)
    add_subdirectory ( ${unit_test_dir})                    # build unit tests
endif()

