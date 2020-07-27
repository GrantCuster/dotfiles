#!/bin/bash
echo -e "set background=dark" > ~/.vimrc_background
xdotool search --onlyvisible --class "st" key --window %@ 'ctrl+x'
