#!/usr/bin/env bash

# Required services
yum update -y --security
yum install -y nginx
pip install gunicorn PyMysqlDB

# Clean up stuff that would otherwise cause CodeDeploy to fail with "file already exists"
rm -rf /var/www /etc/nginx/nginx.conf /etc/init.d/gunicorn

# Filesystem
install --owner nginx --group nginx --directory /var/www

# Install the CloudHealth agent
wget https://s3.amazonaws.com/remote-collector/agent/v19/install_cht_perfmon.sh -O /root/install_cht_perfmon.sh;
sh /root/install_cht_perfmon.sh 19 6e26eb2c-44c7-481a-8c1e-8b58a1901d2a aws;
