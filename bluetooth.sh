#! /bin/bash

#hciconfig hci0 name 'led-controller'
#hciconfig noauth
#hciconfig hci0 sspmode 1
#hciconfig hci0 down
#hciconfig hci0 up
#service bluetooth restart
#sleep 10
#hciconfig hci0 name
#hciconfig hci0 piscan

<<'###'
hciconfig hci0 sspmode 0

bluetoothctl <<EOF
agent off
power on
system-alias led-controller
discoverable on
pairable on
agent NoInputNoOutput
default-agent 
EOF
###

bluetoothctl <<EOF
power on
discoverable on
agent NoInputNoOutput
default-agent
EOF
