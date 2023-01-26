XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME

PATH=/usr/local/MATLAB/R2017b/bin:$PATH
export PATH

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#/usr/bin/pactl unload-module 6
