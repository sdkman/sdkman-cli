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
    local all candidates candidate outdated installed_count outdated_count outdated_candidates
    if [ -n "$1" ]; then
        all=false
        candidates=$1
    else
        all=true
        candidates=${SDKMAN_CANDIDATES[@]}
    fi
    installed_count=0
    outdated_count=0
    echo ""
    for candidate in ${candidates}; do
        outdated="$(__sdkman_determine_outdated_version "$candidate")"
        case $? in
            1)
                $all || __sdkman_echo_red "Not using any version of ${candidate}"
                ;;
            2)
                echo ""
                __sdkman_echo_red "Stop! Could not get remote version of ${candidate}"
                return 1
                ;;
            *)
                if [ -n "$outdated" ]; then
                    [ ${outdated_count} -eq 0 ] && __sdkman_echo_white "Outdated:"
                    __sdkman_echo_white "$outdated"
                    (( outdated_count += 1 ))
                    outdated_candidates=(${outdated_candidates[@]} $candidate)
                fi
                (( installed_count += 1 ))
                ;;
        esac
    done
    if $all; then
        if [ ${installed_count} -eq 0 ]; then
            __sdkman_echo_white 'No candidates are in use'
        elif [ ${outdated_count} -eq 0 ]; then
            __sdkman_echo_white "All candidates are up-to-date"
        fi
    elif [ ${outdated_count} -eq 0 ]; then
        __sdkman_echo_white "${candidate} is up-to-date"
    fi
    if [ ${outdated_count} -gt 0 ]; then
        echo ""
        __sdkman_echo_confirm "Update candidate(s) and set latest version(s) as default? (Y/n): "
        read UPDATE_ALL
        export auto_answer_outdated='true'
        if [[ -z "$UPDATE_ALL" || "$UPDATE_ALL" == "y" || "$UPDATE_ALL" == "Y" ]]; then
            for outdated_candidate in ${outdated_candidates}; do
                __sdk_install $outdated_candidate
            done
        fi
        unset auto_answer_outdated
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
    remote_default_version="$(__sdkman_secure_curl "${SDKMAN_CURRENT_API}/candidates/default/${candidate}")"
    if [ -z "$remote_default_version" ]; then
        return 2
    fi

    # Check outdated or not
    if [ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${remote_default_version}" ]; then
        __sdkman_echo_yellow "${candidate} (${local_versions} < ${remote_default_version})"
    fi
}
