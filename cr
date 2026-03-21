#!/bin/bash
# cr = compile and run
# Usage: cr filename.cpp [input_file]

FILE=$1
BINARY="/tmp/$(basename $FILE .cpp)"

if [ -z "$FILE" ]; then
    echo "Usage: cr <file.cpp> [input]"
    exit 1
fi

# Compile with useful flags
g++ -std=c++17 -O2 -Wall -Wextra -o "$BINARY" "$FILE"

if [ $? -ne 0 ]; then
    echo "--- Compilation failed ---"
    exit 1
fi

echo "--- Compiled OK ---"

# Run with optional input file
if [ -n "$2" ]; then
    "$BINARY" < "$2"
else
    "$BINARY"
fi
