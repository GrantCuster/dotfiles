#!/bin/bash
setting=`cat ~/.i3-mode`
normal='normal'
if [ "$setting" == "$normal" ]; then
  cat .config/i3/base .config/i3/presentation > .config/i3/config && i3-msg restart
  hsetroot -solid "#dddddd"
  echo -e "presentation" > ~/.i3-mode
else
  cat .config/i3/base .config/i3/normal > .config/i3/config && i3-msg restart
  hsetroot -solid "#1d2021"
  echo -e "normal" > ~/.i3-mode
fi

