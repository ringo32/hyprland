#!/bin/sh
#
# idea taken from source  script :> https://github.com/JaKooLit/Hyprland-v3
# adapted more in own need on wayland combination other script

layout=$(localectl status | grep "X11 Layout" | sed -e "s/^.*X11 Layout://")
variant= $(localectl status | grep "X11 Variant" | sed -e "s/^.*X11 Variant://")

echo "Keyboard layout: $layout"
echo "Keyboard variant: $variat"
