#!/bin/bash

while :
do
    AUTH_ARGS=$(ps -e -o command | grep Xorg | grep -oP "\K-auth (.*?)(?= )")
    DISPLAY=$(w -hs | awk '{print $2}' | grep ":" | sed -n '1p')
    x11vnc -noshm -forever -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared $AUTH_ARGS -display ${DISPLAY:-:0} -o /var/log/x11vnc.log
    sleep 2
done
