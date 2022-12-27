if [[ "$(xrandr | grep '^DP-1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output HDMI-1-4 --auto --primary
    xrandr --output DP-1 --auto --left-of HDMI-1-4
    xrandr --output eDP-1 --off
fi

if [[ "$(xrandr | grep '^DP-1 connected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output eDP-1 --auto --right-of DP1
    xrandr --output DP-1 --auto
fi

if [[ "$(xrandr | grep '^DP-1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 connected')" != "" ]]; then
    xrandr --output DP-1 --off
    xrandr --output HDMI-1-4 --auto --primary
    xrandr --output eDP-1 --auto --left-of HDMI-1-4
fi

if [[ "$(xrandr | grep '^DP-1 disconnected')" != "" ]] && [[ "$(xrandr | grep '^HDMI-1-4 disconnected')" != "" ]]; then
    xrandr --output HDMI-1-4 --off
    xrandr --output DP-1 --off
    xrandr --output eDP-1 --auto
fi

