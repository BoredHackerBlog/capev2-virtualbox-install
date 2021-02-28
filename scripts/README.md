cape2.sh was copied from https://github.com/doomedraven/Tools/blob/master/Sandbox/cape2.sh, license is in cape2_LICENSE.txt

What I modified:
- set NETWORK_IFACE to vboxnet0
- set IFACE_IP to 0.0.0.0 (this is for tor. it'll bind tor to 0.0.0.0 this is fine for the way i have my machine setup, it may not be for you)
- changed PASSWD
- changed install_osslsigncode section to install without user interaction