#!/bin/bash

## -- This script will imitate Gnome's Media Controls (Play/Pause, Next, Previous, Stop) -- ##
## -- It will assume you are using a media application that is compatible with MPRIS or  -- ##
## -- "Media Player Remote Interfacing Specification"                                    -- ##

function show_help {
cat << EOF
Usage: ${0##*/} [-h] [Media command]

Use "Media Player Remote Interfacing Specification" to controls media player applications.
This works only with applications that support MPRIS.

    -h    display this help
    -t   PlayPause toggle command
    -s    Stop command
    -n    Next command
    -p    Previous command
EOF
}

function exec_shortcut {
	# Search for running media applications
	# and store into apps array
	apps=(`qdbus | grep org.mpris.MediaPlayer2 | sed 's/.*\.//'`)

	# For each application send the "PlayPause" command
	for app in "${apps[@]}"
	  do
	      qdbus org.mpris.MediaPlayer2.$app /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$1
	  done
}

while getopts ":htsnp" opt; do
  case $opt in
    h)
      show_help >&2
      exit 0
      ;;
    t)
      exec_shortcut PlayPause
      ;;
    s)
      exec_shortcut Stop
      ;;
    n)
      exec_shortcut Next
      ;;
    p)
      exec_shortcut Previous
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done