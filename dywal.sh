#!/bin/bash

#kill the script if it's already running useful if you're constantly restarting x
for pid in $(pidof -x dynamicwall.sh); do
     if [ $pid != $$ ]; then
         kill -9 $pid
         exit 1
     fi
done

cd "$HOME/Pictures/papes"
file_count=$(ls|wc -l)
while true; do
ran=$((RANDOM % file_count+1))
  ran_file=$(ls|awk '{if(NR=='$ran') print $0}')
  feh --bg-fill "$ran_file"
  sleep 20
done
