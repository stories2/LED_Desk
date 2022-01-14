#! /bin/bash

hciconfig hci0 name 'led-controller'
service bluetooth restart
