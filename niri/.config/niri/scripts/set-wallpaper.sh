#!/bin/bash
killall awww-daemon 2>/dev/null
sleep 0.1
awww-daemon &
sleep 0.5
awww img --transition-type fade --transition-fps 60 --transition-step 4 ""
