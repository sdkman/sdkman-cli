#!/usr/bin/env bash

#
#   Copyright 2022 Jason Lee
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

function __sdk_choose {
    local candidate version versions 
    
    candidate="$1"

    IFS=',' read -r -a versions <<< "$(__sdkman_build_version_csv "$candidate")"

    echo The following $candidate candidates are installed.
    local index=1
    for version in "${versions[@]}" ; do
        echo "$index:  $version"
        index=$(( $index+1 ))
    done

    read -p "Select the candidate to use in the current shell:  " choice

    if [ "$choice" != "" ] ; then
        choice=$(( choice-1 ))
    
        if [ $choice -ge 0 -a $choice -lt ${#versions[@]} ]; then
            local selection=${versions[choice]}
            __sdk_use $candidate $selection
        fi
    fi
}
