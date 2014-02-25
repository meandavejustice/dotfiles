#!/usr/bin/env bash

# Trap interrupts and exit instead of continuing the loop
trap "echo Exited!; exit;" SIGINT SIGTERM

while read line; do
    npm install -g $line
done < ./global-modules.txt
