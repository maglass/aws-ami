#!/bin/bash
# https://mattyboy.net/general/clamav-scan-slack-notification/

DIRECTORIES="/home /etc"
LOGFILE="/tmp/clamav-daily-scan.log"
SLACKBOARD="/home/ubuntu/slackboard/bin/slackboard-cli"

function scan() {
  [ -f $LOGFILE ] && rm $LOGFILE
  clamscan --log=$LOGFILE -ri $DIRECTORIES
}

function logs() {
  INFECTED_COUNT=$(grep Infected $LOGFILE | cut -d " " -f3)
  if [ "$INFECTED_COUNT" -ne "0" ]; then
    VIRUSES_FOUND=$(grep FOUND $LOGFILE | cut -d " " -f2 | sort -u)
    MESSAGE="Found ${INFECTED_COUNT} infected files on daily virus scan.\n${VIRUSES_FOUND}"
    echo $MESSAGE > ~/.clamav.virus.logs
  fi
}

scan
slack
