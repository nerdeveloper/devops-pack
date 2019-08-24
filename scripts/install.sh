#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

#version
TERRAFROM_VERSION=0.12.7
DOCKER_VERSION=19.0.0
KOPS_VERSION=2.0.1
ANSIBLE_VERSION=5.x
AWS-CLI_VERSION=0.1.2
AZURE-CLI_VERSION=2.9.0
GOOGLECLOUD-CLI_VERSION=2.x
GO_VERSION=2.2
ASPDOTNETCORE_VERSION=3.4
NODEJS_VERSION=

echo -e " ${BLUE} Updating Ubuntu Packages \[0m"
sleep 1
apt-get update
apt-apt --dist update

echo -e " ${PURPLE} Install zip and unzip"
sleep 2
apt-get install zip && apt-get install unzip

echo -e " ${BLUE} Installing Terraform"
cd /tmp && \
wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip > terraform.zip && \
unzip terraform.zip && \
mv terraform /usr/bin  && cd 