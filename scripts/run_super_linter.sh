#!/bin/bash
#
# Run the Super Linter, with
# homepage at https://github.com/super-linter/super-linter
#
# Usage:
#
#   ./scripts/run_super_linter.sh

if [[ "$PWD" =~ scripts$ ]]; then
	echo "FATAL ERROR."
	echo "Please run the script from the project root. "
	echo "Present working director: $PWD"
	echo " "
	echo "Tip: like this"
	echo " "
	echo "  ./scripts/run_super_linter.sh"
	echo " "
	exit 42
fi

mkdir /tmp/lint
touch /tmp/lint/README.md

mkdir tmp
mkdir tmp/lint
touch tmp/lint/README.md

GITHUB_WORKSPACE=${PWD}
GITHUB_SHA=$(git -C . rev-parse HEAD)

export GITHUB_WORKSPACE
export GITHUB_SHA

# Run locally
docker run \
	-e RUN_LOCAL=true \
	--volume "${PWD}:${PWD}/tmp/README.md" \
	-w "${PWD}/tmp" \
	ghcr.io/super-linter/super-linter:latest
