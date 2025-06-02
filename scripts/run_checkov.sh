#!/bin/bash
#
# Run the checkov checker
# https://github.com/bridgecrewio/checkov
#

# Usage:
#
#   ./scripts/run_checkov.sh

if [[ "$PWD" =~ scripts$ ]]; then
	echo "FATAL ERROR."
	echo "Please run the script from the project root. "
	echo "Present working director: $PWD"
	echo " "
	echo "Tip: like this"
	echo " "
	echo "  ./scripts/run_checkov.sh"
	echo " "
	exit 42
fi

checkov --directory . --quiet
