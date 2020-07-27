#!/bin/bash
echo -e "set background=light" > ~/.vimrc_background
xdotool search --onlyvisible --class "st" key --window %@ 'ctrl+x'
