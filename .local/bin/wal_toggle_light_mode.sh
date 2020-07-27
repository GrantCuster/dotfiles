#!/bin/bash
setting=`cat ~/.vimrc_background`
light='set background=light'
if [ "$setting" == "$light" ]; then
  wal -e --theme ggruvbox
  echo -e "set background=dark" > ~/.vimrc_background
  xdotool search --sync --class "st" key --clearmodifiers --window %@ 'ctrl+x' set_window --urgency 0 %@
else
  wal -l -e --theme ggruvbox
  echo -e "set background=light" > ~/.vimrc_background
  xdotool search --sync --class "st" key --clearmodifiers --window %@ 'ctrl+x' set_window --urgency 0 %@
fi

