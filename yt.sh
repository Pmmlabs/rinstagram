URL="https://www.youtube.com/channel/*****/live"

if [ "$(cat yt_lock)" == "1" ]
then
  echo "locked"
else
  echo "unlocked"
  echo 1 > yt_lock
  youtube-dl $URL
  rm yt_lock
fi
