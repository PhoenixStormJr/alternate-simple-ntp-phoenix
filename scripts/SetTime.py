#!/usr/bin/env python
#ONLY CHANGE THIS VARIABLE:
zone = 8




import os
def GetTime(zone,format):
  zoneSites = ['https://time.is/Baker_Island', 'https://time.is/Pago_Pago', 'https://time.is/Avarua', 'https://time.is/Atuona', 'https://time.is/Rikitea', 'https://time.is/Alaska', 'https://time.is/Los_Angeles', 'https://time.is/Albuquerque', 'https://time.is/Chicago', 'https://time.is/New_York', 'https://time.is/S%C3%A3o_Paulo', 'https://time.is/Newfoundland_and_Labrador', 'https://time.is/Saint_Pierre_and_Miquelon', 'https://time.is/Praia', 'https://time.is/Bobo-Dioulasso', 'https://time.is/Algiers', 'https://time.is/Durr%C3%ABs', 'https://time.is/Manama', 'https://time.is/Isfahan', 'https://time.is/Yerevan', 'https://time.is/Kabul', 'https://time.is/Almaty', 'https://time.is/Ahmedabad', 'https://time.is/Biratnagar', 'https://time.is/Chittagong', 'https://time.is/Naypyidaw', 'https://time.is/Phnom_Penh', 'https://time.is/Mandurah', 'https://time.is/Ambon_City', 'https://time.is/Adelaide', 'https://time.is/Australian_Capital_Territory', 'https://time.is/Palikir', 'https://time.is/Suva', 'https://time.is/Apia', 'https://time.is/Tabwakea_Village']
  import urllib.request
  #Get time from server:
  headers = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
  }
  mystr = urllib.request.urlopen(urllib.request.Request(zoneSites[zone], headers=headers)).read().decode("utf8")
  location = mystr.find('<time id="clock">')
  AMPM = mystr[location+81:location+83]
  time_str = mystr[location+17:location+25]
  if(format == 2):
    time_split = time_str.split(':')
    if(AMPM == 'PM'):
      hour = str(int(time_split[0])+12)
    else:
      hour = time_split[0]
    minute = time_split[1]
    second = time_split[2]
    time=f"{hour}:{minute}:{second}"
  elif(format == 1):
    time = time_str+AMPM
  location = mystr.find('title="Press for calendar">')
  location2 = location+27
  while(mystr[location2] != '<'):
    location2 += 1
  date_str = mystr[location+27:location2]
  date_str = date_str.replace('Sunday, ','')
  date_str = date_str.replace('Monday, ','')
  date_str = date_str.replace('Tuesday, ','')
  date_str = date_str.replace('Wednesday, ','')
  date_str = date_str.replace('Thursday, ','')
  date_str = date_str.replace('Friday, ','')
  date_str = date_str.replace('Saturday, ','')
  date_str = date_str.replace('Monday, ','')
  date_str = date_str.replace('Monday, ','')
  print(date_str)
  date_str = date_str.replace(',','')
  date_split = date_str.split(' ')
  month = date_split[0]
  day = date_split[1]
  year = date_split[2]
  if(month == 'January'):
    month2 = '01'
  if(month == 'February'):
    month2 = '02'
  if(month == 'March'):
    month2 = '03'
  if(month == 'April'):
    month2 = '04'
  if(month == 'May'):
    month2 = '05'
  if(month == 'June'):
    month2 = '06'
  if(month == 'July'):
    month2 = '07'
  if(month == 'August'):
    month2 = '08'
  if(month == 'September'):
    month2 = '09'
  if(month == 'October'):
    month2 = '10'
  if(month == 'November'):
    month2 = '11'
  if(month == 'December'):
    month2 = '12'
  date = f"{year}-{month2}-{day}"
  return f"{date} {time}"



Date_And_Time=GetTime(zone,2)
print(f"Date and Time is: \"{Date_And_Time}\"")
print(f"running command: date -s '{Date_And_Time}'")
os.system(f"sudo date -s '{Date_And_Time}'")
