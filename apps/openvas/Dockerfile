ARG VERSION
ARG TARGETPLATFORM
ARG CHANNEL

FROM immauss/openvas:latest as base

COPY ./apps/openvas/files/redis.sh /scripts/redis.sh
COPY ./apps/openvas/files/redis.conf /etc/redis/redis.conf
COPY ./apps/openvas/files/postfix_main.cf /etc/postfix/main.cf
COPY ./apps/openvas/files/openvas.sh /scripts/openvas.sh
COPY ./apps/openvas/files/notus-scanner.sh /scripts/notus-scanner.sh

COPY ./apps/openvas/files/copycomplete /scripts/copycomplete

ENTRYPOINT /scripts/start.sh
