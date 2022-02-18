# forked from Shourai/vsftpd-alpine
FROM alpine:latest

LABEL Description="vsftpd Docker image based on Alpine Linux. Supports passive mode."

RUN apk --no-cache add vsftpd tzdata

ENV FTP_USER=username
ENV FTP_PASS=password
ENV PASV_ENABLE=YES
ENV PASV_MIN_PORT=21100
ENV PASV_MAX_PORT=21110
ENV PASV_ADDRESS=127.0.0.1
ENV ANON_ENABLE=NO
ENV NO_ANON_PASSWD=NO
ENV ANON_ROOT=/var/ftp

COPY vsftpd.sh /usr/sbin/
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN chmod +x /usr/sbin/vsftpd.sh

EXPOSE 20 21

ENTRYPOINT ["/usr/sbin/vsftpd.sh"]
