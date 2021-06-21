#!/usr/bin/env bash

BRANCH="$1"
SHORT_HASH="$2"
MONGO_URL="$3"
MONGO_USERNAME="$4"
MONGO_PASSWORD="$5"
VERSION="$BRANCH+$SHORT_HASH"

if [[ -z "$MONGO_USERNAME" || -z "$MONGO_PASSWORD" ]]; then
	echo "No mongo credentials so doing nothing..."
	return 1
fi

echo "Mongo URL: $MONGO_URL"

if [[ "$BRANCH" == 'master' ]]; then
	FIELD="betaCliVersion"
else
	FIELD="stableCliVersion"
fi

echo "Release: $FIELD as $VERSION"

mongo "${MONGO_URL}" --username="${MONGO_USERNAME}" --password="${MONGO_PASSWORD}" -eval "db.application.updateOne({}, {\$set: { \"$FIELD\": \"$VERSION\"}});"
