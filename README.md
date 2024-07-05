# proxy-blocklist
Pre-ban public proxies used for L7 attacking or other spam/attacks.

# Ban ips
I personally suggest using ipset, use this script to install ipset + iptables + can/ban proxies all at once, 
```bash
curl -s https://raw.githubusercontent.com/theraw/proxy-blocklist/main/ipset.sh | bash
```

# Using scripts to parse proxy list
```
cd /tmp; git clone https://github.com/theraw/proxy-blocklist.git
cd /tmp/proxy-blocklist/grabber/; bash grab.sh
```
