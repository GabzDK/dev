#!/bin/sh

wallpaper=$(ls ~/Pictures/walls | dmenu -i -l 50)
[ -z $wallpaper ] || feh --bg-fill $HOME/Pictures/walls//$wallpaper
