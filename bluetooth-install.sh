#! /bin/bash

sudo apt-get install bluez-tools -y

echo "* 1234" > /etc/bluetooth/pin.conf

chown root:root /etc/bluetooth/pin.conf
chmod 600 /etc/bluetooth/pin.conf

cp bt-agent.service /etc/systemd/system/

cp -o main.conf /etc/bluetooth/

systemctl restart bluetooth

hciconfig hci0 down
sleep 1
hciconfig hci0 up
sleep 1

systemctl disable bt-agent
systemctl daemon-reload
systemctl enable bt-agent
systemctl restart bt-agent
systemctl status bt-agent.service
