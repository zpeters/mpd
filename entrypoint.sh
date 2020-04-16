#!/bin/sh
echo "updating config"
sed -i -r "s/MPD_NAME/${MPD_NAME}/g" /etc/mpd.conf 
sed -i -r "s/MPD_SERVER/${MPD_SERVER}/g" /etc/mpd.conf 
sed -i -r "s/MPD_PORT/${MPD_PORT}/g" /etc/mpd.conf 
sed -i -r "s/MPD_PASSWORD/${MPD_PASSWORD}/g" /etc/mpd.conf 

echo "starting mpd"
mpd

echo "updating database"
mpc update --wait

echo "updating playlist"
mpc clear
mpc ls | mpc add

echo "playing"
mpc random on
mpc play

