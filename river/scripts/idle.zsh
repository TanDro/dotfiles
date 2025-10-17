swayidle -w \
    timeout 830 "notify-send -u low System 'Locking session in 30 seconds'" \
    timeout 900 "$HOME/.config/river/scripts/lock.zsh" \
    timeout 1200 "wlopm --off '*'" resume "wlopm --on '*'" &
