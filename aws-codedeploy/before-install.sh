#!/usr/bin/env bash

# Required services
yum update -y --security
yum install -y nginx
pip install gunicorn PyMysqlDB

# Clean up stuff that would otherwise cause CodeDeploy to fail with "file already exists"
rm -rf /var/www /etc/nginx/nginx.conf /etc/init.d/gunicorn

# Filesystem
install --owner nginx --group nginx --directory /var/www
