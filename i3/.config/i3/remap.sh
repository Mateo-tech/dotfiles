#!/bin/sh
xmodmap -e "clear mod1"
xmodmap -e "clear mod4"
xmodmap -e "keycode 133 = Alt_L"
xmodmap -e "keycode 64 = Super_L"
xmodmap -e "keycode 108 = Alt_R"
xmodmap -e "add mod1 = Alt_L"
xmodmap -e "add mod4 = Super_L"
