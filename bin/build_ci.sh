#!/bin/bash

RELEASE=$(grep 'sdkmanVersion' config.groovy | sed 's_sdkmanVersion = __g' | tr -d "'")

if [[ "$RELEASE" == "1.0.0-SNAPSHOT" ]]; then
	RELEASE="1.0.0-build-$CI_BUILD_NUMBER"
	sed -i "s/1.0.0-SNAPSHOT/$RELEASE/g" config.groovy
fi

echo "Release: $RELEASE"

./gradlew -Penv="$CI_BRANCH"
git add -f build
git commit -m "Release: $RELEASE"
