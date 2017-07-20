#!/bin/sh

sudo -u root systemctl stop NetworkManager

sleep 2

sudo -u root ifconfig eno1 down
sleep 1
sudo -u root ifconfig wlp2s0 down

sleep 4

echo ""
echo "Ethernet:"
echo ""
sudo -u root macchanger -m 1c:ab:a7:00:00:01 eno1
echo ""
sudo -u root macchanger -e eno1
echo ""

sleep 8

echo ""
echo "WiFi:"
echo ""
sudo -u root macchanger -m 1c:ab:a7:00:00:02 wlp2s0
echo ""
sudo -u root macchanger -e wlp2s0
echo ""

sleep 8

sudo -u root ifconfig eno1 up
sleep 1
sudo -u root ifconfig wlp2s0 up 

sleep 4

sudo -u root systemctl start NetworkManager

sleep 2



