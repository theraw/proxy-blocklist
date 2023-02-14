#!/bin/bash
input_file="valid.txt"
echo "Enter response (nginx, nginx-map, iptables or route):"
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
  "nginx-map")
    rm -Rf ../nginx_blacklist_map.conf
    echo 'geo $bad_ip {' > ../nginx_blacklist_map.conf

    while IFS= read -r line
    do
      echo "    $line;" >> ../nginx_blacklist_map.conf
    done < "$input_file"

    echo '    default 1;' >> ../nginx_blacklist_map.conf
    echo '}' >> ../nginx_blacklist_map.conf
    ;;
  *)
    echo "Invalid response. Please enter nginx, nginx-map, iptables or route."
    ;;
esac
