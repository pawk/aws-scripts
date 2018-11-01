# scripts and configurations
git clone https://github.com/pawk/aws-scripts

sudo apt install nginx
sudo rm /etc/nginx/sites-enabled/default
sudo cp ./aws-scripts/ec2/nginx-proxy.conf /etc/nginx/sites-enabled/proxy.conf
sudo service nginx restart
