---
title: Let's Encrypt
category: Security
time: 1487067405413
---

#### Nginx Config
```
server {
    listen 80;
    server_name example.com www.example.com;

    location /.well-known {
        default_type "text/plain";
        root /usr/share/nginx/html; 
    }

    location / {
        return 301 https://$host$request_uri;
    }
}
```

#### Install Certbot


```
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install certbot
```

#### Get Certs

```
certbot certonly --webroot -w /usr/share/nginx/html -d example.com
```  

#### Add NGINX Cofig

```
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name example.com;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
    keepalive_timeout    70;
    ssl_session_cache    shared:SSL:10m;
    ssl_session_timeout  10m;

    ssl_dhparam /etc/ssl/certs/dhparam.pem;

    add_header Strict-Transport-Security max-age=63072000;
    add_header X-Frame-Options SAMEORIGIN;
    add_header X-Content-Type-Options nosniff;

    access_log /var/log/nginx/example.access.log;
    error_log /var/log/nginx/example.error.log;

    root /opt/www/example.com;

    location /.git {
        deny all;
    }
}
 ```

#### Tese Renew Job

 ```
 certbot renew --dry-run
 ```

#### Set Cron Job

```
30 23 * * 2,5 certbot renew -q && service nginx reload
```

#### Test NGINX
```
nginx -t
service nginx reload
```

#### Refer
[PhoenixlzxWiki](https://wiki.phoenixlzx.com/)  
[CertBot](https://certbot.eff.org/)

