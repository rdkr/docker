#!/bin/sh
set -e

if [ "$1" = 'import' ]; then

	# untar data to root. tar structure reflects docker volume paths
	tar -C / -xvf /tmp/data/data.tar.gz

	# make web files owned by www-data
	chown -R www-data /var/www
	chgrp -R www-data /var/www

	# wait for mariadb container to be ready for import
	while ! mysqladmin ping -h web-mariadb --silent; do
	    sleep 1s
	done

	# import database dump and flush priviliges
	mysql -h web-mariadb < /tmp/db/db.sql
	mysql -h web-mariadb -e 'FLUSH PRIVILEGES;'

	# remove import data to save space
	rm -r /tmp/db
	rm data.tar.gz

elif [  "$1" = 'export' ]; then

	echo "run export"

	# tar -C / -

fi