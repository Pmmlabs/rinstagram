#!/usr/bin/env bash

source session_id.sh
JQ="./jq"
LIVE="live.json"

curl 'https://i.instagram.com/api/v1/feed/reels_tray/' -H 'user-agent: Instagram 10.26.0 (iPhone7,2; iOS 10_1_1; en_US; en-US; scale=2.00; gamut=normal; 750x1334) AppleWebKit/420+' -H "cookie: sessionid=$session_id" --compressed > $LIVE
#/v1/live/get_suggested_broadcasts
ids=$(cat $LIVE | $JQ -r '.broadcasts|.[]|.id')
for id in $ids
do
    if [ ! -d "$id" ]; then
        ./dash-proxy/dashproxy.py --disable-formatter -o $id $(cat $LIVE | $JQ -r ".broadcasts|.[]| select(.id == $id)|[.dash_abr_playback_url,.dash_playback_url,.dash_live_predictive_playback_url]|.[0]") > $id.log 2>&1 &
    fi
done
