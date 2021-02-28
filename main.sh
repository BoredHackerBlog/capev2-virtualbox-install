cd scripts
chmod +x *.sh
echo "Installing vbox"
./install_vbox.sh
echo "Installing CAPE"
sudo ./cape2.sh base cape | tee cape.log
cd ..
cd conf_files
echo "Copying conf files"
cp auxiliary.conf /opt/CAPEv2/conf/
cp cuckoo.conf /opt/CAPEv2/conf/
cp virtualbox.conf /opt/CAPEv2/conf/
echo "Done"