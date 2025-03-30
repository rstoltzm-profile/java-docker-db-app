#! /bin/bash
# This script is used to health check

echo "Checking app health..."
response=$(curl -s http://localhost:8080/api/healthcheck)

if [ -z "$response" ]; then
    echo "application health failed: Response is null or empty"
    exit 1
else
    echo "$response"
fi

echo "Fetching users..."
response=$(curl -s http://localhost:8080/api/users)

if [ -z "$response" ]; then
    echo "Failed to fetch users: Response is null or empty"
    exit 1
else
    echo "$response"
fi

echo "Fetching orders..."
curl -s -w "\n" http://localhost:8080/api/orders