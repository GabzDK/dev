#!/bin/sh

wallpaper=$(ls ~/Pictures/Wallpapers | dmenu -i -l 50) 
[ $wallpaper -z ] || feh --bg-fill /home/kali/Pictures/Wallpapers//$wallpaper  
