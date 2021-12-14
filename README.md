# backup-hc

Docker Container for making backups with rclone and update healthchecks.io

[![Docker Build](https://github.com/300481/backup-hc/actions/workflows/docker_build.yaml/badge.svg)](https://github.com/300481/backup-hc/actions/workflows/docker_build.yaml)

## volumes

* /root/.config/rclone
* /data

## environment

|Variable|Description|Default|
|--------|-----------|-------|
|`SRC`|Source folder|`/data`|
|`DST`|Destination||
|`HC_URL`|The Ping URL of healthchecks.io||

## example of run backup

```bash
docker run -it --rm -v $HOME/.config/rclone:/root/.config/rclone -v $PWD:/data -e DST="crypt:" -e HC_URL="https://hc-ping.com/ca0f77e9-9439-4831-9b2a-d8b8ec507efa" 300481/backup-hc:0.3.16
```
