#!/bin/bash

##format
terraform fmt

##init
terraform init

##plan
if [ $? = 0 ]; then
  terraform plan
fi

##deploy
if [ $? = 0 ]; then
  terraform apply -auto-approve
fi