FROM alpine

ARG BUILD_DATE
ARG VERSION
LABEL version="lcaparros/<serviceName> - ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="lcaparros"

RUN \
  echo "**** install packages ****" && \
  apk update && \
  apk add --no-cache --virtual=build-dependencies \
    curl && \
  echo "**** cleanup ****" && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/* \
    /root/.cache \
    /root/.cargo

WORKDIR /files
VOLUME /files
EXPOSE 8080

ENTRYPOINT ["ls", "-l"]