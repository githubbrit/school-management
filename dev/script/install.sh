# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo groupadd docker
sudo usermod -aG docker ${USER}

# Install AWS CLI
sudo apt-get install -y awscli

# Install nginx
sudo apt-get install nginx -y

#!/bin/sh
node-gyp rebuild
