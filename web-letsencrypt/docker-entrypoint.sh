#!/bin/sh

set -e

if [ "$1" = 'standalone' ]; then
    
    mkdir -p /etc/letsencrypt/webroot

    letsencrypt certonly -c /cli.ini -a standalone

elif [ "$1" = 'webroot' ]; then

    letsencrypt certonly -c /cli.ini -a webroot
fi