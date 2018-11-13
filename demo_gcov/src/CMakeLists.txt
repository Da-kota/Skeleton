
cmake_minimum_required(VERSION 3.0)
project(my_silly_calculator)

# set output folder to put the build output
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../../bin/release)

set(calculation_lib_headers
    "hdr/calculation_routines.h"
)

set(calculation_lib_sources
    "calculation_routines.c"
)

set (headers
)

set (sources 
    "main.c"
)

include_directories(hdr)

# Create a library so we can also use it in our tests
add_library(CALCULATION_LIB ${calculation_lib_sources} ${calculation_lib_headers})

add_executable(${PROJECT_NAME} ${sources} ${headers})
target_link_libraries(${PROJECT_NAME} CALCULATION_LIB)

IF(${UNITTEST})
    target_compile_options(${PROJECT_NAME} PRIVATE -g -O0 -fprofile-arcs -ftest-coverage)
    target_compile_options(CALCULATION_LIB PRIVATE -g -O0 -fprofile-arcs -ftest-coverage)
    target_link_libraries(CALCULATION_LIB -lgcov)
ENDIF()

