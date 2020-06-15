FROM 300481/rclone:1.52.1-3.12.0

RUN apk -U --no-cache add ca-certificates curl

COPY run_backup.sh /

ENTRYPOINT [ "/run_backup.sh" ]
