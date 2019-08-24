#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

#version
TERRAFROM_VERSION=0.12.7
DOCKER_VERSION=19.0.0
KOPS_VERSION=2.0.1
ANSIBLE_VERSION=5.x
GO_VERSION=1.12.9
ASPDOTNETCORE_VERSION=3.4

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


# Installation for AWS CLI
echo -e " ${BLUE} Installing AWS CLI \e[0m "
sleep 2
sudo apt-get install awscli -y
echo -e " ${BLUE} AWS CLI has been installed! \e[0m "


#Installations for Google Clouc SDK
echo -e " ${BLUE} Installing Google Cloud SDK"
sleep 2

# Create an environment variable for the correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y 

echo -e " ${BLUE} Google Cloud CLI has been installed! \e[0m "

#Installations for Microsft Azure CLI
echo -e " ${BLUE} Installing Microsoft Azure CLI"
sleep 2

# Get packages needed for the install process:
sudo apt-get update -y
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y 

# Download and install the Microsoft signing key:
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null


# Add the Azure CLI software repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update repository information and install the azure-cli package:
sudo apt-get update
sudo apt-get install azure-cli -y 

echo -e " ${BLUE} Microsoft Azure CLI has been installed! \e[0m "


#Installations for Go 
echo -e " ${BLUE} Installing Go "
sleep 2
cd /tmp && \
wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
sudo tar -xvf go${GO_VERSION}.linux-amd64.tar.gz
mv go /usr/bin 
echo -e " ${BLUE} Go has been installed! \e[0m"


#Installations for Terraform
echo -e " ${BLUE} Installing Terraform"
sleep 2
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFROM_VERSION}/terraform_${TERRAFROM_VERSION}_linux_amd64.zip  && \
unzip terraform_${TERRAFROM_VERSION}_linux_amd64.zip && \
mv terraform /usr/bin 
echo -e " ${BLUE} Terraform has been installed! \e[0m"

