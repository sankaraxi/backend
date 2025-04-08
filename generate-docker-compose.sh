param (
    [int]$UserID
)
if (-not $UserID) {
    Write-Host "Usage: .\generate-docker-compose.ps1 -UserID <user_id>"
    exit
}

# Variables
$Port = 8080 + $UserID
# $Password = "test"
# $ImageName = "krishnapriyap/merntest:latest"

# Generate Docker Compose file content
$composeContent = @"
version: '3.8'

services:
  code-server:
    image: "sankarkg/sample-coder:latest"
    ports:
      - "8080:8080"
    volumes:
      - frontend-src:/home/coder/project/src
    environment:
      - WATCHPACK_POLLING=tru
    command:
        code-server --bind-addr 0.0.0.0:8080 --auth none /home/coder/project
    networks:
      - my_network

  nginx:
    image: nginx
    # volumes:
    #   - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - "3005:80"
    depends_on:
      - code-server
      
      
networks:
  my_network:
    driver: bridge

volumes:
  # mysql-data:
  frontend-src:
  # user_workspace_1:
    driver: local
 
# networks:
#   my_network:
#     driver: bridge
"@


# Debug: Print the calculated port
Write-Host "Calculated Port for UserID ${UserID}: ${Port}"

# Debug: Print the Docker Compose file content
Write-Host "Docker Compose Content:"
Write-Host ${composeContent}

# Save the content to a Docker Compose file
$composeFileName = "docker-compose-user-$UserID.yml"
$composeContent | Out-File -FilePath $composeFileName -Encoding utf8

# Run Docker Compose to start the containers
docker-compose -f $composeFileName up -d