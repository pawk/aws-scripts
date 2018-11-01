printf "installing nginx proxy...\n"

workdir=$(dirname $0)

sudo apt install nginx -y
if [ -f /etc/nginx/sites-enabled/default ]; then
  sudo rm /etc/nginx/sites-enabled/default
fi
sudo cp "$workdir/nginx-proxy.conf" /etc/nginx/sites-enabled/proxy.conf
sudo service nginx restart
