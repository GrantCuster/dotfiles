#!/bin/bash
setting=`cat ~/.colorscheme`
light='light'
if [ "$setting" == "$light" ]; then
  # cat .config/i3/colors-dark .config/i3/base > .config/i3/config && i3-msg reload
  ~/.config/base16-pywal-mod/gruvbox-dark.sh
  # hsetroot -solid "#1d2021"
  echo -e "dark" > ~/.colorscheme
else
  # cat .config/i3/colors-light .config/i3/base > .config/i3/config && i3-msg reload
  ~/.config/base16-pywal-mod/gruvbox-light.sh
  # hsetroot -solid "#d5c4a1"
  echo -e "light" > ~/.colorscheme
fi

