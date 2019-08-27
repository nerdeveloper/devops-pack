#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

echo "
+-+-+-+-+-+-+-+-+-+-+-+
|D|e|v|O|p|s|-|p|a|c|k|
+-+-+-+-+-+-+-+-+-+-+-+
"
checkOS () {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
}
checkOS
if [ ! -x "$(command -v vagrant)" ]; then
    
    if [ "$machine" == "Mac" ]; then
        echo -e "${PURPLE} Installing Vagrant..."
        sleep 1
        brew cask install vagrant
        echo -e " ${PURPLE} Vagrant has been installed!"
        elif [ "$machine" == "Linux" ]; then
        echo -e "${PURPLE} Installing Vagrant... \e[0m "
        sleep 1
        sudo apt-get update -y
        sudo apt-get install vagrant -y
        echo -e " ${PURPLE} Vagrant has been installed! \e[0m "
        
    else
        echo -e " ${PURPLE} Vagrant has been installed already!"
    fi
    
elif [ ! -x "$(command -v virtualbox)" ];
then
    
    if [ "$machine" == "Mac" ]; then
        echo -e "${PURPLE} Installing VirtualBox..."
        sleep 1
        brew cask install virtualbox
        echo -e " ${PURPLE} Virtualbox has been installed!"
        elif [ "$machine" == "Linux" ]; then
        echo -e "${PURPLE} Installing VirtualBox... \e[0m"
        sleep 1
        sudo apt-get update -y
        sudo apt-get install virtualbox -y
        echo -e " ${PURPLE} Virtualbox has been installed! \e[0m "
    else
        echo -e " ${PURPLE} Vagrant has been installed already!"
    fi
else
    echo -e " ${BLUE} Your machine has meet the requirements to install DevOps-pack."
fi





























































