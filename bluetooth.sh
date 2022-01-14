#! /bin/bash

hciconfig hci0 name 'led-controller'
#hciconfig noauth
hciconfig hci0 sspmode 1
hciconfig hci0 down
hciconfig hci0 up
service bluetooth restart
#hciconfig hci0 name
#hciconfig hci0 piscan

bluetoothctl <<EOF
power on
discoverable on
pairable on
agent NoInputNoOutput
default-agent 
EOF
