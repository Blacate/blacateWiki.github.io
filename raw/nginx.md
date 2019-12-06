---
title: Nginx
category: Web Server
time: 1486914736251
---

#### Default Configuration
```nginx
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /usr/share/nginx/html;
    idnex index.html index.htm index.nginx-debian.html;
    server_name _;

    location / {
        try_files $uri/ =404;
    }

    location /.git {
        deny all;
    }
}
```
#### Http To Https Configuration
```nginx
server {
    listen 80;
    server_name www.example.com;

	location /.well-known {
	    default_type "text/plain";
   		root /usr/share/nginx/html; 
    }

	location / {
        return 301 https://$host$request_uri;
	}
}
```
with default configuration and http to https configuration,  
we can use letsencrypt to get certs for any domain which resolve to this host.

#### Simple Directory Index configuration
```nginx
server {
    listen 80;
    server_name www.example.com;
    root /var/www/html;
    access_log /var/log/nginx/example.access.log;
    error_log /var/log/nginx/example.error.log;

    location / {
        autoindex on;
        autoindex_exact_size off;
        autoindex_localtime on;
        charset utf-8;
    }
}
```

#### ReverseProxy
```nginx
server {
    listen 80;
    server_name new-site.com;

    location / {
        proxy_pass http://origin-site.com/;
        proxy_redirect default;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forward-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        port_in_redirect    on;
        server_name_in_redirect off;
        proxy_connect_timeout 300;
    }
}
```

#### Nginx with ssl
Generate a stronger DHE parameter

```bash
cd /etc/ssl/certs
openssl dhparam -out dhparam.pem 4096
```

then 

```nginx
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

#### For api proxy
```nginx
location /api/ {
		proxy_pass http://hostname:port/;
		proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forward-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
		break;
	}

```

#### Increase HTTP Post Size Limit
```nginx
server {
    #...
    client_max_body_size 100m;
    #...
}
```

#### Setup Basic-Auth on NGINX
Install `apache2-utils`

```shell
sudo apt-get install apache2-utils
```

Create User and password

```shell
sudo htpasswd -c /etc/nginx/.htpasswd username
```

Add to Nginx site config

```nginx
server {
    ...
    location / {
        ...
        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/.htpasswd;  #For Basic Auth
    }
}
```

#### CORS Config
```nginx
add_header 'Access-Control-Allow-Origin' "www.example.com";
add_header 'Access-Control-Allow-Credentials' 'true';
add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT, DELETE, OPTIONS';
add_header 'Access-Control-Allow-Headers' 'Accept,Authorization,Cache-Control,Content-Type,DNT,If-Modified-Since,Keep-Alive,Origin,User-Agent,X-Mx-ReqToken,X-Requested-With'; 
```

#### IP Whitelist

```nginx
location / {
    allow 1.1.1.1;  
    allow 192.168.1.0/24;  
    deny all; 
    ...
}
```

#### My IP

```nginx
location /ip {
	default_type text/plain;
	return 200 "$remote_addr\n";
}
```

#### For Vue Use

```nginx
location / {
	try_files $uri $uri/ /index.html last;
}
```

#### Websocket Proxy

```nginx
location /wsapp/ {
    proxy_pass http://wsbackend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
}
```

#### Multi File Backup

```nginx
location / {
    root /path/to/file;
    try_files $uri $uri/ @backup;
}
location @backup {
    proxy_pass https://backup-server.com;
    proxy_set_header X-Real-IP  $remote_addr;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```



Reference:

+ [nginx-phoeixWiki](https://wiki.phoenixlzx.com/page/NGINX/)
+ [DigitalOcean Tutorials](https://www.digitalocean.com/community/tutorials/how-to-set-up-password-authentication-with-nginx-on-ubuntu-14-04)

+ [websocket-nginx](https://www.nginx.com/blog/websocket-nginx/)

