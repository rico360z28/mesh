#!/bin/sh
Root Check
exas="$(id -u)"
if [ "$exas" -gt 0 ] ;
then
# we can compare directly with this syntax.
  echo "Please run as root/sudo"
  echo "$exas"
  echo "sudo ./install.sh"
  exit 1
else
#do your stuff
#
sudo apt remove nodejs -y
sudo rm -r ~/meshcentral
#
#Removing Service
systemctl stop meshcentral.service
systemctl disable meshcentral.service
#
sleep 5
#
sudo rm /opt/meshstart.sh
sudo rm /etc/systemd/system/meshcentral.service
#
sudo sed -i '/^MESHPATH\s/d' /etc/environment
#
fi
