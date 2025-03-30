#! /bin/bash
# This script is used to rebuild the Java application and the database
# It will stop and remove the existing containers, build the new images, and start the containers again

set -e  # Exit immediately if a command exits with a non-zero status

echo "Rebuilding the Java application and database"
echo "Stopping and removing existing containers..."
docker-compose -f docker-compose.all.yaml down
echo "Building the new images..."
docker-compose -f docker-compose.all.yaml build
echo "Starting the containers..."
docker-compose -f docker-compose.all.yaml up -d

# Perform health checks with improved readability
echo "Checking application health..."
curl -s -w "\n" http://localhost:8080/api/healthcheck

echo "Fetching users..."
curl -s -w "\n" http://localhost:8080/api/users

echo "Fetching orders..."
curl -s -w "\n" http://localhost:8080/api/orders