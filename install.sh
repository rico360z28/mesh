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
# Installing Nodejs
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs
#
#LANIP=
#WANIP=
#
#
#
fi
  echo "Install Completed"
  echo "Verify and put public https address here"
  echo "Verify and put private https address here"
sleep 5


# Using Ubuntu
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs


#systemctl enable meshcentral.service
#systemctl start meshcentral.service
#systemctl status meshcentral.service
