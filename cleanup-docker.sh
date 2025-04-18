#!/bin/bash

# 🚨 Fail fast on any error
set -e

echo "🧹 Starting Docker cleanup..."

# Stop and remove all containers
docker rm -f $(docker ps -aq) 2>/dev/null || echo "No containers to remove."

# Remove all images
docker rmi -f $(docker images -q) 2>/dev/null || echo "No images to remove."

# Prune networks
docker network prune -f

echo "✅ Docker cleanup complete."
