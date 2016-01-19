#!/bin/sh

set -e

if [ "$1" != 'incremental' ] && [ "$1" != 'full' ]; then exit; fi
 
mysqldump -h web-mariadb -u root --single-transaction --all-databases > /tmp/db.sql

duplicity $1 --no-encryption --allow-source-mismatch /var/www file:///mnt/www
duplicity $1 --no-encryption --allow-source-mismatch /tmp/db.sql file:///mnt/db
duplicity $1 --no-encryption --allow-source-mismatch /znc-data file:///mnt/znc-data
duplicity $1 --no-encryption --allow-source-mismatch /teamspeak3 file:///mnt/teamspeak3

rm /tmp/db.sql