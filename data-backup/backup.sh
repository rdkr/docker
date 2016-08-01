#!/bin/sh

set -e
 
mysqldump -h web-mariadb -u root --single-transaction --all-databases > /var/www/db.sql

for i in \
	"/var/www s3://s3.amazonaws.com/rdkr-web" \
	"/etc/letsencrypt s3://s3.amazonaws.com/rdkr-le" \
	"/teamspeak3 s3://s3.amazonaws.com/rdkr-ts3" ; do
		
  duplicity --encrypt-key="F7887127" \
    		--sign-key="F7887127" \
    		--full-if-older-than 1M \
    		--s3-use-multiprocessing \
    		--s3-use-new-style $i
done 

rm /var/www/db.sql