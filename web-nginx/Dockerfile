FROM nginx:latest

RUN usermod -a -G www-data nginx

COPY common /etc/nginx/common
COPY conf.d /etc/nginx/conf.d

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
