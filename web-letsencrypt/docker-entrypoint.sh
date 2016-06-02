#!/bin/sh

set -e

certbot certonly --text --non-interactive --agree-tos --expand --rsa-key-size 4096 --webroot --webroot-path  /etc/letsencrypt/webroot --email neelradhakrishnan@gmail.com --domains rdkr.uk,neel.rdkr.uk,www.neel.rdkr.uk,www.rdkr.uk,scgf.rdkr.uk,www.brumlions.co.uk,brumlions.co.uk,www.rdkr.ca,rdkr.ca,www.saveoursudbrooke.uk,saveoursudbrooke.uk,forum.saveoursudbrooke.uk,www.sudbrookepreschool.org.uk,sudbrookepreschool.org.uk,brexit.review,www.brexit.review
