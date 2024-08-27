
#ONLY CHANGE THIS LINE HERE:
zone=8




function FindStringInString {
  rest=${1#*$2}
  echo $(( ${#1} - ${#rest} - ${#2} ))
}

function GetTime {
  zoneSites=("https://time.is/Baker_Island" "https://time.is/Pago_Pago" "https://time.is/Avarua" "https://time.is/Atuona" "https://time.is/Rikitea" "https://time.is/Alaska" "https://time.is/Los_Angeles" "https://time.is/Albuquerque" "https://time.is/Chicago" "https://time.is/New_York" "https://time.is/S%C3%A3o_Paulo" "https://time.is/Newfoundland_and_Labrador" "https://time.is/Saint_Pierre_and_Miquelon" "https://time.is/Praia" "https://time.is/Bobo-Dioulasso" "https://time.is/Algiers" "https://time.is/Durr%C3%ABs" "https://time.is/Manama" "https://time.is/Isfahan" "https://time.is/Yerevan" "https://time.is/Kabul" "https://time.is/Almaty" "https://time.is/Ahmedabad" "https://time.is/Biratnagar" "https://time.is/Chittagong" "https://time.is/Naypyidaw" "https://time.is/Phnom_Penh" "https://time.is/Mandurah" "https://time.is/Ambon_City" "https://time.is/Adelaide" "https://time.is/Australian_Capital_Territory" "https://time.is/Palikir" "https://time.is/Suva" "https://time.is/Apia" "https://time.is/Tabwakea_Village")
  mystr=$(wget --user-agent="Mozilla" -q -O - ${zoneSites[$1]})
  search1='<time id="clock">'
  location=$(FindStringInString "${mystr}" "${search1}")
  location2=$(($location + 81))
  AMPM="${mystr:$location2:2}"
  location2=$(($location + 17))
  time_str="${mystr:$location2:8}"
  if [[ "$2" -eq 2 ]]; then
    IFS=':' read -r -a time_split <<< "$time_str"
    if [ "$AMPM" = "PM" ] && [ ${time_split[0]} -ne 12 ]; then
      hour_temp=${time_split[0]}
      hour_temp=${hour_temp#0}
      hour=$((${hour_temp[0]} + 12))
    elif [ "$AMPM" = "AM" ] && [ ${time_split[0]} -eq 12 ]; then
      hour="00"
    else
      hour=${time_split[0]}
    fi
    minute=${time_split[1]}
    second=${time_split[2]}
    time="${hour}:${minute}:${second}"
  elif [[ "$2" -eq 1 ]]; then
    time="${time_str}${AMPM}"
  fi
  search1='title="Press for calendar">'
  location=$(FindStringInString "${mystr}" "${search1}")
  location2=$(($location + 27))
  location3=$(($location + 27))
  while [ "${mystr:$location3:1}" != "<" ]
  do
    location3=$(( $location3 + 1 ))
  done
  amount=$(( $location3 - $location2 ))
  date_str="${mystr:$location2:$amount}"
  date_str="${date_str/'Sunday, '/}"
  date_str="${date_str/'Monday, '/}"
  date_str="${date_str/'Tuesday, '/}"
  date_str="${date_str/'Wednesday, '/}"
  date_str="${date_str/'Thursday, '/}"
  date_str="${date_str/'Friday, '/}"
  date_str="${date_str/'Saturday, '/}"
  date_str="${date_str/,/}"
  IFS=' ' read -r -a date_split <<< "$date_str"
  month=${date_split[0]}
  day=${date_split[1]}
  year=${date_split[2]}
  if [ "$month" = "January" ]; then
    month2="01"
  fi
  if [ "$month" = "February" ]; then
    month2="02"
  fi
  if [ "$month" = "March" ]; then
    month2="03"
  fi
  if [ "$month" = "April" ]; then
    month2="04"
  fi
  if [ "$month" = "May" ]; then
    month2="05"
  fi
  if [ "$month" = "June" ]; then
    month2="06"
  fi
  if [ "$month" = "July" ]; then
    month2="07"
  fi
  if [ "$month" = "August" ]; then
    month2="08"
  fi
  if [ "$month" = "September" ]; then
    month2="09"
  fi
  if [ "$month" = "October" ]; then
    month2="10"
  fi
  if [ "$month" = "November" ]; then
    month2="11"
  fi
  if [ "$month" = "December" ]; then
    month2="12"
  fi
  date="${year}-${month2}-${day}"
  echo "${date} ${time}"

}


double_quote='"'
Date_And_Time=$(GetTime $zone 2)
echo "the date and time are: ${double_quote}${Date_And_Time}${double_quote}"
echo "running command: [date -s ${double_quote}${Date_And_Time}${double_quote}]"
sudo date -s "${Date_And_Time}"
