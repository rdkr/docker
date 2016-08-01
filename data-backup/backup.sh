#!/bin/sh

set -e
 
mysqldump -h web-mariadb -u root --single-transaction --all-databases > /var/www/db.sql

duplicity --no-encryption --full-if-older-than 1M --s3-use-new-style /var/www s3://s3.amazonaws.com/rdkr-web
duplicity --no-encryption --full-if-older-than 1M --s3-use-new-style /etc/letsencrypt s3://s3.amazonaws.com/rdkr-le
duplicity --no-encryption --full-if-older-than 1M --s3-use-new-style /teamspeak3 s3://s3.amazonaws.com/rdkr-ts3

rm /var/www/db.sql