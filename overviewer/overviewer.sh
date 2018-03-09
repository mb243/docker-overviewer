#!/bin/bash

if [[ "$REV" == "" ]]; then
  echo "-- No REV specified!"
  echo "Specify version with -e REV=version"
  echo "Example: -e REV=1.12.2"
  echo "Stopping!"
  exit 1
fi

echo "Starting with --genpoi  ..."
/usr/bin/python /usr/bin/overviewer.py --config /overviewer/overviewer.cfg --genpoi
echo "Starting map render now ..."
/usr/bin/python /usr/bin/overviewer.py --config /overviewer/overviewer.cfg
