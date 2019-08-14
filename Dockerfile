FROM quay.io/justcontainers/base-alpine:latest
MAINTAINER grimlock <grimlock@portnumber53.com>

# global environment settings
ENV RCLONE_VERSION="current"
ENV RCLONE_ARCH="amd64"

# install packages
RUN \
    apk update && \
    apk add --no-cache \
    ca-certificates

 # install build packages
RUN \
    apk add --no-cache --virtual=build-dependencies \
    wget \
    unzip && \
    cd tmp && \
    wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip && \
    unzip /tmp/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip && \
    mv /tmp/rclone-*-linux-${RCLONE_ARCH}/rclone /usr/bin && \
    apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community \
    shadow && \
    apk del --purge \
    build-dependencies && \
    rm -rf \
        /tmp/* \
        /var/tmp/* \
        /var/cache/apk/*

# create grimlock user
RUN \
    groupmod -g 1000 users && \
    useradd -u 911 -U -d /config -s /bin/false grimlock && \
    usermod -G users grimlock && \
    mkdir -p /config /app /defaults /data && \
    touch /var/lock/rclone.lock

# add local files
COPY root/ /

VOLUME ["/config"]
