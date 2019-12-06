---
title: Install Nginx
category: OS X
time: 1565426999884
---
### Install by homebrew

```
brew install nginx
```

### Check port usage

```
lsof -i tcp:80
```

### Launchd

+ On System Boot: `/Library/LaunchDaemons`
+ On User Login: `~/Library/LaunchAgents`

```shell
sudo cp /usr/local/opt/nginx/*.plist /Library/LaunchDaemons # here is system boot
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
```

### Reference

+ [在80端口启动Nginx](https://www.cnblogs.com/kavlez/p/start-nginx-on-port-80-at-os-x.html)
