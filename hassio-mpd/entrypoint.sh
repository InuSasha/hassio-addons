#!/bin/sh

mkdir -p \
    /data/music \
    /data/playlists

touch \
    /data/.database \
    /data/.state

/usr/bin/mpd --no-daemon $*
