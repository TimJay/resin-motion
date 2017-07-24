#!/bin/bash
if [ -n "$PUSHOVER_TOKEN" ] && [ -n "$PUSHOVER_USERKEY" ];
then
	curl --data "token=$PUSHOVER_TOKEN&user=$PUSHOVER_USERKEY&message=Motion detected! $DEVICEURL" https://api.pushover.net/1/messages.json
fi
