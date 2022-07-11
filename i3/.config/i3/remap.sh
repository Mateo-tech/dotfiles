#!/bin/sh
xmodmap -e "clear mod1"
xmodmap -e "clear mod4"
xmodmap -e "keycode 134 = Alt_R"
xmodmap -e "keycode 133 = Super_L"
xmodmap -e "keycode 64 = Alt_L"
xmodmap -e "add mod4 = Alt_L"
xmodmap -e "add mod1 = Super_L"
