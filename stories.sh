#!/usr/bin/env bash

source session_id.sh
JQ="./jq"

curl 'https://i.instagram.com/api/v1/feed/reels_tray/' -H 'user-agent: Instagram 10.26.0 (iPhone7,2; iOS 10_1_1; en_US; en-US; scale=2.00; gamut=normal; 750x1334) AppleWebKit/420+' -H "cookie: sessionid=$session_id" --compressed | $JQ -r '.tray?, .|.[]?, .|.items?|.[]?|.image_versions2, .video_versions|.candidates?, .|.[0]?|.url' | wget -nc -P stories -i -
