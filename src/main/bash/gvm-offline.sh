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

function __gvmtool_offline {
	if [[ "$1" == "enable" ]]; then
		GVM_FORCE_OFFLINE="true"
		echo "Forced offline mode enabled."
	fi
	if [[ "$1" == "disable" ]]; then
		GVM_FORCE_OFFLINE="false"
		GVM_ONLINE="true"
		echo "Online mode re-enabled!"
	fi
}

function gvm_determine_offline {
    local input="$1"
	if [[ -z "$input" ]]; then
		GVM_ONLINE="false"
		GVM_AVAILABLE="false"
	else
		GVM_ONLINE="true"
	fi
}

function gvm_force_offline_on_proxy {
	local response="$1"
	local detect_html="$(echo "$response" | tr '[:upper:]' '[:lower:]' | grep 'html')"
	if [[ -n "$detect_html" ]]; then
		echo "GVM can't reach the internet so going offline. Re-enable online with:"
		echo ""
		echo "  $ gvm offline disable"
		echo ""
		GVM_FORCE_OFFLINE="true"
    else
        GVM_FORCE_OFFLINE="false"
	fi
}
