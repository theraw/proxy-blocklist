FROM ubuntu:22.04

RUN apt-get update; apt-get install curl git -y
RUN git clone https://github.com/theraw/proxy-blocklist.git; cd proxy-blocklist/grabber; bash grab.sh; bash build.sh; git config user.name theraw; git config user.email raw@dopehosting.net; git add .; git commit -m "Refreshing database"; git push https://theraw:${{ secrets.G_TOKEN }}@github.com/theraw/proxy-blocklist.git --all
