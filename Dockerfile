FROM alpine:3.11.5

RUN apk update
RUN apk add mpd
RUN apk add vim mpc

EXPOSE 6600

COPY mpd.conf /etc/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

#CMD ["ash"]
CMD ["/entrypoint.sh"]
