#!/bin/bash

# Define version tag
VERSION="v1.0.0"

# Build and tag frontend and backend Docker images
docker build -t your_dockerhub_username/frontend:$VERSION ./frontend
docker build -t your_dockerhub_username/backend:$VERSION ./backend

# Push images to Docker Hub
docker push your_dockerhub_username/frontend:$VERSION
docker push your_dockerhub_username/backend:$VERSION

# Update docker-compose file with new image versions
sed -i "s|your_dockerhub_username/frontend:.*|your_dockerhub_username/frontend:$VERSION|g" docker-compose.yml
sed -i "s|your_dockerhub_username/backend:.*|your_dockerhub_username/backend:$VERSION|g" docker-compose.yml

# Run Docker Compose
docker-compose up -d
