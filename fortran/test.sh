#!/bin/bash

output=$(./hello)
expected="Hello World!"

if [[ $output == $expected ]]; then
    echo "Success!"
    exit 0
else
    echo "Failed!"
    printf "Got '%s', expected '%s'" "$output" "$expected"
    exit 1
fi
