function ( set_genhtml_tool tool_path)
    find_program (
        ${tool_path}
        NAMES
            genhtml
            genhtml.exe
    )

    if ( NOT ${tool_path})
        message (
            FATAL_ERROR
            "genhtml tool not found."
        )
    endif()
endfunction()

function ( set_open_html_report_tool tool_path)
    find_program (
        ${tool_path}
        NAMES
            mimeopen
            start.exe
    )

    if ( NOT ${tool_path})
        message (
            FATAL_ERROR
            "Did not find tool for opening the HTML coverage report."
        )
    endif()
endfunction()

