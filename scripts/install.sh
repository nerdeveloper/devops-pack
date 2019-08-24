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
sudo apt-get update -y 

echo -e " ${PURPLE} Installing zip and unzip"
sleep 1
sudo apt-get install zip -y && sudo apt-get install unzip -y
echo -e " ${PURPLE}  zip and unzip has been installed!"

echo -e " ${PURPLE} Installing Python and Pip"
sleep 1
sudo apt-get install python3 -y && sudo apt-get install python3-pip -y
echo -e " ${PURPLE} Python and Pip has been installed! \e[0m "



echo -e " ${BLUE} Installing AWS CLI \e[0m "
sleep 2
sudo apt-get install awscli
echo -e " ${BLUE} AWS CLI has been installed! \e[0m "


echo -e " ${BLUE} Installing Terraform"
sleep 2
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFROM_VERSION}/terraform_${TERRAFROM_VERSION}_linux_amd64.zip  && \
unzip terraform_${TERRAFROM_VERSION}_linux_amd64.zip && \
mv terraform /usr/bin 
echo -e " ${BLUE} Terraform has been installed! \e[0m "

echo -e " ${BLUE} Installing Google Cloud CLI"
sleep 2
curl https://sdk.cloud.google.com | bash | exec -l $SHELL
echo -e " ${BLUE} Google Cloud CLI has been installed! \e[0m "