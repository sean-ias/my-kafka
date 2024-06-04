#!/bin/bash

# Retrieve the IP address of the Docker container
CONTAINER_NAME="kafka1"
CONTAINER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)
HOST_IP=$(hostname -I | awk '{print $1}')

# Export the environment variable
export MY_HOST_IP=$HOST_IP
export DOCKER_CONTAINER_IP=$CONTAINER_IP

# Run Docker Compose
docker compose -f kraft-single-node-sasl.yml up -d --build