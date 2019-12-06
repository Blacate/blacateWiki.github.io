---
title: ssh
category: Tools
time: 1487084966457
---
## Common Commands

#### Generate key

```
ssh-keygen -t rsa
```

#### Install public key on remote host
```
ssh-copy-id -i ~/.ssh/id_rsa.pub [-p port ] user@hostname
```

#### Delect old known host
```
ssh-keygen -f "~/.ssh/known_hosts" -R hostname
```

#### Reverse proxy
```
ssh -Nf -R 4444:localhost:80 user@hostname
autossh -CqTfnN -g -R 0.0.0.0:3500:0.0.0.0:3500 user@hostname
```
we can get the local port 80 by access hostname'localhost:4444

#### Socks proxy
```
ssh -qTnNf -D user@hostname
```

#### Config file
```
Host alias
Port 22
User root
HostName 114.114.114.114
IdentityFile ~/.ssh/id_rsa
```
Finally, we can use `ssh aliyun` to replace `ssh -i ~/.ssh/id_rsa -p 22 root@114.114.114.114`

#### Copy file
```
scp [-P port] [-r] user@hostname:/path/to/file /path/to/save
#or
scp [-P port] [-r] /path/to/file user@hostname:/path/to/save
```

## Parameter Description

```
-4 强制使用IPv4地址
-6 强制使用IPv6地址
-C 要求进行数据压缩
-D port
   指定一个本地（或随机）的端口转发流量到远程服务器
-F 指定ssh指令的配置文件
-f 后台执行ssh命令
-g 允许远端主机连接本地转发的端口
-i 指定身份文件
-L [localip:]port:host:hostport
   将本地的指定端口转发到远程服务器指定端口（可用于网关处代理内网机器）
-l 指定登录远程主机的用户，优先级高于user@hostname的user
-N 不执行远程命令，用于端口转发
-n 把stdin重定向到/dev/null
-p 指定远程服务器上的端口
-q 静默模式
-R [localip:]port:host:hostport
   将远程服务器的指定端口转发到本地的指定端口（常用于本地服务器没有公网ip）
-T 禁止分配伪终端
-t 强制分配伪终端
-X 开启X11转发功能
-x 关闭x11转发功能
-y 开启信任X11转发功能
```

## Reference

+ [ssh命令详解](http://blog.51cto.com/lxlxlx/1879390)
+ [ssh linux](http://linux.51yip.com/search/ssh)