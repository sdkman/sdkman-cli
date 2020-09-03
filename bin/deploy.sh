#!/usr/bin/env bash

docker run --rm -e BINTRAY_USERNAME=$BINTRAY_USERNAME -e BINTRAY_API_KEY=$BINTRAY_API_KEY -e TRAVIS_BUILD_NUMBER=$TRAVIS_BUILD_NUMBER -v $PWD:/usr/src/app -v $HOME/.gradle:/root/.gradle sdkman/sdkman-cli -Penv=production clean assemble bintrayUpload
bin/dopublish nyc3.digitaloceanspaces.com sdkman "dist/sdkman-cli-$TRAVIS_BRANCH+$TRAVIS_BUILD_NUMBER.zip" "build/distributions/sdkman-cli-$TRAVIS_BRANCH+$TRAVIS_BUILD_NUMBER.zip"
bin/release-binary.sh $TRAVIS_BRANCH $TRAVIS_BUILD_NUMBER $MONGO_URL $MONGO_USERNAME $MONGO_PASSWORD
