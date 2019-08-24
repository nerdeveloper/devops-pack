#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

#version
TERRAFROM_VERSION=0.12.7
KOPS_VERSION=1.13.0
GO_VERSION=1.12.9
NODEJS_VERSION='10.x'
PACKER_VERSION=1.4.3


echo -e " ${BLUE} Updating Ubuntu Packages \[0m"
sleep 1
sudo apt-get update -y

echo -e " ${PURPLE} Installing zip and unzip"
sleep 1
sudo apt-get install zip -y && sudo apt-get install unzip -y
echo -e " ${PURPLE}  zip and unzip has been installed!"

source ./installer.sh

