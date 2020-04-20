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

function ( set_compiler_coverage_options    options)
    set (               # If measuring coverage, these are the options to use.
        ${options}
            -g
            -O0
            -fprofile-arcs
            -ftest-coverage
        PARENT_SCOPE
    )
endfunction()
