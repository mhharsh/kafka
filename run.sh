#!/bin/bash

echo "Removing  the existing image"
docker-compose down

# echo "Copying public key to current directory..."
# cp ~/.ssh/id_rsa.pub .

# echo "Force delete the existing java image"
# docker rmi -f harsh/ubuntu-java-ssh

# echo "Force delete the existing golang image"
# docker rmi -f harsh/ubuntu-go-ssh

# echo "Building the docker image for java..."
# docker build -t harsh/ubuntu-java-ssh -f Dockerfile_java .

# echo "Building the docker image for golang..."
# docker build -t harsh/ubuntu-go-ssh -f Dockerfile_go .

echo "Bringing the kafka cluster up ..."
docker-compose up -d 

export ANSIBLE_HOST_KEY_CHECKING=False

echo "Executing the playbooks.."
ansible-playbook -i hosts -e 'host_key_checking=False' site.yaml 