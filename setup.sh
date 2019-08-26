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
if [ "$machine" == "Mac" ]; then
    echo -e "${PURPLE} Installing VirtualBox..."
    sleep 1
    brew cask install virtualbox
    elif [ "$machine" == "Linux" ]; then
    sleep 1
    sudo apt-get update -y
    sudo apt-get install virtualbox -y 
else
    echo "VirtualBox has no support for your Operating System."
fi

if [ "$machine" == "Mac" ]; then
    echo -e "${PURPLE} Installing Vagrant..."
    sleep 1
    brew cask install vagrant
    elif [ "$machine" == "Linux" ]; then
    sleep 1
    sudo apt-get update -y
    sudo apt-get install vagrant -y 
else
    echo "VirtualBox has no support for your Operating System."
fi

























































