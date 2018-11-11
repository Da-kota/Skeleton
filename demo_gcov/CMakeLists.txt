# https://cmake.org/cmake-tutorial/

cmake_minimum_required(VERSION 3.0)
project(my_silly_calculator)

enable_testing()

# set output folder to put the build output
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../../bin/release)

set(calculation_lib_headers
    "hdr/calculation_routines.h"
)

set(calculation_lib_sources
    "src/calculation_routines.c"
)

set (headers
)

set (sources 
    "src/main.c"
)

IF(${UNITTEST})
    MESSAGE(STATUS "## Unittest build")
    add_subdirectory(test)
ELSE()
    MESSAGE(STATUS "## Regular build")
ENDIF()

include_directories(hdr)

add_library(CALCULATION_LIB ${calculation_lib_sources} ${calculation_lib_headers})

add_executable(${PROJECT_NAME} ${sources} ${headers})
target_link_libraries(${PROJECT_NAME} CALCULATION_LIB)


