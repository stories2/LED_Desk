#! /bin/bash

docker build -t led_frontend ./frontend/
docker run --rm --name led_frontend -v $(pwd)/backend/src/templates:/app/dist/spa led_frontend 

zip -r deploy.zip ./ -x 'frontend/*' '.git/*'

sshpass -p "$(echo $1)" scp deploy.zip pi@192.168.0.13:/home/pi/

rm deploy.zip

rm -rf ./backend/src/templates/*

sshpass -p "$(echo $1)" ssh pi@192.168.0.13 "sh update.sh"