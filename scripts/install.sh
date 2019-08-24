#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

#version
TERRAFROM_VERSION=0.12.7
DOCKER_VERSION=19.0.0
KOPS_VERSION=2.0.1
ANSIBLE_VERSION=5.x
AZURE-CLI_VERSION=2.9.0
GOOGLECLOUD-CLI_VERSION=2.x
GO_VERSION=2.2
ASPDOTNETCORE_VERSION=3.4
NODEJS_VERSION=

echo -e " ${BLUE} Updating Ubuntu Packages \[0m"
sleep 1
sudo apt-get update

echo -e " ${PURPLE} Install zip and unzip"
sleep 1
sudo apt-get install zip && sudo apt-get install unzip

echo -e " ${PURPLE} Install Python and Pip"
sleep 1
sudo apt-get install python3 && sudo apt-get install python3-pip
echo -e " ${PURPLE} Python and Pip has been installed!"



echo -e " ${BLUE} Installing AWS CLI"
sleep 2
pip3 install awscli --upgrade --user
echo -e " ${BLUE} AWS CLI has been installed! "


echo -e " ${BLUE} Installing Terraform"
sleep 2
cd /tmp && \
wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip > terraform.zip && \
unzip terraform.zip && \
mv terraform /usr/bin  && cd 
echo -e " ${BLUE} Terraform has been installed! "