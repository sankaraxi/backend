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
    container_name: "code-server-fullstack"
    image: "sankarkg/a1010-new:latest"
    ports:
      - "8081:8080"
      - "3000:3000"
      - "5000:5000"
    volumes:
      - project-src:/home/coder/project
    environment:
      - WATCHPACK_POLLING=true
    command:
        code-server --bind-addr 0.0.0.0:8080 --auth none /home/coder/project
    networks:
      - my_network
    depends_on:
      - mysql

  # nginx:
  #   image: nginx
  #   volumes:
  #     - ./nginx.conf:/etc/nginx/nginx.conf
  #   ports:
  #     - "3005:80"
  #   depends_on:
  #     - code-server
      
  mysql:
    image: mysql:8
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: Crm@123
      MYSQL_DATABASE: crm
    volumes:
      - mysql-data:/var/lib/mysql
    ports:
      - "3307:3306"
    networks:
      - my_network
networks:
  my_network:
    driver: bridge

volumes:
  project-src:
    driver: local
  mysql-data:
  
 
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
$composeFileName = "docker-compose-a10l10-$UserID.yml"
$composeContent | Out-File -FilePath $composeFileName -Encoding utf8

# Run Docker Compose to start the containers
docker-compose -f $composeFileName -p fullstack up -d