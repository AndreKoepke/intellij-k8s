#!/bin/sh

mkdir ~/.ssh/
cp /private-keys/* ~/.ssh/
chmod 600 ~/.ssh/*

mkdir /tmp/.X11-unix/

ssh -fNT -L /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
	-o StrictHostKeyChecking=no -p ${PORT} \
	${USER}@${HOST}

export DISPLAY=:0

echo "run intelliJ now"

./opt/idea/bin/idea.sh
