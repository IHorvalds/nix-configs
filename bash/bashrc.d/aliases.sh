#/bin/bash

alias grpe='grep'
alias gerp='grep'
alias gpre='grep'
alias gper='grep'
alias rm-rf='rm -rf'

alias less="less -N -I -S --mouse"

function mkcdir() {
  mkdir -p -- "$1"; cd -P -- "$1"
}

alias clippy='wl-copy'
alias notify='notify-send -w -a "PID $! is done" "Command is done" --hint=string:sound-file:/usr/share/sounds/ocean/stereo/outcome-success.oga'
