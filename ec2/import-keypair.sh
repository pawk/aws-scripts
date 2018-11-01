keypair=$1

usage() {
  printf "\nUsage: ./import-keypair.sh [name] [file]\n\n"
}

if [ -z "$keypair" ]; then
  usage >&2
  exit 1
fi

default_keypair_file=$HOME/.ssh/id_rsa.pub
keypair_file=${2:-$default_keypair_file}

if [ ! -e "$keypair_file" ]; then
  printf "\nError: file $keypair_file does not exist\n"
  usage >&2
  exit 1
fi

printf "\nProceeding with file: $keypair_file\n"

regions=$(aws ec2 describe-regions \
  --output text \
  --query 'Regions[*].RegionName')

for region in $regions; do
  echo "Importing keypair to $region..."
  aws ec2 import-key-pair \
    --region "$region" \
    --key-name "$keypair" \
    --public-key-material "file://$keypair_file"
done