# alternate-simple-ntp-phoenix
NTP (Network Time Protocol) isn't working for me on Linux. So I made my own! This is written in python and bash. It's an extremely simple network time protocol, that gets the time from the internet, rather than your computer.

If you find a bug, please report it on the [Issues](https://github.com/PhoenixStormJr/alternate-simple-ntp-phoenix/issues) tab. I like [feedback](https://github.com/PhoenixStormJr/alternate-simple-ntp-phoenix/discussions) so if you found this program useful, leave a comment! Not for the algorithm just... to make me happy please.

Instructions to install:

(Either just click the install script or...)

1: download here:

https://github.com/PhoenixStormJr/alternate-simple-ntp-phoenix/archive/refs/heads/main.zip

2: Copy SetTime.py to /home/UserName/Phoenix_NTP/SetTime.py. If the folder does not exist, create it.

3: Copy SetTime.desktop to /home/UserName/.config/autostart/SetTime.desktop and (optionally) copy SetTime.desktop to /home/UserName/Desktop/SetTime.desktop

4: Sometimes ntp is broken, so let's turn it off with this command: sudo timedatectl set-ntp false

5 (optional): Copy the file Allow_All_Users_To_Change_Date_And_Time to the folder /etc/sudoers.d. This will allow anyone to set the time without a password.

Oooooooorrrrrr just double click install_Phoenix_NTP.desktop..... yeah, I made an install script.

# Google colab to test it:

Python updated for date now:

https://colab.research.google.com/github/PhoenixStormJr/alternate-simple-ntp-phoenix/blob/main/Date_And_Time_with_server_python_3.ipynb

Now I've re programmed it in Bash! And now updated it to do the date, and it's faster! I think maybe bash should be the default, since some linux computers don't have python?:

https://colab.research.google.com/github/PhoenixStormJr/alternate-simple-ntp-phoenix/blob/main/Date_And_Time_with_server_bash_4.ipynb
