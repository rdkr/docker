#!/bin/sh

set -e

# wait for files to import before launch

while ! [ -e /var/www/files-imported ]; do
    sleep 1s
done

# remove files imported flag so it isn't backed up
rm -f /var/www/files-imported

# make web files owned by nginx
chown -R nginx:nginx /var/www

nginx -g "daemon off;"