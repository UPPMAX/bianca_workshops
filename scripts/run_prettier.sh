#!/bin/bash
#
# Fix style errors using Prettier.
#
# Usage:
#
#   ./scripts/run_prettier.sh

if [[ "$PWD" =~ scripts$ ]]; then
	echo "FATAL ERROR."
	echo "Please run the script from the project root. "
	echo "Present working director: $PWD"
	echo " "
	echo "Tip: like this"
	echo " "
	echo "  ./scripts/run_prettier.sh"
	echo " "
	exit 42
fi

npx prettier . --write
