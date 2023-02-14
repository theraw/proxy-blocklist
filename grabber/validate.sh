#!/bin/bash

# Define a pattern for a valid IP address
pattern="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$"

# Read the list of IP addresses from a file
ips=($(cat unique_list.txt))

# Loop through each IP address in the list
for ip in "${ips[@]}"; do
  # Check if the IP address matches the pattern
  if [[ $ip =~ $pattern ]]; then
    # If it matches, keep it in the list and write it to a file on a new line
    echo $ip >> valid.txt
  fi
done
rm -Rf unique_list.txt
