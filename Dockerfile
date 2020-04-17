FROM alpine:3.11.5

RUN apk update
RUN apk add mpd
RUN apk add vim mpc

EXPOSE 6600

COPY mpd.conf /etc/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENV DOCKER_MPD_SERVER 127.0.0.1
ENV DOCKER_MPD_PORT 8000
ENV DOCKER_MPD_PASSWORD changeme
ENV DOCKER_MPD_NAME My MPD Stream
ENV DOCKER_MPD_MOUNT /stream.mp3

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["ash"]
