option ( static_checking    "Do static checks."     ON  )
option ( unit_testing       "Do unit testing."      ON  )


if ( static_checking)
    include             ( static_checking.cmake         )
    set_cppcheck_cmd    ( cppcheck_cmd                  )
    set_cpplint_cmd     ( cpplint_cmd                   )

    message ( STATUS "cppcheck_cmd: ${cppcheck_cmd}"    )
    message ( STATUS "cpplint_cmd:  ${cpplint_cmd}"     )

    message ( STATUS "  Static checking enabled"        )
else()
    message ( WARNING "! ! ! Static checking DISABLED"  )
endif()

if ( unit_testing)
    include ( unit_testing.cmake                )
    message ( STATUS "  Unit testing enabled"   )

    option ( test_coverage "Measure code coverage during testing." ON   )

    if ( test_coverage)
        include                         ( test_coverage.cmake           )
        set_gcov_tool                   ( gcov_tool                     )
        set_lcov_tool                   ( lcov_tool                     )
        set_compiler_coverage_options   ( compiler_coverage_options     )

        message ( STATUS "Found gcov as: ${gcov_tool}"          )
        message ( STATUS "Found lcov as: ${lcov_tool}"          )

        message ( STATUS "  Test coverage measuring enabled"    )

        option (
            HTML_coverage_report "Open HTML coverage report in browser." ON
        )

        if ( HTML_coverage_report)
            include                     ( show_HTML_coverage_report.cmake   )
            set_genhtml_tool            ( genhtml_tool                      )
            set_open_html_report_tool   ( open_html_report_tool             )

            message ( STATUS "Found genhtml tool as: ${genhtml_tool}")
            message ( STATUS
                    "Found '${open_html_report_tool}'"
                    " for opening the HTML coverage report."
            )

            message ( STATUS "  HTML coverage reporting enabled")
        else()
            message ( STATUS ">>> HTML coverage reporting DISABLED")
        endif()
    else()
        message ( WARNING "! ! ! Test coverage measuring DISABLED")
    endif()
else()
    message ( WARNING "! ! ! Unit testing DISABLED")
endif()

