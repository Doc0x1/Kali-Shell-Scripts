#!/bin/bash

# Script to automatically fetch and add missing/expired Kali Linux keyserver keys
# Requires sudo privileges to update apt keys

update_keys() {
    echo "Updating Kali Linux keyserver keys..."

    # Find the missing key IDs from apt update output
    missing_keys=$(apt-get update 2>&1 | grep "NO_PUBKEY" | awk '{print $NF}' | sort -u)

    if [ -z "$missing_keys" ]; then
        echo "No missing keys detected. All good!"
        exit 0
    fi

    echo "Missing keys detected: $missing_keys"

    for key in $missing_keys; do
        echo "Fetching key: $key"
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key"
        if [ $? -eq 0 ]; then
            echo "Successfully added key: $key"
        else
            echo "Failed to add key: $key"
        fi
    done

    echo "Keys updated. Running 'apt-get update' again..."
    sudo apt-get update
}

# Ensure the script is run with sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo or as root."
    exit 1
fi

update_keys
