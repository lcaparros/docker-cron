FROM ubuntu:latest

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y cron curl

ENV NODE_VERSION 19

RUN \
  echo "**** install node and npm ****" && \
  curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
  apt-get update && \
  apt-get install -y nodejs && \
  node --version && \
  npm --version

RUN \
  echo "**** install useful npm packages ****" && \
  npm install -g run-func

WORKDIR /files
VOLUME /files

ENTRYPOINT { cat /files/crontab.txt; } | crontab - && cron && sleep infinity

ARG BUILD_DATE
ARG VERSION

LABEL version="lcaparros/<serviceName> - ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="lcaparros"
