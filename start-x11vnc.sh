#!/bin/bash

while :
do
    XAUTHORITY=$(ps -e -o command | grep Xorg | grep -oP "\K-auth (.*?)(?= )" | sed 's/^-auth //')
    DISPLAY=$(w -hs | awk '{print $2}' | grep ":" | sed -n '1p')
    export DISPLAY=${DISPLAY:-:0}
    export XAUTHORITY
    x11vnc -noshm -noxdamage -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared -auth $XAUTHORITY -display $DISPLAY  -o /var/log/x11vnc.log
    xdotool key super+l
    sleep 1
done
