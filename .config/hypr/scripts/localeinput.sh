#!/bin/sh
#
# idea taken from source  script :> https://github.com/JaKooLit/Hyprland-v3
# adapted more in own need on wayland combination other script

layout=$(localectl status | grep "X11 Layout" | sed -e "s/^.*X11 Layout://")
variant= $(localectl status | grep "X11 Variant" | sed -e "s/^.*X11 Variant://")

echo "Keyboard layout: $layout"

printf "${NOTE} Detecting keyboard layout to prepare necessary changes in hyprland.conf before copying\n"
printf "\n"
printf "\n"

# Prompt the user to confirm whether the detected layout is correct
read -p "Detected keyboard layout or keymap: $layout. Is this correct? [y/n] " confirm

if [ "$confirm" = "y" ]; then
  # If the detected layout is correct, update the 'kb_layout=' line in the file
  awk -v layout="$layout" '/kb_layout/ {$0 = "  kb_layout=" layout} 1' /home/ringo/experiment/devel/hyprland/.config/hypr/config.d/input.conf > temp.conf
  mv temp.conf /home/ringo/experiment/devel/hyprland/.config/hypr/config.d/input.conf
else
  # If the detected layout is not correct, prompt the user to enter the correct layout
  printf "${WARN} Ensure to type in the proper keyboard layout, e.g., gb, de, pl, etc.\n"
  read -p "Please enter the correct keyboard layout: " new_layout
  # Update the 'kb_layout=' line with the correct layout in the file
  awk -v new_layout="$new_layout" '/kb_layout/ {$0 = "  kb_layout=" new_layout} 1' /home/ringo/experiment/devel/hyprland/.config/hypr/config.d/input.conf > temp.conf
  mv temp.conf /home/ringo/experiment/devel/hyprland/.config/hypr/config.d/input.conf
fi
printf "\n"
printf "\n"
