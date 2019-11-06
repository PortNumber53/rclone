FROM alpine:latest
MAINTAINER grimlock <grimlock@portnumber53.com>

# global environment settings
ARG RCLONE_VERSION="current"
ARG RCLONE_ARCH="amd64"

RUN apk --no-cache add ca-certificates fuse wget \
    && cd /tmp \
    && wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
    && mv /tmp/rclone-*-linux-${RCLONE_ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone* \
    && addgroup rclone \
    && adduser -h /config -s /bin/ash -G rclone -D rclone

USER rclone

VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/rclone"]

CMD ["--version"]
