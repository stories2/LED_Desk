#! /bin/bash

sudo apt-get install bluez-tools -y

echo "* 1234" > /etc/bluetooth/pin.conf

chown root:root /etc/bluetooth/pin.conf
chmod 600 /etc/bluetooth/pin.conf
