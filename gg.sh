FFMPEG="../../ffmpeg/ffmpeg"
URL="https://hls.goodgame.ru/hls/123456.m3u8"

if [ "$(curl -s -o /dev/null -w '%{http_code}' $URL)" == "200" ]
then
    echo "yes"
    if [ "$(cat gg_lock)" == "1" ]
    then
   	  echo "locked"
    else
	    echo "unlocked"
      echo 1 > gg_lock
	    $FFMPEG -protocol_whitelist file,https,tls,hls,tcp -i $URL -c copy gg_`date +%x_%X`.ts
      rm gg_lock
    fi
else
    echo "no"
fi
