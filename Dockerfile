FROM 300481/rclone:1.51.0-3.11.3

RUN apk -U --no-cache add ca-certificates curl

COPY run_backup.sh /

ENTRYPOINT [ "/run_backup.sh" ]
