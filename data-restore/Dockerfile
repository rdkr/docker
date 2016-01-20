FROM phusion/baseimage

# install mysql-client & duplicity
RUN apt-get update && apt-get install -y \
		mysql-client \
        duplicity \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]