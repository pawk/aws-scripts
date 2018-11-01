# scripts and configurations
git clone https://github.com/pawk/aws-scripts

cd aws-scripts/ec2/

# install nginx proxy
. nginx-proxy.sh

# install node
. node-on-ec2.sh

rm -rf aws-scripts
