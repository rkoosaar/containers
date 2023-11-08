ARG VERSION="3.18.4"
ARG REVISION=""

FROM alpine:$VERSION

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="rkoosaar/alpine-base"
LABEL org.label-schema.description="Base Image customised for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION

USER root

RUN addgroup -S rkoosaar --gid 314
RUN adduser -S rkoosaar --uid 314 -G rkoosaar

RUN apk add --no-cache tini

RUN mkdir /data && chown rkoosaar:rkoosaar /data
RUN mkdir /config && chown rkoosaar:rkoosaar /config

VOLUME ["/data", "/config"]
ENTRYPOINT ["/sbin/tini", "--"]
