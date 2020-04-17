#!/bin/sh
echo "updating config"
sed -i -r "s/DOCKER_MPD_NAME/${DOCKER_MPD_NAME}/g" /etc/mpd.conf 
sed -i -r "s/DOCKER_MPD_SERVER/${DOCKER_MPD_SERVER}/g" /etc/mpd.conf 
sed -i -r "s/DOCKER_MPD_PORT/${DOCKER_MPD_PORT}/g" /etc/mpd.conf 
sed -i -r "s/DOCKER_MPD_PASSWORD/${DOCKER_MPD_PASSWORD}/g" /etc/mpd.conf 
sed -i -r "s#DOCKER_MPD_MOUNT#${DOCKER_MPD_MOUNT}#g" /etc/mpd.conf 

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

