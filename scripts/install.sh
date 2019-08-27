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


echo -e " ${BLUE} Updating Ubuntu Packages \e[0m "
sleep 1
sudo apt-get update -y
sudo apt-get install zip -y && sudo apt-get install unzip -y

function runAWS() {
# Installation for AWS CLI
echo -e " ${BLUE} Installing AWS CLI \e[0m "
sleep 2
sudo apt-get install awscli -y
echo -e " ${BLUE} AWS CLI has been installed! \e[0m "
}

function runGoogleCloud(){
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
}

function runAzure() {
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

}

function runGo() {
# #Installations for Go
echo -e " ${BLUE} Installing Go "
sleep 2
cd /tmp && \
wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
sudo tar -xvf go${GO_VERSION}.linux-amd64.tar.gz
sudo mv go/ /usr/local/go

echo  GOROOT=/usr/local/go >> /home/vagrant/.bashrc && \
echo  GOPATH=/home/vagrant/goprojects >> /home/vagrant/.bashrc && \
echo  PATH=/home/vagrant/goprojects/bin:/usr/local/go/bin:/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc

echo -e " ${BLUE} Go has been installed! \e[0m"

}

function runTerraform(){
#Installations for Terraform
echo -e " ${BLUE} Installing Terraform"
sleep 2
cd /tmp && \
wget https://releases.hashicorp.com/terraform/${TERRAFROM_VERSION}/terraform_${TERRAFROM_VERSION}_linux_amd64.zip  && \
unzip terraform_${TERRAFROM_VERSION}_linux_amd64.zip && \
mv terraform /usr/local/bin
echo -e " ${BLUE} Terraform has been installed! \e[0m"

}
function runAnsible() {
#Installations for Ansible
echo -e " ${BLUE} Installing Ansible"
sleep 2
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y  && \
sudo apt-get update -y && \
sudo apt-get install ansible -y

echo -e " ${BLUE} Ansible has been installed! \e[0m"
}

function runDotNetCore() {
#Installations for Dotnetcore
echo -e " ${BLUE} Installing Dotnetcore"
sleep 2
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update -y 
sudo apt-get install dotnet-sdk-2.2 -y 
echo -e " ${BLUE} Dotnetcore has been installed! \e[0m"
}

function runDocker() {
#Installations for Docker
echo -e " ${BLUE} Installing DOCKER"
sleep 2
usermod -G docker ubuntu
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu
    $(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo -e " ${BLUE} Docker has been installed! \e[0m"

}

function runKops() {
#Installations for Kubernetes(Kops)
echo -e " ${BLUE} Installing Kubernetes(Kops)"
sleep 2
curl -LO https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv ./kops-linux-amd64 /usr/local/bin/kops
echo -e " ${BLUE} Kubernetes(Kops)has been installed! \e[0m"
}

function runNode() {
#Installations for Nodejs
echo -e " ${BLUE} Installing Nodejs"
sleep 2
curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} -o nodesource_setup.sh && \
sudo bash nodesource_setup.sh && \
sudo apt-get install nodejs -y
echo -e " ${BLUE} Nodejs has been installed! \e[0m"
}

function runPacker() {
#Installations for Packer
echo -e " ${BLUE} Installing Packer"
sleep 2
cd /tmp && \
wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip packer_${PACKER_VERSION}_linux_amd64.zip
sudo mv packer /usr/local/bin


echo -e " ${BLUE} Packer has been installed! \e[0m"

}
