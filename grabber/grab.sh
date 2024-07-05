#!/bin/bash
urls=(
"https://api.proxyscrape.com/?request=displayproxies&proxytype=http"
"https://www.proxy-list.download/api/v1/get?type=http"
"https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/http.txt"
"https://api.openproxylist.xyz/http.txt"
"https://raw.githubusercontent.com/shiftytr/proxy-list/master/proxy.txt"
"https://alexa.lr2b.com/proxylist.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-http.txt"
"https://raw.githubusercontent.com/clarketm/proxy-list/master/proxy-list-raw.txt"
"https://raw.githubusercontent.com/sunny9577/proxy-scraper/master/proxies.txt"
"https://raw.githubusercontent.com/opsxcq/proxy-list/master/list.txt"
"https://proxy-spider.com/api/proxies.example.txt"
"https://multiproxy.org/txt_all/proxy.txt"
"https://raw.githubusercontent.com/roosterkid/openproxylist/main/HTTPS_RAW.txt"
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=http"
"https://openproxylist.xyz/http.txt"
"https://raw.githubusercontent.com/almroot/proxylist/master/list.txt"
"https://raw.githubusercontent.com/aslisk/proxyhttps/main/https.txt"
"https://raw.githubusercontent.com/B4RC0DE-TM/proxy-list/main/HTTP.txt"
"https://raw.githubusercontent.com/hendrikbgr/Free-Proxy-Repo/master/proxy_list.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-https.txt"
"https://raw.githubusercontent.com/mmpx12/proxy-list/master/http.txt"
"https://raw.githubusercontent.com/mmpx12/proxy-list/master/https.txt"
"https://raw.githubusercontent.com/proxy4parsing/proxy-list/main/http.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/http.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/https.txt"
"https://rootjazz.com/proxies/proxies.txt"
"https://www.proxy-list.download/api/v1/get?type=https"
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=http&timeout=10000&country=all&ssl=all&anonymity=all"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/archive/txt/proxies-http.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/archive/txt/proxies-https.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-http.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-https.txt"
"https://api.proxyscrape.com/?request=displayproxies&proxytype=http&country=all"
"https://api.proxyscrape.com/?request=displayproxies&proxytype=https&country=all"
"https://raw.githubusercontent.com/Go0p/emmmm/master/data/Proxy_pool/proxy_pool.txt"
"https://raw.githubusercontent.com/MITSUKI-IID/IG-FREE/main/Data/proxy2.txt"
"https://raw.githubusercontent.com/Nem4/viewerbot/master/Proxies_txt/good_proxy.txt"
"https://raw.githubusercontent.com/ShenXuGongZi/FanHaoSearch/master/Win_Client/proxy_list.txt"
"https://raw.githubusercontent.com/coder-pig/ReptileSomething/master/proxy_ip.txt"
"https://raw.githubusercontent.com/hktalent/myhktools/master/proxy/autoProxy.txt"
"https://raw.githubusercontent.com/jorgenkg/python-proxy-rotator/master/proxy/proxylist.txt"
"https://raw.githubusercontent.com/metaotao/doubanbook/master/file/proxyip.txt"
"https://raw.githubusercontent.com/monosans/proxy-list/main/proxies/http.txt"
"https://raw.githubusercontent.com/monosans/proxy-list/main/proxies_anonymous/http.txt"
"https://raw.githubusercontent.com/proxy4parsing/proxy-list/main/http_old.txt"
"https://raw.githubusercontent.com/redtrib3/Brutal-FX/master/Proxy-List.txt"
"https://raw.githubusercontent.com/ysc/superword/master/src/main/resources/proxy_ips.txt"
"https://raw.githubusercontent.com/zeynoxwashere/proxy-list/main/http.txt"
#sock4
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks4"
"https://openproxylist.xyz/socks4.txt"
"https://raw.githubusercontent.com/B4RC0DE-TM/proxy-list/main/SOCKS4.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-socks4.txt"
"https://raw.githubusercontent.com/roosterkid/openproxylist/main/SOCKS4_RAW.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/socks4.txt"
"https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt"
"https://www.proxy-list.download/api/v1/get?type=socks4"
"https://api.proxyscrape.com/?request=displayproxies&proxytype=socks4&country=all"
"https://api.proxyscrape.com/?request=displayproxies&proxytype=socks5&country=all"
"https://api.openproxylist.xyz/socks4.txt"
"https://api.openproxylist.xyz/socks5.txt"
#
#sock5
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks5&timeout=10000&country=all&simplified=true"
"https://www.proxy-list.download/api/v1/get?type=socks5"
"https://www.proxyscan.io/download?type=socks5"
"https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks5.txt"
"https://raw.githubusercontent.com/hookzof/socks5_list/master/proxy.txt"
"https://raw.githubusercontent.com/ShiftyTR/Proxy-List/master/socks5.txt"
"https://raw.githubusercontent.com/jetkai/proxy-list/main/online-proxies/txt/proxies-socks5.txt"
"https://api.openproxylist.xyz/socks5.txt"
"https://www.freeproxychecker.com/result/socks5_proxies.txt"
"https://api.proxyscrape.com/v2/?request=getproxies&protocol=socks5"
"https://raw.githubusercontent.com/B4RC0DE-TM/proxy-list/main/SOCKS5.txt"
"https://raw.githubusercontent.com/manuGMG/proxy-365/main/SOCKS5.txt"
"https://raw.githubusercontent.com/mmpx12/proxy-list/master/socks5.txt"
"https://raw.githubusercontent.com/roosterkid/openproxylist/main/SOCKS5_RAW.txt"
"https://raw.githubusercontent.com/saschazesiger/Free-Proxies/master/proxies/socks5.txt"
)
rm -Rf fulllist.txt
clear

total_urls=${#urls[@]}
processed=0

echo "Starting to fetch proxies from $total_urls sources."
echo -n "Processed $processed/$total_urls"

for url in "${urls[@]}"; do
  curl -s "$url" | grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk -F: '{print $1}' >> fulllist.txt
  processed=$((processed + 1))
  echo -ne "\rProcessed $processed/$total_urls"
done

echo -ne "\rProcessed $total_urls/$total_urls"
echo -e "\nFiltering Duplicates"; bash unique.sh
echo -e "Validating IPs"; bash validate.sh

total=$(wc -l < valid.txt)
echo -e "TOTAL UNIQUE PROXIES: $total"
