FROM quay.io/letsencrypt/letsencrypt:latest

COPY cli-standalone.ini /
COPY cli-webroot.ini /

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
