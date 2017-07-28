#!/bin/bash
export VIDEODEVICE=${VIDEODEVICE:-/dev/video0}
export ROTATE=${ROTATE:-0}
export WIDTH=${WIDTH:-1920}
export HEIGHT=${HEIGHT:-1080}
export FRAMERATE=${FRAMERATE:-2}
export FRAMETIME=${FRAMETIME:-0}
export THRESHOLD=${THRESHOLD:-1500}
export NOISELEVEL=${NOISELEVEL:-32}
export MASKFILE=${MASKFILE:-}
export SMARTMASKSPEED=${SMARTMASKSPEED:-5}
export LIGHTSWITCH=${LIGHTSWITCH:-0}
export MINMOTIONFRAMES=${MINMOTIONFRAMES:-2}
export EVENTGAP=${EVENTGAP:-60}
export OUTPUTPICTURES=${OUTPUTPICTURES:-on}
export OUTPUTMOVIES=${OUTPUTMOVIES:-off}

modprobe bcm2835-v4l2

if  [[ $MASKFILE == http* ]] ;
then
	curl -o /opt/mask.pgm $MASKFILE
	export MASKFILE=/opt/mask.pgm  
fi

envsubst < "/opt/motion.conf.template" > "/opt/motion.conf"

motion -c /opt/motion.conf
