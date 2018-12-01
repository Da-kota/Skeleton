do_build()
{
  local cmake_root_dir=.
  local build_dir="${cmake_root_dir}/build"
  local release_dir="${build_dir}/release"
  local test_dir="${build_dir}/unittest"
  
  if mkdir -p "${release_dir}" && mkdir -p "${test_dir}";
  then
    cd "${release_dir}"
    
    cmake -GNinja "${cmake_root_dir}"
    ninja &                             # no reason to wait for it here

    cd "${test_dir}"
    
    cmake -GNinja -DUNITTEST=ON "${cmake_root_dir}"
    ninja
    ninja test
    ninja CodeCoverage
    
    cd "${cmake_root_dir}"
    wait                            # for all background jobs to finish
  fi
}
  
do_build
