#!/bin/sh

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

[ ! -d "$WALLPAPER_DIR" ] && {
    notify-send "Wallpaper Picker" "Directory not found: $WALLPAPER_DIR"
    exit 1
}

selected=$(sxiv -tqo "$WALLPAPER_DIR" | head -n 1)

[ -z "$selected" ] && exit

feh --bg-fill "$selected"

notify-send "Wallpaper Set" "$(basename "$selected")"
