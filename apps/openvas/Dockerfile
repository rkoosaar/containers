ARG VERSION
ARG REVISION

FROM immauss/openvas:latest as base

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="openvas"
LABEL org.label-schema.description="Containerized openvas image customised for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION

COPY postfix_main.cf /etc/postfix/main.cf
COPY redis.conf /etc/redis/redis.conf
COPY redis.sh /scripts/redis.sh

COPY openvas.sh /scripts/openvas.sh
COPY notus-scanner.sh /scripts/notus-scanner.sh

COPY copycomplete /scripts/copycomplete

ENTRYPOINT /scripts/start.sh
