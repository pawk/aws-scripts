printf "installing nginx proxy...\n"

sudo apt install nginx -y
sudo rm /etc/nginx/sites-enabled/default
sudo cp ./nginx-proxy.conf /etc/nginx/sites-enabled/proxy.conf
sudo service nginx restart