#!/bin/bash

rm -rf valid.txt
# Define a pattern for a valid IP address
pattern="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

# Read the list of IP addresses from a file
ips=($(cat unique_list.txt))

# Loop through each IP address in the list
for ip in "${ips[@]}"; do
  # Check if the IP address matches the pattern
  if [[ $ip =~ $pattern ]]; then
    # Check if the IP address falls within a valid range
    IFS=. read -a octets <<< "$ip"
    if [[ ${octets[0]} -le 255 && ${octets[1]} -le 255 && ${octets[2]} -le 255 && ${octets[3]} -le 255 &&
      ${octets[0]} -ge 0 && ${octets[1]} -ge 0 && ${octets[2]} -ge 0 && ${octets[3]} -ge 0 &&
      ${octets[0]} != 127 && ${octets[0]} != 10 && 
      (${octets[0]} != 172 || (${octets[1]} -ge 16 && ${octets[1]} -le 31)) &&
      (${octets[0]} != 192 || ${octets[1]} != 168) &&
      (${octets[0]} -lt 224) ]]; then
      # If it is a valid IP, keep it in the list
      valid_ips+=($ip)
    fi
  fi
done

# Write the valid IP addresses to a file
for ip in "${valid_ips[@]}"; do
  echo $ip >> valid.txt
done
rm -Rf unique_list.txt
