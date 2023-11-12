ARG VERSION
ARG REVISION

FROM ghcr.io/rkoosaar/debian-slim:latest as base

LABEL maintainer="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.name="bw-cli"
LABEL org.label-schema.description="Containerized bw-cli Image customised for rkoosaar images."
LABEL org.label-schema.vendor="rkoosaar <rkoosaar@noreply.github.com"
LABEL org.label-schema.url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-url="https://github.com/rkoosaar/containers"
LABEL org.label-schema.vcs-ref=$REVISION

WORKDIR /usr/local/bin
RUN apt update && apt install -y curl unzip libsecret-1-0 jq
RUN export VER=$(curl -H "Accept: application/vnd.github+json" https://api.github.com/repos/bitwarden/clients/releases | jq  -r 'sort_by(.published_at) | reverse | .[].name | select( index("CLI") )' | sed 's:.*CLI v::' | head -n 1) && \
curl -LO "https://github.com/bitwarden/clients/releases/download/cli-v{$VER}/bw-linux-{$VER}.zip" \
&& unzip *.zip && chmod +x ./bw

RUN rm *.zip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

USER rkoosaar

CMD ["/entrypoint.sh"]