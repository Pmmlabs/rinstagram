#!/usr/bin/env bash

source session_id.sh
JQ="./jq"

get_stories(){
    curl "https://i.instagram.com/api/v1/feed/reels_media/?user_ids=$1" -H 'user-agent: Instagram 10.26.0 (iPhone7,2; iOS 10_1_1; en_US; en-US; scale=2.00; gamut=normal; 750x1334) AppleWebKit/420+' -H "cookie: sessionid=$session_id" --compressed | $JQ -r ".reels?, .|.\"$1\"?, .|.items?|.[]?|.image_versions2, .video_versions|.candidates?, .|.[0]?|.url" | wget -nc -P stories/$2 -i -
}

get_stories 8741863909 nechetnetort
get_stories 3226228792 eveliinushkaa
get_stories 3864627696 chetnetort
get_stories 272738625 alinalemonade
get_stories 536576138 kuuukas
