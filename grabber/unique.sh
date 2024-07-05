#!/bin/bash

input="fulllist.txt"
output="unique_list.txt"

awk '{$1=$1};1' "$input" | grep -v -e '^0\.0\.0\.0$' -e '^127\.0\.0\.1$' | sort | uniq > "$output"
rm -Rf "$input"
