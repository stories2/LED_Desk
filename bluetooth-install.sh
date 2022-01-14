#! /bin/bash

sudo apt-get install bluez-tools -y

echo "* 1234" > /etc/bluetooth/pin.conf

chown root:root /etc/bluetooth/pin.conf
chmod 600 /etc/bluetooth/pin.conf

cp bt-agent.service /etc/systemd/system/

systemctl disable bt-agent
systemctl daemon-reload
systemctl enable bt-agent
systemctl restart bt-agent
systemctl status bt-agent.service
