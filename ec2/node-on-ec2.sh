curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 9.6.0
node -e "console.log('Running Node.js ' + process.version)"
