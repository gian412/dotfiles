if [[ "$(xrandr | grep '^DP1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output HDMI-1-4 --auto --primary
    xrandr --output DP1 --auto --left-of HDMI-1-4
    xrandr --output eDP1 --off
fi

if [[ "$(xrandr | grep '^DP1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output eDP1 --auto --right-of DP1
    xrandr --output DP1 --auto
fi

if [[ "$(xrandr | grep '^DP1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output DP1 --off
    xrandr --output HDMI-1-4 --auto --primary
    xrandr --output eDP1 --auto --left-of HDMI-1-4
fi

if [[ "$(xrandr | grep '^DP1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output DP1 --off
    xrandr --output eDP1 --auto
fi

