FROM alpine

RUN apk add git bash mdadm moreutils smartmontools python3 pacman && rm -rf /var/cache/apk/*

RUN git clone https://github.com/prometheus-community/node-exporter-textfile-collector-scripts.git node-exporters && cd node-exporters && git checkout 23b0aa0d5b0db999795c752685b8b38d7a61e91a
RUN mkdir -p /var/run/node-exporter-textfile

COPY ./crontab /var/spool/cron/crontabs/root

CMD [ "/usr/sbin/crond", "-f", "-l", "1", "-L", "/dev/stdin"]
