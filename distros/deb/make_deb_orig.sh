#!/bin/sh

VERSION=1.0
CUR=$(dirname $(readlink -f -- $0))

PAS_FILES=$(ls -1 $CUR/../../*.pas | xargs -n 1 basename)
FILES="$PAS_FILES underworld.xpm underworld.png story ncurses underworld.1 underworld.ru.1"
FREEDESKTOP_FILES="underworld.desktop underworld-xterm.sh"

ORIG_ARCHIVE=$CUR/underworld_$VERSION.orig.tar.gz

tar czf "$ORIG_ARCHIVE" --exclude='*.ppu' --exclude='*.o' --transform="s||underworld/|" -C "$CUR/../.." $FILES -C "$CUR/../freedesktop" $FREEDESKTOP_FILES
tar xf "$ORIG_ARCHIVE" --directory $CUR
