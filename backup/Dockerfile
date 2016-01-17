FROM ubuntu:14.04

# install duplicity
RUN apt-get update && apt-get install -y \
		mysql-client \
        duplicity \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# add crontab file in the cron directory
ADD backup.crontab /etc/cron.d/

# add backup script
ADD backup.sh /

# Run the command on container startup
CMD cron -f