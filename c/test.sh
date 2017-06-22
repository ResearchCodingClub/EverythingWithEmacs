#!/bin/bash

if [[ $(./hello) == "Hello World!" ]]; then
    echo "Success!"
    exit 0
else
    echo "Failed!"
    exit 1
fi
