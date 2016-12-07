#!/bin/bash

BRANCH="$1"
if [[ "$BRANCH" != 'master' ]]; then
    FIELD="cliVersion"
    VERSION="$BRANCH+$BUILD_NUMBER"
else
    FIELD="betaCliVersion"
    VERSION="master+$BUILD_NUMBER"
fi

echo "Release: $FIELD $VERSION for $BRANCH"

#mongo $MONGO_URL --username=$MONGO_USERNAME --password=$MONGO_PASSWORD \\
#    -eval "db.application.updateOne({}, { $set: { \"$FIELD\": \"$VERSION\"}});"
