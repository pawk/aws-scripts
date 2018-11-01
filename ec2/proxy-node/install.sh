workdir=$(dirname $0)

# install nginx proxy
. "$workdir../reverse-proxy/install.sh"

# install node
. "$workdir../node/install.sh"
