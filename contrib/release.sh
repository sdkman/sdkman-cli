#!/bin/bash

BRANCH="$1"
VERSION="$2"

if [[ "$BRANCH" == 'beta' && -n "$VERSION" ]]; then
	git checkout master

elif [[ "$BRANCH" == 'production' ]]; then
	git checkout beta

else
	echo "Usage: release.sh <branch> [version]"
	exit 0
fi

git branch -D "$BRANCH"
git checkout -b "$BRANCH"
sed -i "s/1.0.0-SNAPSHOT/$VERSION/g" config.groovy


git add config.groovy
git commit -m "Update version of $BRANCH to $VERSION"
git push -f origin "$BRANCH:$BRANCH"

git checkout master
