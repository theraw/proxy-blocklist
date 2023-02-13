#!/bin/bash

# URLs array
urls=(
# http
"https://api.proxyscrape.com/?request=displayproxies&proxytype=http"
"https://www.proxy-list.download/api/v1/get?type=http"
"https://www.proxyscan.io/download?type=http"
"https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/http.txt"
"https://api.openproxylist.xyz/http.txt"
"https://raw.githubusercontent.com/shiftytr/proxy-list/master/proxy.txt"
"http://alexa.lr2b.com/proxylist.txt"
"https://www.freeproxychecker.com/result/http_proxies.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-http.txt"
"https://raw.githubusercontent.com/clarketm/proxy-list/master/proxy-list-raw.txt"
"https://raw.githubusercontent.com/sunny9577/proxy-scraper/master/proxies.txt"
"https://raw.githubusercontent.com/opsxcq/proxy-list/master/list.txt"
"https://proxy-spider.com/api/proxies.example.txt"
"https://multiproxy.org/txt_all/proxy.txt"
"https://raw.githubusercontent.com/roosterkid/openproxylist/main/HTTPS_RAW.txt"
"https://raw.githubusercontent.com/UserR3X/proxy-list/main/online/http.txt"
"https://raw.githubusercontent.com/UserR3X/proxy-list/main/online/https.txt"
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=http"
"https://openproxylist.xyz/http.txt"
"https://proxyspace.pro/http.txt"
"https://proxyspace.pro/https.txt"
"https://raw.githubusercontent.com/almroot/proxylist/master/list.txt"
"https://raw.githubusercontent.com/aslisk/proxyhttps/main/https.txt"
"https://raw.githubusercontent.com/B4RC0DE-TM/proxy-list/main/HTTP.txt"
"https://raw.githubusercontent.com/hendrikbgr/Free-Proxy-Repo/master/proxy_list.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-https.txt"
"https://raw.githubusercontent.com/mertguvencli/http-proxy-list/main/proxy-list/data.txt"
"https://raw.githubusercontent.com/mmpx12/proxy-list/master/http.txt"
"https://raw.githubusercontent.com/mmpx12/proxy-list/master/https.txt"
"https://raw.githubusercontent.com/proxy4parsing/proxy-list/main/http.txt"
"https://raw.githubusercontent.com/RX4096/proxy-list/main/online/http.txt"
"https://raw.githubusercontent.com/RX4096/proxy-list/main/online/https.txt"
"https://raw.githubusercontent.com/saisuiu/uiu/main/free.txt"
"https://raw.githubusercontent.com/saschazesiger/Free-Proxies/master/proxies/http.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/http.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/https.txt"
"https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/http.txt"
"https://rootjazz.com/proxies/proxies.txt"
"https://sheesh.rip/http.txt"
"https://spys.me/proxy.txt"
"https://www.proxy-list.download/api/v1/get?type=https"
#
)
for url in "${urls[@]}"; do
  clear
  curl -s "$url" | grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk -F: '{print $1}' >> fulllist.txt
done
total=(`wc -l fulllist.txt`)
echo "TOTAL PROXIES: $total"
