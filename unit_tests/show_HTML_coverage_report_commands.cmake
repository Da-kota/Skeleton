set ( coverage_report_dir       coverage_report_HTML    )

add_custom_command (
    TARGET
        ${test_app_name}

    COMMAND
        ${genhtml_tool}
            --demangle-cpp      ${coverage_data_file}
            --num-spaces        ${tab_width}
            --output-dir        ${coverage_report_dir}
            --quiet
            --legend

    COMMAND
        ${open_html_report_tool}
            ${coverage_report_dir}/index.html

    VERBATIM
    POST_BUILD
)
