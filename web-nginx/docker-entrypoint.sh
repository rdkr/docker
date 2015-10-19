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

# set permissons (from macbleser github script)
find /var/www -type d -exec chmod 755 {} \;
find /var/www -type f -exec chmod 644 {} \;
find /var/www -name "wp-config.php" -exec chmod 660 {} \;
find /var/www -name "wp-config.php" -exec echo "define ('FS_METHOD','direct')" >> {} \;
for i in $(find /var/www -name "wp-content" -type d); do find $i -type d -exec chmod 775 {} \;; done
for i in $(find /var/www -name "wp-content" -type d); do find $i -type f -exec chmod 664 {} \;; done

# add fs method to wp configs (not sure why this is necessary!?)
for i in $(find /var/www -name "wp-config.php"); do echo "define ('FS_METHOD','direct');" >> $i; done;

# start nginx
nginx -g "daemon off;"
