FROM nginx:latest

RUN usermod -a -G www-data nginx

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]