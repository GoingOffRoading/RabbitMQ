#!/bin/bash

echo "Building the Docker Image"
sudo docker build -t rabbitmq . 

echo "Running the Docker Image"
sudo docker run -d -p 15672:15672 rabbitmq

echo "Done"
sleep 5
sudo docker container ls -a | grep -e 'CONTAINER\|rabbitmq'

echo "Check if the UI is running on IP of this machine, port 15672"
