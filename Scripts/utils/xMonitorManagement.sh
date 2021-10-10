if [[ "$(xrandr | grep '^DP-1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-0 connected')" != "" ]]; then
    xrandr --output eDP-1 --off
    xrandr --output DP-1 --auto
    xrandr --output HDMI-1-0 --auto --left-of DP-1
fi

if [[ "$(xrandr | grep '^DP-1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-0 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-0 --off
    xrandr --output eDP-1 --auto
    xrandr --output DP-1 --auto --right-of eDP-1
fi

if [[ "$(xrandr | grep '^DP-1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-0 connected')" != "" ]]; then
    xrandr --output DP-1 --off
    xrandr --output eDP-1 --auto
    xrandr --output HDMI-1-0 --auto --left-of eDP-1
fi

if [[ "$(xrandr | grep '^DP-1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-0 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-0 --off
    xrandr --output DP-1 --off
    xrandr --output eDP-1 --auto
fi

