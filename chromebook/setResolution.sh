#!/bin/sh
xrandr --newmode "1664x1106" 153.00  1664 1768 1944 2224  1106 1109 1119 1147 -hsync +vsync
xrandr --addmode eDP-1 1664x1106
xrandr -s 1664x1106
