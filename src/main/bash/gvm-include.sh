#!/bin/bash

OFFLINE_BROADCAST=$( cat << EOF
==== BROADCAST =============================================

AEROPLANE MODE ENABLED! Some functionality is now disabled.

============================================================
EOF
)

ONLINE_BROADCAST=$( cat << EOF
==== BROADCAST =============================================

ONLINE MODE RE-ENABLED! All functionality now restored.

============================================================
EOF
)

OFFLINE_MESSAGE="This command is not available in aeroplane mode."
GVM_CANDIDATES=("groovy" "grails" "griffon" "gradle" "lazybones" "vertx")

# Source gvm module scripts.
for f in $(find "${GVM_DIR}/src" -type f -name 'gvm-*'); do
	source "${f}"
done

# Source extension files prefixed with 'gvm-' and found in the ext/ folder
# Use this if extensions are written with the functional approach and want
# to use functions in the main gvm script.
for f in $(find "${GVM_DIR}/ext" -type f -name 'gvm-*'); do
	if [ -r "${f}" ]; then
		source "${f}"
    fi
done
unset f
