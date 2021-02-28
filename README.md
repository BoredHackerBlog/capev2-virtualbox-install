# capev2-virtualbox-install
scripts and files for installing cape v2 sandbox w/ virtualbox

1. Install Ubuntu 20.04 64-bit Desktop
2. Create/User username cape
3. Install Virtualbox
```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-6.1
sudo usermod -a -G vboxusers cape
```
4. Create Virtualbox Host-Only interface
```
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0
```
5. 
