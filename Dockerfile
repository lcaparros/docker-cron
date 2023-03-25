FROM ubuntu:latest

ARG BUILD_DATE
ARG VERSION
LABEL version="lcaparros/<serviceName> - ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="lcaparros"

RUN \
  echo "**** install packages ****" && \
  apt update && \
  apt install -y cron

WORKDIR /files
VOLUME /files

ENTRYPOINT { cat /files/crontab.txt; } | crontab - && cron && sleep infinity