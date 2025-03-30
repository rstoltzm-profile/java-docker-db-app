#! /bin/bash
# This script is used to rebuild the Java application and the database
# It will stop and remove the existing containers, build the new images, and start the containers again

set -e  # Exit immediately if a command exits with a non-zero status

echo "Rebuilding just the Java application"
echo "Stopping and removing existing containers..."
docker-compose -f docker-compose.all.yaml down app
echo "Building the new images..."
docker-compose -f docker-compose.all.yaml build app
echo "Starting the containers..."
docker-compose -f docker-compose.all.yaml up -d app
