#!/bin/sh

: ${SRC:=/data}

die() {
  RC=$1
  shift
  echo $@
  exit $RC
}

[[ -z ${DST} ]]    && die 1 "Variable DST not set"
[[ -z ${HC_URL} ]] && die 1 "Variable HC_URL not set"

hc() {
  if [[ $1 = 0 ]] ; then
    curl -s ${HC_URL} > /dev/null
    die 0 "backup successful [ SRC=${SRC} DST=${DST} HC_URL=${HC_URL} ]"
  fi
  curl -s ${HC_URL}/fail > /dev/null
  die 0 "backup failed [ SRC=${SRC} DST=${DST} HC_URL=${HC_URL} ]"
}

echo "run backup:"
/rclone sync ${SRC} ${DST} -P && hc 0 || hc 1
