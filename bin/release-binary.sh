#!/usr/bin/env bash

BRANCH="$1"
BUILD_NUMBER="$2"
MONGO_URL="$3"
MONGO_USERNAME="$4"
MONGO_PASSWORD="$5"
VERSION="$BRANCH+$BUILD_NUMBER"

if [[ -z "$MONGO_USERNAME" || -z "$MONGO_PASSWORD" ]]; then
	echo "No mongo credentials so doing nothing..."
	return 0
fi

if [[ "$BRANCH" == 'master' ]]; then
	FIELD="betaCliVersion"
else
	FIELD="stableCliVersion"
fi

echo "Release: $FIELD $VERSION"

mongo ${MONGO_URL} --username=${MONGO_USERNAME} --password=${MONGO_PASSWORD} -eval "db.application.updateOne({}, {\$set: { \"$FIELD\": \"$VERSION\"}});"
