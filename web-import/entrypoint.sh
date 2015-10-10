#!/bin/sh

while ! mysqladmin ping -h web-mariadb --silent; do
    sleep 1s
done

mysql -h web-mariadb < /tmp/db.sql

mysql -h web-mariadb -e 'FLUSH PRIVILEGES;'

rm /tmp/db.sql