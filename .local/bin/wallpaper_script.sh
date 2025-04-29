#!/bin/sh

wallpaper=$(ls ~/Pictures/Wallpapers | dmenu -i -l 50) 
[ -z $wallpaper ] || feh --bg-fill /home/kali/Pictures/Wallpapers//$wallpaper  
