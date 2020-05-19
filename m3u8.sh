#!/bin/bash

cat /dev/null > out.log

for title in *.m3u8
do
    title=${title%.m3u8}
    echo ${title}
    sed -i '3d;5,9d;11,14d' "${title}.m3u8"

    ffmpeg -protocol_whitelist file,http,https,tcp,tls -nostdin -i `cat "${title}.m3u8" |grep SUBTITLES|head -1|awk -F, {'print $7'}|awk -F '"' {'print $2'}` "${title}.srt"

    nohup ffmpeg -protocol_whitelist file,http,https,tcp,tls -i "${title}.m3u8" -i "${title}.srt" -c copy -c:v h264 -preset ultrafast -crf 17 -bsf:a aac_adtstoasc -disposition:s:0 default "${title}-h264.mkv" 2> >(tee >> out.log) && kill -9 "$(ps aux|grep tail|grep pty0|awk {'print $1'})" &
    tail -f out.log | grep -m 1 "corrupt decoded frame" && echo "got it!" && kill -9 "$(ps aux|grep ffmpeg|awk {'print $1'})" && continue

    ffmpeg -i "${title}-h264.mkv" -c copy -c:v libx265 -crf 20 "${title}.mkv"
done
