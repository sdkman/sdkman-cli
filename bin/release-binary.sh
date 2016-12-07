#!/bin/bash

BRANCH="$1"
BUILD_NUMBER="$2"
MONGO_URL="$3"
MONGO_USERNAME="$4"
MONGO_PASSWORD="$5"
VERSION="$BRANCH+$BUILD_NUMBER"

if [[ "$BRANCH" == 'master' ]]; then
    FIELD="betaCliVersion"
else
    FIELD="cliVersion"
fi

echo "Release: $FIELD $VERSION"

mongo ${MONGO_URL} --username=${MONGO_USERNAME} --password=${MONGO_PASSWORD} -eval "db.application.updateOne({}, {\$set: { \"$FIELD\": \"$VERSION\"}});"