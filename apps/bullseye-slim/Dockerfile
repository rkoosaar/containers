ARG DEBIAN_VERSION=bullseye-slim
FROM debian:${DEBIAN_VERSION}

ARG DEBIAN_VERSION
ENV phpver="php"

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="rkoosaar/ubuntu"
LABEL org.label-schema.description="Base Image customised for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION



# curl in armhf-buster's image has SSL issues. Running c_rehash fixes it.
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=923479
RUN if [ "$DEBIAN_VERSION" = "buster-slim" ]; then c_rehash; fi


# ARG VERSION=""
# ARG REVISION=""
# ARG DEBIAN_FRONTEND=noninteractive

# FROM ubuntu:${VERSION}

# ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

# LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
# LABEL org.label-schema.name="rkoosaar/ubuntu"
# LABEL org.label-schema.description="Base Image customed for rkoosaar images."
# LABEL org.label-schema.vendor="rkoosaar"
# LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
# LABEL org.label-schema.version=$VERSION
# LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
# LABEL org.label-schema.vcs-ref=$REVISION

# USER root

# RUN set -eux \
#     && echo 'APT::Install-Recommends "false";' >/etc/apt/apt.conf.d/00recommends \
#     && echo 'APT::Install-Suggests "false";' >>/etc/apt/apt.conf.d/00recommends \
#     && echo 'APT::Get::Install-Recommends "false";' >>/etc/apt/apt.conf.d/00recommends \
#     && echo 'APT::Get::Install-Suggests "false";' >>/etc/apt/apt.conf.d/00recommends


# RUN apt-get update && apt-get install -y --no-install-recommends locales bash tini && rm -rf /var/lib/apt/lists/*

# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#     dpkg-reconfigure --frontend=noninteractive locales


# RUN adduser rkoosaar --uid 314 --group --system --disabled-password --gecos "" --home /home/rkoosaar

# RUN mkdir /data && chown rkoosaar:rkoosaar /data
# RUN mkdir /config && chown rkoosaar:rkoosaar /config

# VOLUME ["/data", "/config"]
# ENTRYPOINT ["/usr/bin/tini", "--"]
