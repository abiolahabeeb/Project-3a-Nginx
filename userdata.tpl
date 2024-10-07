#!/bin/bash -ex
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Hello Nginx Demo" > /var/www/html/index.html