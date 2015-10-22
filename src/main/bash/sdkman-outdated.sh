#!/bin/bash

function __sdkman_determine_outdated_version {
    local candidate local_versions remote_default_version
    candidate="$1"

    # Resolve local versions
    local_versions="$(echo $(find "${SDKMAN_CANDIDATES_DIR}/${candidate}" -maxdepth 1 -mindepth 1 -type d -exec basename '{}' \;) | sed -e "s/ /, /g" )"
    if [ ${#local_versions} -eq 0 ]; then
        return 1
    fi

    # Resolve remote default version
    remote_default_version="$(curl -s "${SDKMAN_SERVICE}/candidates/${candidate}/default")"
    if [ -z "$remote_default_version" ]; then
        return 2
    fi

    # Check outdated or not
    if [ ! -d "${SDKMAN_CANDIDATES_DIR}/${candidate}/${remote_default_version}" ]; then
        echo "${candidate} (${local_versions} < ${remote_default_version})"
    fi
}

function __sdkman_outdated {
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
        outdated="$(__sdkman_determine_outdated_version "${candidate}")"
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
                if [ -n "${outdated}" ]; then
                    [ ${outdated_count} -eq 0 ] && echo "Outdated:"
                    echo "${outdated}"
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
