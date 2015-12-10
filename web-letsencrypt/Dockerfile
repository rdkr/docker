FROM quay.io/letsencrypt/letsencrypt:latest

COPY cli.ini /

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]