function ( set_cppcheck_cmd cmd)
    find_program (
        cppcheck_tool
        NAMES
            cppcheck
            cppcheck.exe
    )

    if ( NOT cppcheck_tool)
        message (
            FATAL_ERROR
            "Static Checking requested but cppcheck tool not found."
        )
    endif()

    set ( ${cmd}
            ${cppcheck_tool}
                --enable=warning,style,portability,performance
                --force                    # Check all (DEFINE) configurations.
                --quiet
                --inconclusive
                --relative-paths=${CMAKE_SOURCE_DIR}
            PARENT_SCOPE
    )
endfunction ( set_cppcheck_cmd)

function ( set_cpplint_cmd cmd)
    find_program (
        cpplint_tool
        NAMES
            cpplint
            cpplint.exe
    )

    if ( NOT cpplint_tool)
        message (
            FATAL_ERROR
            "Static Checking requested but cpplint tool not found."
        )
    endif()

    set ( ${cmd}
            ${cpplint_tool}
                --quiet
                --verbose=5
                --filter=-legal/copyright,-whitespace
            PARENT_SCOPE
    )
endfunction()
