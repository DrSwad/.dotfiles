yt-mp3() {
  youtube-dl --extract-audio --embed-thumbnail --audio-format mp3 --postprocessor-args "-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\"" -o '~/Downloads/Tmp Musics/%(title)s.%(ext)s' $@
}
