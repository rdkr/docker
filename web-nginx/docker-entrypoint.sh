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

# set permissons
find /var/www -type d -exec chmod 755 {} \;
find /var/www -type f -exec chmod 644 {} \;
find /var/www -name "wp-config.php" -exec chmod 660 {} \;
find /var/www -name "wp-content" -exec chmod -R 775 {} \;
find /var/www -name "wp-content" -exec chmod 664 {} \;

# start nginx
nginx -g "daemon off;"
