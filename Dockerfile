FROM ubuntu:latest

ARG BUILD_DATE
ARG VERSION

LABEL version="lcaparros/<serviceName> - ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="lcaparros"

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y cron curl && \
  curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
  apt-get install -y nodejs && \
  node --version && \
  npm --version

WORKDIR /files
VOLUME /files

ENTRYPOINT { cat /files/crontab.txt; } | crontab - && cron && sleep infinity