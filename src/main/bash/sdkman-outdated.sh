#!/bin/bash

#
#   Copyright 2012 Marco Vermeulen
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

function __sdk_outdated {
    local all candidates candidate outdated installed_count outdated_count
    if [ -n "$1" ]; then
        all=false
        candidates=$1
    else
        all=true
        candidates=${SDKMAN_CANDIDATES[@]}
    fi
    installed_count=0
    outdated_count=0
    for candidate in ${candidates}; do
        outdated="$(__sdkman_determine_outdated_version "$candidate")"
        case $? in
            1)
                $all || echo "Not using any version of ${candidate}"
                ;;
            2)
                echo ""
                echo "Stop! Could not get remote version of ${candidate}"
                return 1
                ;;
            *)
                if [ -n "$outdated" ]; then
                    [ ${outdated_count} -eq 0 ] && echo "Outdated:"
                    echo "$outdated"
                    (( outdated_count += 1 ))
                fi
                (( installed_count += 1 ))
                ;;
        esac
    done
    if $all; then
        if [ ${installed_count} -eq 0 ]; then
            echo 'No candidates are in use'
        elif [ ${outdated_count} -eq 0 ]; then
            echo "All candidates are up-to-date"
        fi
    elif [ ${outdated_count} -eq 0 ]; then
        echo "${candidate} is up-to-date"
    fi
}

function __sdkman_determine_outdated_version {
    local candidate local_versions remote_default_version

    candidate="$1"

    # Resolve local versions
    local_versions="$(echo $(find "${SDKMAN_CANDIDATES_DIR}/${candidate}" -maxdepth 1 -mindepth 1 -type d -exec basename '{}' \; 2>/dev/null) | sed -e "s/ /, /g" )"
    if [ ${#local_versions} -eq 0 ]; then
        return 1
    fi

    # Resolve remote default version
    remote_default_version="$(__sdkman_secure_curl "${SDKMAN_SERVICE}/candidates/${candidate}/default")"
    if [ -z "$remote_default_version" ]; then
        return 2
    fi

    # Check outdated or not
    if [ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${remote_default_version}" ]; then
        echo "${candidate} (${local_versions} < ${remote_default_version})"
    fi
}
