#!/bin/sh

download_stream() {
  while [ true ]; do
    FULL_DATE=$(date +%Y.%m.%d-%H.%M.%S)
    DOWNLOADS_DIRECTORY="/output/${2}"
    mkdir -p "${DOWNLOADS_DIRECTORY}"

    STREAM_DOWNLOAD_FILE_NAME="${2}-${FULL_DATE}.mkv"
    STREAM_DOWNLOAD_PATH="${DOWNLOADS_DIRECTORY}/${STREAM_DOWNLOAD_FILE_NAME}"

    streamlink ${STREAM_OPTIONS} ${1} ${STREAM_QUALITY} -o "${STREAM_DOWNLOAD_PATH}"
    sleep 60s
  done
}

set -- ${TWITCH_CHANNELS}
for STREAM_LINK in $@; do
  STREAM_NAME=${STREAM_LINK##*/}
  download_stream ${STREAM_LINK} ${STREAM_NAME} &
done

wait
