#!/bin/bash

if [[ -z "$1" ]]; then
	echo "Currently set to: $GVM_SERVICE"
else
	export GVM_SERVICE="$1"
	echo "Now set to: $GVM_SERVICE"
fi
