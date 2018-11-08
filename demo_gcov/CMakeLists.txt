# https://cmake.org/cmake-tutorial/

#set (PROJECT_OUTPUT_NAME "my_crosscompile_test")

cmake_minimum_required(VERSION 3.0)
project(my_silly_calculator)

# set output folder to put the build output
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../bin)

set (headers
    "hdr/calculation_routines.h"
)

set (sources 
    "src/main.c"
    "src/calculation_routines.c"
)

include_directories(hdr)

add_executable(${PROJECT_NAME} ${sources} ${headers})

