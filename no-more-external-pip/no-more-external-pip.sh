#!/bin/bash

# Script to remove EXTERNALLY-MANAGED
# from installed Python distributions in /usr/lib/

check_sudo() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run as sudo or root. Please try again with 'sudo'."
        exit 1
    fi
}

check_sudo

EXTERNALLY_MANAGED_FILES=$(find /usr/lib -name 'EXTERNALLY-MANAGED' 2>/dev/null)

if [ -z "$EXTERNALLY_MANAGED_FILES" ]; then
    echo -e "No externally managed files found for any Python distributions.\n"
    echo -e "Exiting...\n"
    exit 0
fi

for EXTERNALLY_MANAGED_FILE in $EXTERNALLY_MANAGED_FILES; do
    echo "Removing: $EXTERNALLY_MANAGED_FILE"
    rm -f "$EXTERNALLY_MANAGED_FILE"
done

echo -e "\nAll EXTERNALLY-MANAGED files have been removed."
