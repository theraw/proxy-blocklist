#!/bin/bash
input_file="unique_list.txt"
echo "Enter response (nginx, iptables or route):"
read response

# Switch case based on response
case "$response" in
  "nginx")
    rm -Rf ../nginx_blacklist.conf
    while IFS= read -r line
    do
      echo "deny $line;" >> ../nginx_blacklist.conf
    done < "$input_file"
    ;;
  "iptables")
    rm -Rf ../iptables_ban.sh
    while IFS= read -r line
    do
      echo "iptables -I INPUT -s $line -j DROP" >> ../iptables_ban.sh
    done < "$input_file"
    ;;
  "route")
    rm -Rf ../route_ban.sh
    while IFS= read -r line
    do
      echo "route add blackhole $line" >> ../route_ban.sh
    done < "$input_file"

    ;;
  *)
    # Invalid response
    echo "Invalid response. Please enter nginx, iptables or route."
    ;;
esac
