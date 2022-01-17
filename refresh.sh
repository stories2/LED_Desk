#! /bin/bash

git pull

docker build -t led_frontend ./frontend/
docker run  --name led_frontend -v ./backend/src/templates:/app/dist/spa led_frontend 

sudo docker-compose build
sudo docker-compose up -d