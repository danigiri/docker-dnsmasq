# run as root on default port:
# docker run --rm -p 53:53 -p 53:53/udp --cap-add=NET_BIND_SERVICE --cap-add=NET_ADMIN --cap-add=NET_RAW danigiri/docker-dnsmasq /etc/dnsmasq.conf -8 -

FROM gliderlabs/alpine:3.3

MAINTAINER Daniel Giribet 'dani@calidos.cat'

RUN apk add --no-cache dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf
RUN mkdir /etc/dnsmasq.d
#EXPOSE 53
ENTRYPOINT ["/usr/sbin/dnsmasq", "--keep-in-foreground", "-C"]
#ENTRYPOINT ["/usr/sbin/dnsmasq", "--no-daemon", "-C"]
CMD ["/etc/dnsmasq.conf"]
