#!/bin/bash
/usr/local/bin/rtl_mrbeam | while read channel; do
  export tsp="$(date +%s)"
  curl -s -X POST -H "Authorization: Bearer ${HASSIO_TOKEN}" -H "Content-Type: application/json" -d "{\"state\": \"${channel}_${tsp}\", \"attributes\":{\"channel\":$channel,\"tsp\":$tsp}}" "http://hassio/homeassistant/api/states/sensor.mrbeam"
done
