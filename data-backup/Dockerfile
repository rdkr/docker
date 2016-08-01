FROM phusion/baseimage

# install mysql-client & duplicity
RUN apt-get update && apt-get install -y \
		mysql-client \
        duplicity \
        python-boto \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# add crontab file in the cron directory
ADD backup.cron /etc/cron.d/backup
RUN chmod 644 /etc/cron.d/backup

# add backup script
ADD backup.sh /
RUN chmod +x /backup.sh

# add public key
ADD neel.asc /
RUN gpg --import /neel.asc

# Run the command on container startup
CMD ["/sbin/my_init"]