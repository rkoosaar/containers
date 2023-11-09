ARG VERSION=$PIHOLE_DOCKER_TAG
ARG REVISION

FROM ghcr.io/pi-hole/pihole:latest as base

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="pihole-unbound"
LABEL org.label-schema.description="Containerized pihole-unbound Image customed for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION

RUN apt update && apt install -y unbound

COPY lighttpd-external.conf /etc/lighttpd/external.conf
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY 99-edns.conf /etc/dnsmasq.d/99-edns.conf
RUN mkdir -p /etc/services.d/unbound
RUN mkdir -p /var/log/unbound
COPY unbound-run /etc/services.d/unbound/run
RUN chmod u+xwr,g+xwr /etc/services.d/unbound/run

ENTRYPOINT ./s6-init