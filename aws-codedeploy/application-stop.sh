#!/usr/bin/env bash

service nginx stop || true
service gunicorn stop || true
chkconfig nginx off || true
chkconfig gunicorn off || true