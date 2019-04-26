#!/bin/sh
# Root Check
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
# Create Mesh Directory
mkdir ~/meshcentral
#
# Creating Service
sudo cp ./meshcentral.service /etc/systemd/system/meshcentral.service
sudo cp ./meshstart.sh /opt/meshstart.sh
#
# Work in directory
cd ~/meshcentral
#
# Add Mesh Path to environment
MESHPATH="$PWD/node_modules"
echo $MESHPATH
sleep 5
echo "MESHPATH=\"$PWD/node_modules"\" | sudo tee -a /etc/environment > /dev/null
source /etc/environment
echo $MESHPATH
sleep 5
#
# Apt update
apt update
apt install curl -y
#
# Installing Nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
#
#Install Meshcentral2 via NPM
npm install meshcentral
#
sleep 2
#
cd $MESHPATH
#creating local cert for Meshcentral
#
machine="$(hostname -A)"
meshcert="node meshcentral --cert $machine"
#
echo $meshcert
#
$meshcert &
#node meshcentral --cert &
#
sleep 5
echo "Server will be stopped after local cert is created"
sleep 10
kill $(ps aux | grep '[m]esh' | awk '{print $2}')

#Installing Service
systemctl enable meshcentral.service
systemctl start meshcentral.service
systemctl status meshcentral.service
#
sleep 5
#
lanip="$(hostname -I | tr -d ' ')"
wanip="$(curl ifconfig.me )"
port="$(netstat -pant | grep -m1 '[n]ode' | awk '{print $4}' | cut -f2 -d":" | tail -n1)"
#
fi
  echo "Install Completed for $machine "
  echo "Meshcentral 2 is available at (if open to internet) $wanip:$port "
  echo "Meshcentral 2 is available at $lanip:$port "
sleep 5
