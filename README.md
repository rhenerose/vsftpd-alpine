# [vsftpd-alpine](https://hub.docker.com/r/rhene/vsftpd-alpine)  
forked from shourai/vsftpd-alpine  
![GitHub stars](https://img.shields.io/github/stars/rhenerose/vsftpd-alpine?logo=github) ![Docker Stars](https://img.shields.io/docker/stars/rhene/vsftpd-alpine?label=stars&logo=docker) ![Docker Pulls](https://img.shields.io/docker/pulls/rhene/vsftpd-alpine?label=pulls&logo=docker)

# Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/rhenerose/vsftpd-alpine/blob/main/Dockerfile) ![Docker Image Size (alpine)](https://img.shields.io/docker/image-size/rhene/vsftpd-alpine/latest?label=alpine&logo=latest%20Linux&style=plastic)

A Docker container based on alpine which implements vsftpd.  
Add Coustom config file and `tzdata`.

This image can be downloaded from dockerhub
```
docker pull rhene/vsftpd-alpine
```

## Environment variables

The defaults are:
```
FTP_USER=username
FTP_PASS=password
PASV_ENABLE=YES
PASV_MIN_PORT=21100
PASV_MAX_PORT=21110
PASV_ADDRESS=127.0.0.1
ENV ANON_ENABLE=NO
ENV NO_ANON_PASSWD=NO
ENV ANON_ROOT=/var/ftp
```
Change `FTP_USER` and `FTP_PASS` to your liking.
Set the `PASV_ADDRESS` to your server ip.


## Examples

Change the variables like username, password and server ip to your liking.

```
docker run -d \
-v $(pwd)/data:/home/<username> \
-e FTP_USER=<username> -e FTP_PASS=<password> \
-e PASV_ADDRESS=<server ip> -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
--name vsftpd rhene/vsftpd
```

### docker-compose
```
version: '3.8'
services:
  vsftpd:
    image: rhene/vsftpd-alpine
    container_name: vsftpd
    environment:
      - FTP_USER=username
      - FTP_PASS=password
      - PASV_ENABLE=YES
      - PASV_ADDRESS=127.0.0.1
      - PASV_MIN_PORT=21100
      - PASV_MAX_PORT=21110
      - ANON_ENABLE=NO
      - NO_ANON_PASSWD=NO
      - ANON_ROOT=/var/ftp
    volumes:
      - ./data:/home/username
    ports:
      - "20:20"
      - "21:21"
      - "21100-21110:21100-21110"
    restart: always
```
