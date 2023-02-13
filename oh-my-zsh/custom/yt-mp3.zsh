yt-mp3() {
  youtube-dl --extract-audio --embed-thumbnail --audio-format mp3 -o '~/Downloads/Tmp Musics/%(title)s.%(ext)s' $@
}
