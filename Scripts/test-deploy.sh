#!/bin/bash

sudo docker build --no-cache -t rabbitmq .

echo "tagging image"
sleep 2
sudo docker tag rabbitmq ghcr.io/goingoffroading/rabbitmq:latest

#Will require token, not for public use
echo "pushing to github"
sleep 2
sudo docker push ghcr.io/goingoffroading/rabbitmq:latest

echo "Done, now lets clean up"
sleep 5
sudo docker image rm ghcr.io/goingoffroading/rabbitmq:latest
sudo docker image rm rabbitmq
