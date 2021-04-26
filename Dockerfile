##########################################################################################

FROM alpine:3.13.5 AS downloader

RUN apk -U --no-cache add ca-certificates wget && \
    VERSION=v1.55.1 && \
    cd /tmp && \
    wget -q https://downloads.rclone.org/${VERSION}/rclone-${VERSION}-linux-amd64.zip && \
    unzip rclone-${VERSION}-linux-amd64.zip && \
    mkdir -p /rclone/root/.config/rclone /rclone/usr/bin /data && \
    mv rclone-${VERSION}-linux-amd64/rclone /rclone/ && \
    chmod 755 /rclone/rclone && \
    chown root:root /rclone/rclone

##########################################################################################

FROM alpine:3.13.5

RUN apk -U --no-cache add ca-certificates curl

COPY --from=downloader /rclone/ /
COPY run_backup.sh /

ENTRYPOINT [ "/run_backup.sh" ]

##########################################################################################
