#!/bin/sh

set -e

mkdir -p /etc/letsencrypt/webroot

letsencrypt certonly -c /cli.ini