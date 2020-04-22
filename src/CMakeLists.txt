# -----------------------------------------------------------------------------

# (1) Build a library with my application sources

set (
    app_lib_source
		dummy.cpp
)

add_library (
#[[ [STATIC | SHARED | MODULE]
    default: STATIC or SHARED depending on ${BUILD_SHARED_LIBS}
#]]
    ${app_lib_name}
        ${app_lib_source}
)


set_target_properties (
    ${app_lib_name}
        PROPERTIES
            CXX_CPPCHECK
                "${cppcheck_cmd}"
            CXX_CPPLINT
                "${cpplint_cmd}"
)


target_compile_options (
    ${app_lib_name}
    # PUBLIC means these options will also be added to linking targets
        PUBLIC
            ${compiler_warnings}
            $<$<BOOL:test_coverage>:${compiler_coverage_options}>
)


# -----------------------------------------------------------------------------

# (2) Add main(..) to the application library to have something we can run

add_executable (
    ${app_name}
        main.cpp
)

target_link_libraries (
    ${app_name}
        $<$<BOOL:test_coverage>:gcov> # Link against gcov if measuring coverage
        ${app_lib_name}
)

