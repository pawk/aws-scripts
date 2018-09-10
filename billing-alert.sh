#!/bin/bash

usage() {
  printf "\nusage: ./billing-alert.sh [email]\n\n"
  exit
}

topic=$(aws sns create-topic \
  --name "BillingAlert" \
  --output text \
  --query 'TopicArn'
)

subscribe() {
  email=$1
  echo "Subscribing to $topic with $email..."
  if [ -z "$email" ]; then
    usage
  fi
  aws sns subscribe \
    --topic-arn "$topic" \
    --protocol email \
    --notification-endpoint "$email"
}

alarm() {
  for amount in 1 10
  do
    echo "Setting up alarm for \$$amount..."
    aws cloudwatch put-metric-alarm \
      --alarm-name "awsbilling-$amount" \
      --alarm-description "AWS billing alarm: \$$amount" \
      --namespace AWS/Billing \
      --metric-name EstimatedCharges \
      --evaluation-periods 1 \
      --period 21600 \
      --statistic Maximum \
      --comparison-operator GreaterThanOrEqualToThreshold \
      --dimensions "Name=Currency,Value=USD" \
      --threshold "$amount"\
      --actions-enabled \
      --alarm-actions "$topic"
  done
}

subscribe $1
alarm
