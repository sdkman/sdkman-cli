#!/bin/bash

RELEASE=$(grep 'gvmVersion' config.groovy | sed 's_gvmVersion = __g' | tr -d "'")

if [[ "$RELEASE" == "1.0.0-SNAPSHOT" ]]; then
	RELEASE="1.0.0-build-$DRONE_BUILD_NUMBER"
	sed -i "s/1.0.0-SNAPSHOT/$RELEASE/g" config.groovy
fi

echo "Release: $RELEASE"

./gradlew -Penv="$DRONE_BRANCH"
git add -f build
git commit -m "Release: $RELEASE"
