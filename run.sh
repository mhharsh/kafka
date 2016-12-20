#!/bin/bash

echo "Removing  the existing image"
docker-compose down

echo "Copying public key to current directory..."
cp ~/.ssh/id_rsa.pub .

echo "Force delete the existing image"
docker rmi -f harsh/ubuntu-ssh1

echo "Building the docker image..."
docker build -t harsh/ubuntu-ssh1 . 

echo "Bringing the kafka cluster up ..."
docker-compose up -d 

export ANSIBLE_HOST_KEY_CHECKING=False

echo "Executing the playbooks.."
ansible-playbook -i hosts -e 'host_key_checking=False' site.yaml 