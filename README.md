# docker-cron
Dockerize Cron Job

## Clone this repo

```
git clone git@github.com:fen9li/docker-cron.git
```

## Create docker image

```
cd /home/fli/docker-cron
sudo docker build -t fen9li/centos7-crond:1.0

[fli@192-168-1-6 docker-cron]$ sudo docker images
REPOSITORY             TAG                 IMAGE ID            CREATED              SIZE
fen9li/centos7-crond   1.0                 8457ab120043        About a minute ago   306MB
centos                 7                   1e1148e4cc2c        7 weeks ago          202MB
[fli@192-168-1-6 docker-cron]$ 
```

## Start container 

```
[fli@192-168-1-6 docker-cron]$ sudo docker run -d --rm --privileged=true --name=crond fen9li/centos7-crond:1.0
ed0e5f1c47bbaeef086b7152201f1255c0f85c0fd5d43faa25699f6ef143a31a
[fli@192-168-1-6 docker-cron]$ 
```

## Explore container

```
[fli@192-168-1-6 docker-cron]$ sudo docker ps -a
CONTAINER ID        IMAGE                      COMMAND                  CREATED              STATUS              PORTS               NAMES
ed0e5f1c47bb        fen9li/centos7-crond:1.0   "/bin/sh -c '/usr/sb…"   About a minute ago   Up About a minute                       crond
[fli@192-168-1-6 docker-cron]$ 

[fli@192-168-1-6 docker-cron]$ sudo docker exec crond cat /var/log/cron.log
Mon Jan 28 11:45:01 UTC 2019 Hello world
Mon Jan 28 11:46:01 UTC 2019 Hello world
Mon Jan 28 11:47:01 UTC 2019 Hello world
[fli@192-168-1-6 docker-cron]$ 
```

## Stop container, push docker image to registry
