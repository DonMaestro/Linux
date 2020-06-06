#!/bin/sh

SNIPS=${HOME}/.local/bin/snippets
BUF=$(wl-paste)

FILE=`ls ${SNIPS} | /usr/bin/wofi --show dmenu`

#source ${SNIPS}/${FILE}
. ${SNIPS}/${FILE}

DATA=$(snip)

wl-copy $DATA
#ydotool key shift+Insert
#ydotool key --key-delay=5 135:1 135:0 #KEY_PASTE
#ydotool key --key-delay=5 42:1 110:1 110:0 42:0 #SHIFT + INSERT
ydotool key --key-delay=5 29:1 42:1 47:1 47:0 42:0 29:0
wl-copy $BUF

