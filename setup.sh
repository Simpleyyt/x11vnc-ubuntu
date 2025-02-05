#!/bin/bash

apt install gnome-screensaver
apt install -y xserver-xorg-video-dummy x11vnc make
x11vnc -storepasswd  /etc/x11vnc.pass
cp xorg.conf /etc/X11/xorg.conf
make install
systemctl enable x11vnc
systemctl start x11vnc
service restart gdm
