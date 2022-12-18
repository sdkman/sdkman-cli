#!/usr/bin/env bash
# Relocate files after expanding the tarball
function __sdkman_relocate_installation_hook() {
	echo "POST: relocating files from $binary_input"
	local present_dir="$(pwd)"
	
	local candidate_dir="${SDKMAN_CANDIDATES_DIR}/${candidate}/${version}"
    local work_jdk_dir="${SDKMAN_DIR}/tmp/${candidate}-${version}"
    
	echo ""
	__sdkman_echo_green "Relocating ${candidate} ${version}..."
	
	mkdir -p $work_jdk_dir
    
	#Move ./Contents/Home to temp location
	cd "$candidate_dir"/*/Contents
	mv -f Home "$work_jdk_dir"
    
	#Replace candidate
	cd "$present_dir"
	rm -rf "$candidate_dir"
	mv -f "$work_jdk_dir" "$candidate_dir"
    
	echo ""
	__sdkman_echo_green "Done relocating..."
}
