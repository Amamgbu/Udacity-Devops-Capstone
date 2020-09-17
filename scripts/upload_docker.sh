#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
dockerpath="amamgbu/car-classifier"

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login

docker tag car-classifier $dockerpath:latest
# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest