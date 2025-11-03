#!/bin/bash

set -eE
trap 'echo "Error: line: $LINENO: $(sed -n "${LINENO}p" "$0")"; exit 1' ERR

if [ -z "$1" ]; then
	jupyter lab --ip 0.0.0.0 --allow-root &
	ollama serve
else
	exec "$@"
fi
