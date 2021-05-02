#!/usr/bin/env bash
# Sets up the web servers for the deployment of web_static

sudo apt update && sudo apt upgrade -y
sudo apt install nginx -y
sudo mkdir -p /data/web_static/releases/test/ /data/web_static/shared/
echo "Test content" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
