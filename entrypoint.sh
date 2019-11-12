#!/bin/sh

mkdir /tmp/.X11-unix/

ssh -fNT -L /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 \
	-o StrictHostKeyChecking=no -p ${PORT} \
	${USER}@${HOST}

export DISPLAY=:0

echo "run intelliJ now"

./opt/idea/bin/idea.sh
