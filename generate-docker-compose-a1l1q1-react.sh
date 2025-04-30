#!/bin/bash

# Accept UserID and EmployeeNo as arguments
USER_ID=$1
EMPLOYEE_NO=$2

if [ -z "$USER_ID" ] || [ -z "$EMPLOYEE_NO" ]; then
  echo "Usage: ./generate-docker-compose-a1l1.sh <UserID> <EmployeeNo>"
  exit 1
fi

# Variables
PORT=$((8080 + USER_ID))
HOST_SRC_PATH="/home/kgm/docker-volumes/${EMPLOYEE_NO}"

# Ensure the host path exists
mkdir -p "$HOST_SRC_PATH"

# Generate Docker Compose file content
COMPOSE_CONTENT=$(cat <<EOF
version: '3.8'

services:
  code-server:
    container_name: "code-server-a1l1q1-react-${USER_ID}"
    image: "sankarkg/a1l1q1-react:latest"
    ports:
      - "8084:8080"
      - "5177:5173"
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

# Debug: Print the calculated port
echo "Calculated Port for UserID ${USER_ID}: ${PORT}"

# Debug: Print the Docker Compose file content
echo "Docker Compose Content:"
echo "$COMPOSE_CONTENT"

# Save the content to a Docker Compose file
COMPOSE_FILE_NAME="docker-compose-a1l1q1-react-${USER_ID}.yml"
echo "$COMPOSE_CONTENT" > "$COMPOSE_FILE_NAME"

chmod +x "$COMPOSE_FILE_NAME"

# Run Docker Compose to start the containers
docker compose -f "$COMPOSE_FILE_NAME" -p a1l1q1-react-${USER_ID} up -d
