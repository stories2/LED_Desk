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

bluetoothctl <<EOF
agent off
power on
discoverable on
pairable on
agent NoInputNoOutput
default-agent 
system-alias led-controller
EOF
