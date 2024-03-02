#!/bin/sh

# Function to replace "Dubstep" with "Dubstep" in file contents
replace_in_file() {
    sed -i '' 's/Dubstep/Dubstep/g' "$1"
}

# Replace contents recursively
find . -type f -exec sh -c '
    for file do
        replace_in_file "$file"
    done
' sh {} +
