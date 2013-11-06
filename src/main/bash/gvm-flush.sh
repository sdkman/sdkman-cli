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

function __gvmtool_cleanup_folder {
	GVM_CLEANUP_DIR="${GVM_DIR}/${1}"
	GVM_CLEANUP_DU=$(du -sh "$GVM_CLEANUP_DIR")
	GVM_CLEANUP_COUNT=$(ls -1 "$GVM_CLEANUP_DIR" | wc -l)

	rm -rf "${GVM_DIR}/${1}"
	mkdir "${GVM_DIR}/${1}"

	echo "${GVM_CLEANUP_COUNT} archive(s) flushed, freeing ${GVM_CLEANUP_DU}."

	unset GVM_CLEANUP_DIR
	unset GVM_CLEANUP_DU
	unset GVM_CLEANUP_COUNT
}

function __gvmtool_flush {
	QUALIFIER="$1"
	case "$QUALIFIER" in
		candidates)
			if [[ -f "${GVM_DIR}/var/candidates" ]]; then
		        rm "${GVM_DIR}/var/candidates"
		        echo "Candidates have been flushed."
		    else
		        echo "No candidate list found so not flushed."
		    fi
		    ;;
		broadcast)
			if [[ -f "${GVM_DIR}/var/broadcast" ]]; then
		        rm "${GVM_DIR}/var/broadcast"
		        echo "Broadcast has been flushed."
		    else
		        echo "No prior broadcast found so not flushed."
		    fi
		    ;;
		archives)
			__gvmtool_cleanup_folder "archives"
		    ;;
		temp)
			__gvmtool_cleanup_folder "tmp"
		    ;;
		tmp)
			__gvmtool_cleanup_folder "tmp"
		    ;;
		*)
			echo "Stop! Please specify what you want to flush."
			;;
	esac
}