#!/bin/sh

set -e

# restore files
duplicity restore --no-encryption --allow-source-mismatch file:///mnt/www /var/www
duplicity restore --no-encryption --allow-source-mismatch file:///mnt/znc-data /znc-data
duplicity restore --no-encryption --allow-source-mismatch file:///mnt/teamspeak3 /teamspeak3

# wait for mariadb container to be ready for import
while ! mysqladmin ping -h web-mariadb --silent; do
    sleep 1s
done

# import database dump and flush priviliges
mysql -h web-mariadb < /var/www/db.sql
mysql -h web-mariadb -e 'FLUSH PRIVILEGES;'

# remove import data to save space
rm /var/www/db.sql