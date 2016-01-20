# docker
## TODO
- letsencrypt: cron renewal - part of backup?
- nginx: security config
```
# http://tautt.com/best-nginx-configuration-for-security/
server_tokens off;
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
```
