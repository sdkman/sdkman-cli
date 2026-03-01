#!/usr/bin/env bash
# failed download with non-zero exit code
function __sdkman_post_installation_hook() {
	echo "POST: fails with non-zero exit code"
	echo "Cannot install java 8.0.101 at this time..."
	echo "Download has failed, aborting!"
	return 1
}
