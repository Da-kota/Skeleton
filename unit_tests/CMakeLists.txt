# Our unit test application

set ( test_app_name     ${app_name}_tests )

# -----------------------------------------------------------------------------

# Build the unit tests objects and link them with the application library.

add_executable (
    ${test_app_name}
        #mocks/a_class_mock.cpp                     # mocking code can go here.
        test_harness.cpp
        test_runner.cpp
)

target_include_directories (
    ${test_app_name}
    PRIVATE
        ../${source_dir}
)

target_link_directories (
    ${test_app_name}
    PRIVATE
        ${CPPUTEST_LIBRARIES}
)

target_link_libraries (
    ${test_app_name}
        $<$<BOOL:test_coverage>:gcov> # Link against gcov if measuring coverage.
        ${CPPUTEST_LDFLAGS}
        ${app_lib_name}
)


# -----------------------------------------------------------------------------

# Run the test once the build is done.

add_custom_command (                                                 # test run
    TARGET        ${test_app_name}
    COMMAND     ./${test_app_name}
    POST_BUILD
)

# -----------------------------------------------------------------------------

# Conditionally review the test coverage after the tests have run.

if ( test_coverage)

    include ( test_coverage_commands.cmake)

    if ( HTML_coverage_report)
        include ( show_HTML_coverage_report_commands.cmake)
    endif()
endif()
