aws ecr --region $3 get-login-password | sudo docker login --username AWS --password-stdin  $1/$2


if [ ! "$(sudo docker network ls | grep net)" ]; then
  echo "Creating net network ..."
  sudo docker network create net
else
  echo "net network exists."
fi

if [ "$(sudo docker ps -aq -f name=nginx-proxy)" ]; then
    # cleanup
    echo "Cleaning Nginx Proxy ..."
    sudo docker rm nginx-proxy -f
fi

sudo cp prod-scripts/api.fnties /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/api.fnties /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx


cd $HOME/prod-scripts/

sudo docker-compose down
sudo docker rm $(sudo docker ps -q) -f
sudo docker rmi $(sudo docker images -q) -f

sudo docker pull $1/$2:api-prod
sudo docker tag  $1/$2:api-prod api-prod

sudo docker-compose up -d 
