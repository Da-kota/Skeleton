set ( coverage_data_file        coverage.data   )

# TODO: function ( add_test_coverage_commands target_name working_dir lcov_path)

add_custom_command (                    # Reset coverage data (if any) to zero.
    TARGET
        ${test_app_name}

    COMMAND
        ${lcov_tool}
            --zerocounters
                                           # data on file system, not in kernel
            --directory ../${source_dir}/CMakeFiles/${app_lib_name}.dir

    PRE_BUILD
)


add_custom_command (
    TARGET
        ${test_app_name}

    COMMAND
        ${lcov_tool}
            --no-external
            --capture
            --directory         ../${source_dir}/CMakeFiles/${app_lib_name}.dir
            --base-directory    ../../${source_dir}
            --output-file       ${coverage_data_file}

    COMMAND                                            # Show coverage summary.
        ${lcov_tool}
            --list              ${coverage_data_file}

    VERBATIM
    POST_BUILD
)

