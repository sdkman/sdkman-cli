#!/bin/zsh

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

function __gvmtool_check_upgrade_available {
	UPGRADE_AVAILABLE="false"
	UPGRADE_NOTICE=$(echo "${BROADCAST_LIVE}" | grep 'Your version of GVM is out of date!')
	if [[ -n "$UPGRADE_NOTICE" ]]; then
		UPGRADE_AVAILABLE="true"
	fi
}

function __gvmtool_selfupdate {
	if [[ "$GVM_AVAILABLE" == "false" ]]; then
		echo "$OFFLINE_MESSAGE"

	elif [[ "$UPGRADE_AVAILABLE" == "false" ]]; then
		echo "No update available at this time."

	else
		curl -s "${GVM_SERVICE}/selfupdate" | bash
	fi
}
