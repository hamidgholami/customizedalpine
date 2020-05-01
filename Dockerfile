FROM alpine:latest

ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF

LABEL maintainer="Hamid Gholami hidgholami@gmail.com" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.ref=$VCS_REF \
      org.label-schema.docker-build.cmd="docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --build-arg VCS_URL="Repository-URL" --build-arg VCS_REF="Commit-ID" -t hamidgholami/alpine:jdk1.8u251 ." \
      org.label-schema.docker.cmd="docker run --rm -it hamidgholami/alpine:jdk1.8u251" \
      org.label-schema.description="This doker image contains latest image of alpine and install on it: wget,curl,openssl,java-jdk1.8u251,ca-certificates,wget,fonts(ttf-dejavu,fontconfig)" \
      org.label-schema.version="1.8.0_251"

COPY ["./java", "glibc-2.31-r0.apk", "/opt/"]

ENV JAVA_HOME=/opt/jdk1.8.0_251 \
    PATH=$PATH:/opt/jdk1.8.0_251/bin

RUN set -ex && \
    apk upgrade --update-cache --available && \
    apk add --no-cache --allow-untrusted /opt/glibc-2.31-r0.apk && \
    apk add --update openssl fontconfig ttf-dejavu curl ca-certificates wget && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
