#!/bin/bash
echo "This is the install script which will install Phoenix_NTP (Phoenix's custom network time protocol) to your linux device. It will copy SetTime.py to /home/${USER}/Phoenix_NTP/SetTime.py and then copy SetTime.desktop to /home/${USER}/.config/autostart/SetTime.desktop and then copy SetTime.desktop AGAIN to /home/${USER}/Desktop/SetTime.desktop. That is all this script will do, that is all the install is."
read -p "Would you line to install Phoenix_NTP?: Enter (y/n): " choice

if [ $choice = "y" ]; then
   echo "Installing Phoenix's Network Time Protocol"
   echo "Copying ./scripts/SetTime.py to ~/Phoenix_NTP/SetTime.py"
   mkdir -p ~/Phoenix_NTP
   cp --update=none ./scripts/SetTime.py ~/Phoenix_NTP/SetTime.py
   echo "Copying ./scripts/SetTime.desktop to ~/.config/autostart/SetTime.desktop"
   mkdir -p ~/.config/autostart
   cp --update=none ./scripts/SetTime.desktop ~/.config/autostart/SetTime.desktop
   chmod 777 ~/.config/autostart/SetTime.desktop
   echo "Copying ./scripts/SetTime.desktop to ~/Desktop/SetTime.desktop"
   mkdir -p ~/Desktop
   cp --update=none ./scripts/SetTime.desktop ~/Desktop/SetTime.desktop
   chmod 777 ~/Desktop/SetTime.desktop
   echo "Now actually activating program for first time."
   sudo python ~/Phoenix_NTP/SetTime.py
   echo "Finished installing Phoenix_NTP"
else
  echo "Exiting install. Did not install. User did not enter a \"y\""
fi
echo "Waiting 5 seconds before closing just so you can read the output. This message is useless."
sleep 5