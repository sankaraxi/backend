#!/bin/bash

# Accept UserID and EmployeeNo as arguments
USER_ID=$1
EMPLOYEE_NO=$2
DOCKER_PORT=$3
OUTPUT_PORT=$4

if [ -z "$USER_ID" ] || [ -z "$EMPLOYEE_NO" ]; then
  echo "Usage: ./generate-docker-compose-a1l1.sh <UserID> <EmployeeNo>"
  exit 1
fi

# Variables
PORT=$((8080 + USER_ID))
HOST_SRC_PATH="/home/kgm/docker-volumes/${EMPLOYEE_NO}/react"
IMAGE_NAME="sankarkg/a1l1q3-react:latest"
TMP_CONTAINER="temp-initializer-${USER_ID}"

# Ensure the host path exists
mkdir -p "$HOST_SRC_PATH"

# Check if folder is empty
if [ -z "$(ls -A "$HOST_SRC_PATH")" ]; then
  echo "Host path is empty. Copying default project files from image..."

  # Create a temp container to copy files from
  docker create --name "$TMP_CONTAINER" "$IMAGE_NAME"
  
  # Copy contents from the image to host
  docker cp "${TMP_CONTAINER}:/home/coder/project/src/." "$HOST_SRC_PATH"
  
  # Clean up the temporary container
  docker rm "$TMP_CONTAINER"
else
  echo "Host path already has files. Skipping copy."
fi

sudo chown -R 1000:1000 "$HOST_SRC_PATH"

# Generate Docker Compose file content
COMPOSE_CONTENT=$(cat <<EOF
version: '3.8'

services:
  code-server:
    container_name: "code-server-a1l1q3-react-${USER_ID}"
    image: "$IMAGE_NAME"
    ports:
      - "${DOCKER_PORT}:8080"
      - "${OUTPUT_PORT}:5173"
    volumes:
      - ${HOST_SRC_PATH}:/home/coder/project/src
    environment:
      - WATCHPACK_POLLING=true
    command:
      code-server --bind-addr 0.0.0.0:8080 --auth none /home/coder/project
    networks:
      - my_network

networks:
  my_network:
    driver: bridge
EOF
)

# Save the Docker Compose file
COMPOSE_FILE_NAME="docker-compose-a1l1q3-react-${USER_ID}.yml"
echo "$COMPOSE_CONTENT" > "$COMPOSE_FILE_NAME"
chmod +x "$COMPOSE_FILE_NAME"

# Show useful info
echo "Generated Compose file: $COMPOSE_FILE_NAME"
echo "Launching container on port $PORT..."

# Run Docker Compose to start the containers
docker compose -f "$COMPOSE_FILE_NAME" -p a1l1q3-react-${USER_ID} up -d
