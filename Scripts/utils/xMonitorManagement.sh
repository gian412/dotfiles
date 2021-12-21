if [[ "$(xrandr | grep '^DP1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output eDP1 --off
    xrandr --output DP1 --auto
    xrandr --output HDMI-1-4 --auto --left-of DP1
fi

if [[ "$(xrandr | grep '^DP1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output eDP1 --auto
    xrandr --output DP1 --auto --right-of eDP1
fi

if [[ "$(xrandr | grep '^DP1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output DP1 --off
    xrandr --output eDP1 --auto
    xrandr --output HDMI-1-4 --auto --left-of eDP1
fi

if [[ "$(xrandr | grep '^DP1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output DP1 --off
    xrandr --output eDP1 --auto
fi

