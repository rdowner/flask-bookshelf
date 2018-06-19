#!/usr/bin/env bash

set -e

MYTMPDIR="$(mktemp -d)"
trap 'rm -rf "${MYTMPDIR}"' EXIT

git -c core.autocrlf=false -c core.eol=lf archive HEAD | gzip > "${MYTMPDIR}/flask-bookshelf.tar.gz"
aws --profile downer-scratch s3 cp "${MYTMPDIR}/flask-bookshelf.tar.gz" s3://downer-codedeploy
