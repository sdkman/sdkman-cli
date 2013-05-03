#!/bin/bash

echo "include submodules"

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
