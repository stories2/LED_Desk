#! /bin/bash

hciconfig hci0 name 'led-controller'
hciconfig hci0 down
hciconfig hci0 up
service bluetooth restart
hciconfig hci0 name
hciconfig hci0 piscan
