#!/bin/bash

set -eE
trap 'echo "Error: line: $LINENO: $(sed -n "${LINENO}p" "$0")"; exit 1' ERR

if [ -z "$1" ]; then
	jupyter lab --ip 0.0.0.0 --port 80 --allow-root --NotebookApp.token="$JUPITER_TOKEN" &
	gotty --address 0.0.0.0 --permit-write /usr/bin/env bash &
	ollama serve
else
	exec "$@"
fi
