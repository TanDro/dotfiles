# load .profile
. ~/.profile

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Setup Vi-mode indicator in right-prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}${PR_GREEN}$(virtualenv_info)%{$reset_color%} $EPS1"
  zle reset-prompt
}

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

alias vim='vim --servername vim'
alias vi='vim'
alias matlab='LD_PRELOAD=/usr/lib/libstdc++.so.6.0.28 /usr/local/MATLAB/R2017b/bin/matlab -desktop'
alias rdesktop-win='rdesktop -g 1920x1000 -a24 -z -P -r clipboard:CLIPBOARD -k de -x l 10.4.23.183 -r sound:local&'
alias spotify-ad='LD_PRELOAD=/usr/lib/spotify-adblock.so spotify > /dev/null 2>&1&'
alias graphPad='/home/jens/mapwacom.sh --device-regex="HUION *" -s "DisplayPort-3"'
alias connectHP='echo -e "connect EC:66:D1:B8:EC:D9\nquit" | bluetoothctl'
alias disconnectHP='echo -e "disconnect EC:66:D1:B8:EC:D9\nquit" | bluetoothctl'
