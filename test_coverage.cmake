function ( set_gcov_tool tool_path)
    find_program (
        ${tool_path}
        NAMES
            gcov
            gcov.exe
    )

    if ( NOT ${tool_path})
        message (
            FATAL_ERROR
            "Test coverage requested but gcov tool not found."
        )
    endif()
endfunction()

#     -     -     -     -     -     -     -     -     -     -     -     -     -

function ( set_lcov_tool tool_path)
    find_program (
        ${tool_path}
        NAMES
            lcov
            lcov.exe
    )

    if ( NOT ${tool_path})
        message (
            FATAL_ERROR
            "Test coverage requested but lcov tool not found."
        )
    endif()
endfunction()

#     -     -     -     -     -     -     -     -     -     -     -     -     -

function ( set_compiler_coverage_options    options)
    set (               # define compiler options for coverage measurement.
        ${options}
            -g          # add debug info
            -Og         # -Og recomm. by GNU for optimum debugging experience.
            --coverage  # synonym for -fprofile-arcs -ftest-coverage
                        # (when compiling) and -lgcov (when linking).

        PARENT_SCOPE
    )
endfunction()

function ( set_linker_coverage_options    options)
    set (               # define linker options for coverage measurement.
        ${options}
            --coverage  # synonym for -lgcov

        PARENT_SCOPE
    )
endfunction()
