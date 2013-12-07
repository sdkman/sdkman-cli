#!/bin/bash

CANDIDATE="$1"
VERSION="$2"

if [ -z "$1" -o -z "$2" ]; then
    echo "Usage: download.sh <CANDIDATE> <VERSION>"
    exit 0
fi

API="http://api.gvmtool.net"
BASE_DIR="${HOME}/gvm"
ARCHIVE_DIR="${BASE_DIR}/archives"
TMP_DIR="${BASE_DIR}/tmp"
ARCHIVE="${ARCHIVE_DIR}/${CANDIDATE}-${VERSION}.zip"
DESTINATION_DIR="$BASE_DIR/$CANDIDATE-$VERSION"

function download_archive {
    curl -# -L "${API}/download/${CANDIDATE}/${VERSION}?platform=$(uname)" > "$ARCHIVE"
}

if [ -d "$TMP_DIR" ]; then
    echo "Cleaning up temporary folder..."
    rm -rf "$TMP_DIR"
fi

mkdir -p "$BASE_DIR"
mkdir -p "$ARCHIVE_DIR"
mkdir "$TMP_DIR"

if [ -d "$DESTINATION_DIR" ]; then
    echo "Version $VERSION of $CANDIDATE already found, skipping installation."
    exit 0
fi

if [[ -f "$ARCHIVE" ]]; then
    ARCHIVE_OK=$(unzip -qt "${ARCHIVE}" | grep 'No errors detected in compressed data')
    if [[ -n "$ARCHIVE_OK" ]]; then
        echo "Archive found and verified, using cached version..."
    else
        echo "Archive found but was corrupt, redownloading..."
        download_archive
    fi
else
    echo "Downloading archive..."
    download_archive
fi

echo "Extracting archive to: $DESTINATION_DIR"
unzip -oq "$ARCHIVE" -d "$TMP_DIR"
mkdir "$DESTINATION_DIR"
mv "$TMP_DIR"/**/* "$DESTINATION_DIR"

rm -rf "$TMP_DIR"
