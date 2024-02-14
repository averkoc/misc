#!/bin/bash

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <user> <file>"
    exit 1
fi

# Assign arguments to variables for better readability
user=$1
file=$2

# Use double quotes around variables to prevent word splitting and globbing
# Check for read permission
if sudo -u "$user" test -r "$file"; then
    echo "$user has read access to $file"
else
    echo "$user does not have read access to $file"
fi

# Check for write permission
if sudo -u "$user" test -w "$file"; then
    echo "$user has write access to $file"
else
    echo "$user does not have write access to $file"
fi

# Check for execute permission
if sudo -u "$user" test -x "$file"; then
    echo "$user has execute access to $file"
else
    echo "$user does not have execute access to $file"
fi
