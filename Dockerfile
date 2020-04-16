FROM alpine:3.11.5

RUN apk update
RUN apk add mpd
RUN apk add vim mpc

EXPOSE 6600

COPY mpd.conf /etc/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENV MPD_SERVER 127.0.0.1
ENV MPD_PORT 8000
ENV MPD_PASSWORD changeme
ENV MPD_NAME My MPD Stream

ENTRYPOINT ["/entrypoint.sh"]
