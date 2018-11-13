
cmake_minimum_required(VERSION 3.0)

include(CTest)

project(calculations_unittest CXX)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../../bin/unittest)

add_definitions(-DUNITTEST=)

set (unittest_sources 
    "main.cpp"
    "calculation_tests.cpp"
)

# Build the tests
add_executable(${PROJECT_NAME} ${unittest_sources})

# Prevent some warnings that come from cpputest project files
target_compile_options(${PROJECT_NAME} PRIVATE -Wno-long-long -Wno-c++14-compat)

# Execute the tests
add_test(NAME unittests COMMAND ${PROJECT_NAME})

# Include and link firmware stuff
include_directories(../src/hdr)
target_link_libraries(${PROJECT_NAME} CALCULATION_LIB)

# Include and link CPPUTEST stuff
find_library(LIBCPPUTEST libCppUTest.a)
if(LIBCPPUTEST)
    target_link_libraries(${PROJECT_NAME} ${LIBCPPUTEST})
else()
    message(FATAL_ERROR "libCppUTest.a not found, please add the folder to your path where this file resides")
endif()

find_library(LIBCPPUTESTEXT libCppUTestExt.a)
if(LIBCPPUTESTEXT)
    target_link_libraries(${PROJECT_NAME} ${LIBCPPUTESTEXT})
else()
    message(FATAL_ERROR "libCppUTestExt.a not found, please add the folder to your path where this file resides")
endif()

find_path(CPPUTEST_INCLUDE_DIR NAMES CppUTest/CommandLineTestRunner.h)
if(CPPUTEST_INCLUDE_DIR)
    include_directories(${CPPUTEST_INCLUDE_DIR})
else()
    message(FATAL_ERROR "Cannot find: CppUTest/CommandLineTestRunner.h, please add the cpputest include directory to your path")
endif()
