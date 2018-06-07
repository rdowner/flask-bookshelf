#!/usr/bin/env bash

chkconfig gunicorn on
chkconfig nginx on
service gunicorn start
service nginx start
