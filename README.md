# capev2-virtualbox-install
scripts and files for installing cape v2 sandbox w/ virtualbox

1. Install Ubuntu 20.04 64-bit Desktop
2. Create/Use username cape
3. Install Virtualbox
```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo apt-get update
sudo apt-get install virtualbox-6.1
sudo usermod -a -G vboxusers cape
```
4. Create Virtualbox Host-Only interface
```
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0
```
5. Download cape2.sh from https://github.com/doomedraven/Tools/blob/master/Sandbox/cape2.sh and modify it
```
set NETWORK_IFACE to vboxnet0
set IFACE_IP to 0.0.0.0 - note: this will bind tor to all the ports and will allow other people to use your host as a proxy, i set it to 0.0.0.0 due to some issues i was having
Change PASSWD
```
6. Run `sudo ./cape2.sh base cape | tee cape.log`
7. Configuring CAPE
```
cd to /opt/CAPEv2/conf/
in auxiliary.conf, make sure interface is set to vboxnet0
in cuckoo.conf, machinery needs to be set to virtualbox
under resultserver section, set ip to 0.0.0.0 - note: this prevents cape/cuckoo from failing to bind at reboot but this also means we need to specify resultserver in virtualbox.conf file
in virtualbox.conf, uncomment the resultserver_ip line.
```
8. Create a new VM called cuckoo1, install Windows 7.
9. Configure Windows 7
```
Disable UAC
Disable Firewall
Disable AV
Install Python 3.7+ 32-bit
pip install pillow
Install other dependencies for running/opening your malicious files
Copy agent.py from /opt/CAPEv2/agent/agent.py to the VM (put it in startup folder)
Change IP address to 192.168.56.101, gateway to 192.168.56.1, and dns to whatever you prefer
Shutdown the VM
Change network adapter to use host-only adapter
Start the VM, once it's booted up and user interface is loaded, wait a few seconds and take your snapshot
```
10. Reboot host
11. Once the host is rebooted, check cape service status. Visit localhost:8000 to submit your files for analysis
