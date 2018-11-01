printf "installing nginx proxy...\n"

set -x

sudo apt install nginx
sudo rm /etc/nginx/sites-enabled/default
sudo cp ./nginx-proxy.conf /etc/nginx/sites-enabled/proxy.conf
sudo service nginx restart
