#! /bin/bash

hciconfig hci0 name 'led-controller'
hciconfig hci0 name
service bluetooth restart
hciconfig hci0 piscan
