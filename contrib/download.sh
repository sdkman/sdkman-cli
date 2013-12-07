#!/bin/bash

CANDIDATE="$1"
VERSION="$2"

if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: download.sh <CANDIDATE> <VERSION>"
	exit 0
fi

API="http://api.gvmtool.net"
BASE_DIR="$HOME/gvm"
ARCHIVE_DIR="${BASE_DIR}/archives"
ARCHIVE="${ARCHIVE_DIR}/${CANDIDATE}-${VERSION}.zip"
ARCHIVE_OK=$(unzip -t "${ARCHIVE}" | grep 'No errors detected in compressed data')
DESTINATION_DIR="$BASE_DIR/$CANDIDATE-$VERSION"

mkdir -p "$BASE_DIR"
mkdir -p "$ARCHIVE_DIR"

if [ -d "$DESTINATION_DIR" ]; then
    echo "Version $VERSION of $CANDIDATE already found, skipping installation."
    exit 0
fi

if [[ -f "$ARCHIVE" && -n "$ARCHIVE_OK" ]]; then
	echo "Archive found and verified, using cached version..."
else
	echo "Downloading archive..."
	curl -# -L "${API}/download/${CANDIDATE}/${VERSION}?platform=$(uname)" > "$ARCHIVE"
fi

echo "Extracting archive to: $DESTINATION_DIR"
unzip -oq "$ARCHIVE" -d "$DESTINATION_DIR"
