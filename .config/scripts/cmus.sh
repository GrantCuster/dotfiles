#!/bin/bash
stat=$(cmus-remote -C status | grep status | cut -c 8-)

prepend_zero () {
  seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1| cut -c 12- | tr '[:lower:]' '[:upper:]'))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11- | tr '[:lower:]' '[:upper:]'))

position=$(cmus-remote -C status | grep position | cut -c 10-)
if [ "$position" = "" ]; then
  echo -n ""
else
  minutes1=$(prepend_zero $(($position / 60)))
  seconds1=$(prepend_zero $(($position % 60)))

  duration=$(cmus-remote -C status | grep duration | cut -c 10-)
  minutes2=$(prepend_zero $(($duration / 60)))
  seconds2=$(prepend_zero $(($duration % 60)))

  if [ "$stat" = "playing" ]; then 
    echo -n "CMUS: %{F#fffead}$artist - $song%{F-}"
  else
    echo -n "CMUS: $artist - $song"
  fi
fi
