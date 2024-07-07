#!/bin/bash

#ONLY CHANGE THIS LINE HERE:
Add_Hours=23




function FindStringInString {
  for (( x=0; x<${#1}; x++ )); do
    if [ "${1:$x:${#2}}" = "$2" ]; then
      echo $x
      break
    fi
  done
}

function GetTime {
  mystr=$(wget --user-agent="Mozilla" -q -O - https://time.is/New_York)
  search1='<time id="clock">'
  location=$(FindStringInString "${mystr}" "${search1}")
  new_str="${mystr:$location:83}"
  time="${new_str:17:8}"
  AMPM="${new_str:81:2}"
  IFS=':' read -r -a timesplit <<< "$time"
  hour="${timesplit[0]}"
  minute="${timesplit[1]}"
  second="${timesplit[2]}"
  #convert to military time
  if [ "$AMPM" = "PM" ]; then
    hour=$(($hour + 12))
  fi
  #Add Hours:
  hour=$(($hour + $Add_Hours))
  if [ "$hour" -gt "24" ]; then
    hour=$(($hour - 24))
  fi
  if [ "$1" -eq "1" ]; then
    if [ "$hour" -lt "10" ]; then
      hour="0${hour}"
    fi
    echo "${hour}:${minute}:${second}"
  elif [[ "$1" == "2" ]]; then
    if [ "$hour" -gt "12" ]; then
      hour=$(($hour - 12))
    fi
    if [ "$hour" -lt "10" ]; then
      hour="0${hour}"
    fi
    echo "${hour}:${minute}:${second}${AMPM}"
  fi
}

time=$(GetTime 2)
echo "The time is: ${time}"
sudo date +"%T%p" -s $time
