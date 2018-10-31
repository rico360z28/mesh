#!/bin/sh
# Root Check
exas="$(id -u)"
if [ "$exas" -gt 0 ] ;
then
# we can compare directly with this syntax.
  echo "Please run as root/sudo"
  echo "$exas"
  echo "sudo /.install"
  exit 1
else
  #do your stuff
  echo "Do Stuff"
  echo "$exas"
#
# Create Mesh Directory
mkdir ~/meshcentral
cd ~/meshcentral
#
# Apt update
apt update
apt install curl -y
#
# Installing Nodejs
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs
#
#Install Meshcentral2 via NPM
npm install meshcentral
#
sleep 2
#
cd ./node_modules/meshcentral
#creating local cert for Meshcentral
#
machine="$(hostname -A)"
node meshcentral --cert $(machine) &&
#
sleep 15
node meshcentral --stop
#
#
#
#
lanip="$(hostname -I)"
wanip="$(curl ifconfig.me)"
#
#
#
fi
  echo "Install Completed"
  echo "Verify and put public https address here $wanip"
  echo "Verify and put private https address here $lanip"
sleep 5



#systemctl enable meshcentral.service
#systemctl start meshcentral.service
#systemctl status meshcentral.service
