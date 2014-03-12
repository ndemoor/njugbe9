#!/bin/sh

# add default apt repo
echo "deb http://archive.ubuntu.com/ubuntu/ precise main universe" >> /etc/apt/sources.list
apt-get update

# install nginx stable
apt-get install -y python-software-properties software-properties-common
add-apt-repository ppa:nginx/stable
apt-get update
apt-get install -y nginx

# disable default host
sudo rm /etc/nginx/sites-enabled/default

# add application docker proxy host
touch /etc/nginx/conf.d/app_containers.conf
cp /vagrant/app.nginx.conf /etc/nginx/sites-available/app
ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
