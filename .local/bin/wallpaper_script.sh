#!/bin/sh

wallpaper=$(ls ~/pictures/wallpapers | dmenu -i -l 50)
[ -z $wallpaper ] || feh --bg-fill $HOME/pictures/wallpapers//$wallpaper
