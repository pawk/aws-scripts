# aws-scripts

## EC2

One can leverage install scripts from `ec2/` directory, like

```
. aws-scripts/ec2/proxy-node/install.sh
```

Some of the scripts offer User Data to be used as Launch Configuration, for example
```
aws-scripts/ec2/proxy-node/user-data.sh
```
This script will then call the install script on itself.
