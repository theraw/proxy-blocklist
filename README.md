# proxy-blocklist
Pre-ban public proxies used for L7 attacking or other spam/attacks. Ban list prebuild available for nginx, iptables or route.


# Nginx
You can make a cronjob to run once in a month (replace `/nginx/conf.d/nginx_blacklist.conf` with your nginx `conf.d` folder assuming nginx.conf will load anything that's into `conf.d` folder.)

```
curl -s https://raw.githubusercontent.com/theraw/proxy-blocklist/main/nginx_blacklist.conf > /nginx/conf.d/nginx_blacklist.conf
```

# Iptables




# Route
Route bans most times will get flushed automatically when you reboot your server so what u can do is add a crontab that executes this command on @reboot and reboot your server once in a month to refresh bans (maybe can cause boot delay since theres tons of ips? i suggest creating a init script that automatically starts after network is available `After=network.target`).
```
curl -s https://raw.githubusercontent.com/theraw/proxy-blocklist/main/route_ban.sh |  bash -s
```


# How to refresh proxies yourself?
```
cd /tmp; git clone https://github.com/theraw/proxy-blocklist.git
cd /tmp/proxy-blocklist/grabber/; bash grab.sh
# ^^ this will pull all public proxy ips now to build the format you want nginx, iptables or route use build.sh
cd /tmp/proxy-blocklist/grabber/; bash build.sh
# ^^ this will ask what list would you like to build so you'll have to write one list will be created/updated on folder /tmp/proxy-blocklist/
```
