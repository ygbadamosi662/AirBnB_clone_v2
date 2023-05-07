#!/usr/bin/env bash
# Sets up a web server for deployment of web_static.

if [ ! -x "$(command -v nginx)" ]; then
    apt-get update
    apt-get -y install nginx
fi

mkdir -p /data/web_static/releases/test
mkdir -p /data/web_static/shared
mkdir -p /data/web_static/current

echo "Hello World" > /data/web_static/releases/test/index.html

ln -sf /data/web_static/releases/test /data/web_static/current

chown -R ubuntu:ubuntu /data/ && :

if ! grep -q hbnb_static /etc/nginx/sites-available/default; then
    sed -i '/^server {/a location /hbnb_static {\nalias /data/web_static/current/;\n}' /etc/nginx/sites-available/default
fi

service nginx restart && :

exit 0
