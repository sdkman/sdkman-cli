#/bin/bash

CANDIDATE="$1"
VERSION="$2"

if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: download.sh <CANDIDATE> <VERSION>"
	exit 0
fi

API="http://api.gvmtool.net"
DEST="$HOME/gvm"
TMP_FOLDER="${DEST}/archives"
ARCHIVE="${TMP_FOLDER}/${CANDIDATE}-${VERSION}.zip"

mkdir -p "$TMP_FOLDER"

if [ -f "$ARCHIVE" ]; then
	echo "Archive found, using cached version..."
else
	echo "Downloading archive..."
	curl -# -L "${API}/download/${CANDIDATE}/${VERSION}?platform=$(uname)" >> "$ARCHIVE"
fi

echo "Extracting archive to: $DEST"
unzip -oq "$ARCHIVE" -d "$DEST"
