FROM mariadb

COPY data/www /var/www
COPY data/nginx/common/ /etc/nginx/common/
COPY data/nginx/conf.d/ /etc/nginx/conf.d/

RUN chgrp -R www-data /var/www

COPY data/db.sql /tmp/db.sql
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/var/www", "/etc/nginx/common/", "/etc/nginx/conf.d/", "/var/lib/mysql"]