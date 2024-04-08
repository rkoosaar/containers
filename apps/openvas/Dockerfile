ARG VERSION
ARG REVISION

FROM immauss/openvas:latest-slim as base

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="pihole-unbound"
LABEL org.label-schema.description="Containerized pihole-unbound Image customised for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION

COPY main.cf /etc/postfix/main.cf
COPY redis.conf /etc/redis/redis.conf
COPY redis.sh /scripts/redis.sh

ENTRYPOINT /scripts/start.sh
