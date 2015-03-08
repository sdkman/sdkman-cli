#!/bin/bash

function __gvmtool_determine_outdated_version {
    local candidate local_versions remote_default_version
    candidate="$1"

    # Resolve local versions
    local_versions="$(echo $(find "${GVM_DIR}/${candidate}" -maxdepth 1 -mindepth 1 -type d -exec basename '{}' \;) | sed -e "s/ /, /g" )"
    if [ ${#local_versions} -eq 0 ]; then
        return 1
    fi

    # Resolve remote default version
    remote_default_version="$(curl -s "${GVM_SERVICE}/candidates/${candidate}/default")"
    if [ -z "$remote_default_version" ]; then
        return 2
    fi

    # Check outdated or not
    if [ ! -d "${GVM_DIR}/${candidate}/${remote_default_version}" ]; then
        echo "${candidate} (${local_versions} < ${remote_default_version})"
    fi
}

function __gvmtool_outdated {
    local all candidates candidate outdated installed_count
    if [ -n "$1" ]; then
        all=false
        candidates=$1
    else
        all=true
        candidates=${GVM_CANDIDATES[@]}
    fi
    installed_count=0
    for candidate in ${candidates}; do
        outdated="$(__gvmtool_determine_outdated_version "${candidate}")"
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
                [ -n "${outdated}" ] && echo "${outdated}"
                (( installed_count += 1 ))
                ;;
        esac
    done
    if $all && [ ${installed_count} -eq 0 ]; then
        echo 'No candidates are in use'
    fi
}
