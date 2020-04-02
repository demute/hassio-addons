#!/bin/bash
export LANG=C
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json
GAIN="$(jq --raw-output '.gain' $CONFIG_PATH)"
echo "MrBeam gain =" $GAIN

/usr/local/bin/rtl_mrbeam -g $GAIN | while read channel; do
  export tsp="$(date +%s)"
  curl -s -X POST -H "Authorization: Bearer ${HASSIO_TOKEN}" -H "Content-Type: application/json" -d "{\"state\": \"${channel}_${tsp}\", \"attributes\":{\"channel\":$channel,\"tsp\":$tsp}}" "http://hassio/homeassistant/api/states/sensor.mrbeam"
done
