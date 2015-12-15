#!/bin/sh

set -e

if [ "$1" = 'import' ]; then

	# untar data to root. tar structure reflects docker volume paths
	tar -C / -xvf /mnt/data.tar.gz

	# wait for mariadb container to be ready for import
	while ! mysqladmin ping -h web-mariadb --silent; do
	    sleep 1s
	done

	# import database dump and flush priviliges
	mysql -h web-mariadb < /tmp/db.sql
	mysql -h web-mariadb -e 'FLUSH PRIVILEGES;'

	# remove import data to save space
	rm /tmp/db.sql

elif [  "$1" = 'export' ]; then

	mysqldump -h web-mariadb -u root --single-transaction --all-databases > /tmp/db.sql

	tar -C / -zcvf /mnt/data.tar.gz \
		/var/www \
		/tmp/db.sql \
		/znc-data \
		/teamspeak3

fi
