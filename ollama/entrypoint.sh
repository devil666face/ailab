#!/bin/bash

set -eE
trap 'echo "Error: line: $LINENO: $(sed -n "${LINENO}p" "$0")"; exit 1' ERR

if [ -z "$1" ]; then
	jupyter lab --allow-root
	ollama serve
else
	exec "$@"
fi
