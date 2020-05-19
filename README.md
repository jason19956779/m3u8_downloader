# m3u8_downloader
A simple bash script for download and transcode m3u8 video stream to h.265 .mkv file.

---
**This script has been tested on Windows with GitBash.**<br/>
**To run in other environment may requires some modification.**<br/>

---

## The good
* It can download multiple `.m3u8` that put in the same directory, one at a time.
* It can preprocess your m3u8 file, if you need to.
* It can download subtitle in m3u8 then save as a srt file.
* It can bypass the ffmpeg download error without blocking the rest of the m3u8.


## Prerequisite
1. Bash terminal with coreutils. (Linux or Windows+GitBash)
2. [FFmpeg executable](https://www.ffmpeg.org/download.html) installed.

## How to use
1. Put your m3u8 file and m3u8.sh in the same directory.
2. Open a terminal at this directory, then run `./m3u8.sh`.
3. Wait until it's done.
4. Check the result, then you can delete `*.m3u8`, `*.srt` and `*-h264.mkv` if you like.
