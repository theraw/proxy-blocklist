#!/bin/bash

input="unique_list.txt"
output="valid.txt"
rm -rf "$output"
awk '
{
  split($0, octets, ".")
  if (length(octets) == 4 && octets[1] ~ /^[1-9][0-9]*$/ && octets[2] ~ /^[0-9]+$/ && octets[3] ~ /^[0-9]+$/ && octets[4] ~ /^[0-9]+$/ &&
      octets[1] <= 223 && octets[2] <= 255 && octets[3] <= 255 && octets[4] <= 255 &&
      !(octets[1] == 127) && !(octets[1] == 10) &&
      !(octets[1] == 192 && octets[2] == 168) &&
      !(octets[1] == 172 && octets[2] >= 16 && octets[2] <= 31)) {
    print $0
  } else {
    # debug purposes in cases weird ips are going to valid list
    # print "Invalid format or range: " $0 > "/dev/stderr"
  }
}
' "$input" > "$output"
rm -Rf "$input"
