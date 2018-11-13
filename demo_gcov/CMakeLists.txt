# https://cmake.org/cmake-tutorial/

cmake_minimum_required(VERSION 3.0)
project(my_silly_main_project)
enable_testing()

add_subdirectory(src)

IF(${UNITTEST})
    MESSAGE(STATUS "## Unittest build")
    find_program(GCOV_GCOV_COMMAND "gcov.exe")
    IF(NOT GCOV_GCOV_COMMAND)
        MESSAGE(FATAL_ERROR "Cannot find gcov.exe")
    ENDIF()

    # Collect all coverage files
    file(GLOB_RECURSE ALL_COVERAGE_OBJS "${CMAKE_BINARY_DIR}/*.gcno")
    # Add (insert) option(s) for gcov
    if(ALL_COVERAGE_OBJS)
        list(INSERT ALL_COVERAGE_OBJS 1 "-b")
    endif()

    add_custom_target(CodeCoverage)
    add_custom_command(TARGET CodeCoverage
        POST_BUILD
        COMMAND ${GCOV_GCOV_COMMAND} ${ALL_COVERAGE_OBJS}
        COMMENT "Generating coverage report" )

    add_subdirectory(test)
ELSE()
    MESSAGE(STATUS "## Regular build")
ENDIF()

