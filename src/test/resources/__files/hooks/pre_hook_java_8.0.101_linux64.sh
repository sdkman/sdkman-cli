#!/usr/bin/env bash
# passthrough with zero return code
function __sdkman_pre_installation_hook() {
	echo "PRE: passthrough returning zero return code"
	return 0
}
