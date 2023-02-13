#!/bin/bash
input_file="fulllist.txt"
while IFS= read -r line
rm -Rf ../nginx_blacklist.conf
rm -Rf ../iptables_ban.sh
rm -Rf ../route_ban.sh
do
  echo "deny $line;" >> ../nginx_blacklist.conf
  echo "iptables -I INPUT -s $line -j DROP" >> ../iptables_ban.sh
  echo "route add blackhole $line" >> ../route_ban.sh
done < "$input_file"
