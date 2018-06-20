#!/usr/bin/env bash

set -e

MYTMPDIR="$(mktemp -d)"
trap 'rm -rf "${MYTMPDIR}"' EXIT

COMMIT=HEAD

COMMITID="$( git rev-parse --short $COMMIT )"
TIMESTAMP="$( git show -s --format=%cd --date=format:'%Y%m%d-%H%M%S' $COMMIT )"

git -c core.autocrlf=false -c core.eol=lf archive HEAD | gzip > "${MYTMPDIR}/flask-bookshelf.tar.gz"
aws --profile downer-scratch s3 cp "${MYTMPDIR}/flask-bookshelf.tar.gz" s3://downer-codedeploy/flask-bookshelf-${TIMESTAMP}-${COMMITID}.tar.gz
