#!/bin/bash

# // -- This sets default layout of OXWM to scrolling mode -- //

sleep 2
for i in 1 2 3 4 5; do
    xdotool key "super+$i"
    sleep 0.1
    xdotool key "super+s"
done
xdotool key "super+1"
