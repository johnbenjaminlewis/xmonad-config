#!/bin/bash


# Play/Pause
playPause() {
    dbus-send --print-reply \
              --dest=org.mpris.MediaPlayer2.spotify \
              /org/mpris/MediaPlayer2 \
              org.mpris.MediaPlayer2.Player.PlayPause
}


next() {
    dbus-send --print-reply \
              --dest=org.mpris.MediaPlayer2.spotify \
              /org/mpris/MediaPlayer2 \
              org.mpris.MediaPlayer2.Player.Next
}


previous() {
    dbus-send --print-reply \
              --dest=org.mpris.MediaPlayer2.spotify \
              /org/mpris/MediaPlayer2 \
              org.mpris.MediaPlayer2.Player.Previous
}


case "$1" in
  playpause)
      playPause
      ;;
  next)
      next
      ;;
  previous)
      previous
      ;;

  *)
    echo "invalid argument: $s"
    exit 1
esac
