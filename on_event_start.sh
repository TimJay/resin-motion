#!/bin/bash
curl --data "token=$PUSHOVER_TOKEN&user=$PUSHOVER_USERKEY&message=Motion detected! $DEVICEURL" https://api.pushover.net/1/messages.json
