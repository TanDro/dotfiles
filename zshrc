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

alias vim='vim --servername vim'
alias vi='vim'
