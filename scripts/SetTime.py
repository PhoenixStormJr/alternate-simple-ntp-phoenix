#ONLY CHANGE THIS VARIABLE:
Add_Hours = 23




import os
def GetTime(Format,Add_Hours=0):
  import urllib.request
  #Get time from server:
  headers = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
  }
  mystr = urllib.request.urlopen(urllib.request.Request("https://time.is/New_York", headers=headers)).read().decode("utf8")
  location = mystr.find('<time id="clock">')
  new_str = ""
  for x in range(83):
    new_str += mystr[location+x]
    x = x + 1
  time = ""
  x = 17
  while x < 25:
    time += new_str[x]
    x = x + 1
  AMPM = ""
  x = 81
  while x < 83:
    AMPM += new_str[x]
    x = x + 1
  #Time is "time" and AMPM is "AMPM"
  #Split time into hour minute second
  timesplit = time.split(":")
  hour = int(timesplit[0])
  minute = int(timesplit[1])
  second = int(timesplit[2])
  #Now convert to military time
  if(AMPM == "PM"):
    hour = hour + 12
  #Add hours
  hour = hour + Add_Hours
  if(hour > 24):
    hour = hour - 24
  if(Format==1):
    if(hour < 10):
      hour = "0" + str(hour)
    if(minute < 10):
      minute = "0" + str(minute)
    if(second < 10):
      second = "0" + str(second)
    time2= f"{str(hour)}:{str(minute)}:{str(second)}"
    return time2
  elif(Format==2):
    if(hour > 12):
      hour = hour - 12
      if(hour < 10):
        hour = "0" + str(hour)
      if(minute < 10):
        minute = "0" + str(minute)
      if(second < 10):
        second = "0" + str(second)
      time2= f"{str(hour)}:{str(minute)}:{str(second)}PM"
    else:
      if(hour < 10):
        hour = "0" + str(hour)
      if(minute < 10):
        minute = "0" + str(minute)
      if(second < 10):
        second = "0" + str(second)
      time2= f"{str(hour)}:{str(minute)}:{str(second)}AM"
    return time2

time = GetTime(2,Add_Hours)
print(f"\"time is: {time}\"")
print(f'running command [ date +"%T%p" -s "{time}" ]')
os.system(f'date +"%T%p" -s "{time}"')