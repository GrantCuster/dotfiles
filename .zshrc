# Config
# Guide: http://zsh.sourceforge.net/Guide/zshguide02.html

bindkey -v

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# Save time of history commands
setopt extended_history
# Ignore adjacent dupes
setopt hist_ignore_dups

setopt auto_cd

# ls highlight colors config from bash (ubuntu probably)
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls="ls --color=auto"
alias iso="date -u +%Y-%m-%dT%H:%M:%SZ"

zstyle ':completion:*' menu select=2
autoload colors && colors
# RPROMPT_PREFIX='%{'$'\e[1A''%}'
# RPROMPT_SUFFIX='%{'$'\e[1B''%}'
# RPROMPT=$RPROMPT_PREFIX'%t'$RPROMPT_SUFFIX
precmd () { print -Pn "\e]2;st %~\a" } # title bar prompt
PROMPT="%n %F{blue}%~%f $ " 

alias g='(){ firefox $1 && zsh };'
alias zathura='zathura --fork'
alias ssh_feed='ssh -i /home/grant/s/aws/hugo.pem ubuntu@ec2-52-12-141-61.us-west-2.compute.amazonaws.com'
alias cdcs='cd ~/s/cs'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

command_not_found_handler () {
  string="$1"
  substring="."
  sub2=":"
  if test "${string#*$substring}" != "$string"; then
    firefox $string &
  else
    if test "${string#*$sub2}" != "$string"; then
      # firefox $string &
    else
      printf "Command not found: $1"
      return 127
    fi
  fi
}


# import colorscheme from 'base16' asynchronously
cat ~/.cache/base16/sequences

source /home/grant/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use what you have typed to filter history
bindkey "$terminfo[kcuu1]" up-line-or-search
bindkey "$terminfo[kcud1]" down-line-or-search

# vim mode cursor config
# ---------------

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#   echo -ne '\e[1 q'

# elif [[ ${KEYMAP} == main ]] ||
#   [[ ${KEYMAP} == viins ]] ||
#   [[ ${KEYMAP} = '' ]] ||
#   [[ $1 = 'beam' ]]; then
# echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select

# # Use beam shape cursor on startup.
# echo -ne '\e[5 q'

# # Use beam shape cursor for each new prompt.
# preexec() {
#   echo -ne '\e[5 q'
# }
