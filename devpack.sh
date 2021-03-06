#!/bin/bash
set -e

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

echo "
+-+-+-+-+-+-+-+-+-+-+-+
|D|e|v|O|p|s|-|p|a|c|k|
+-+-+-+-+-+-+-+-+-+-+-+
"
if [ ! -x "$(command -v vagrant)" ] && [ ! -x "$(command -v virtualbox)" ]; then
    echo -e " ${RED} Error: Your machine does not have the requirements to run DevOps-pack. Run *bash setup.sh* "
    exit 0
fi



function createfile() {
    FILE=./scripts/install.sh.bak
    if [ ! -f "$FILE" ]; then
        cp -r scripts/install.sh scripts/install.sh.bak
        
        
    fi
}
createfile

#Menu options
options[0]="Docker"
options[1]="Kubernetes(Kops) and Kubectl"
options[2]="Ansible"
options[3]="Packer"
options[4]="Terraform"
options[5]="DotnetCore"
options[6]="Nodejs"
options[7]="Go"
options[8]="AWS CLI"
options[9]="Microsoft Azure CLI"
options[10]="Google Cloud CLI(gcloud)"

#Actions to take based on selection
function ACTIONS {
    if [[ ${choices[0]} ]]; then
        #Option 1 selected
        echo "Option 1 selected which is Docker"
        echo -e '\nrunDocker' >> scripts/install.sh
        
    fi
    if [[ ${choices[1]} ]]; then
        #Option 2 selected
        echo "Option 2 selected which is Kubernetes(Kops) and Kubectl"
        echo -e  '\nrunKops' >> scripts/install.sh
    fi
    if [[ ${choices[2]} ]]; then
        #Option 3 selected
        echo "Option 3 selected which is Ansible"
        echo -e '\nrunAnsible' >> scripts/install.sh
        
    fi
    if [[ ${choices[3]} ]]; then
        #Option 4 selected
        echo "Option 4 selected which is Packer"
        echo -e '\nrunPacker' >> scripts/install.sh
        
    fi
    if [[ ${choices[4]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which is Terraform"
        echo -e '\nrunTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[5]} ]]; then
        #Option 6 selected
        echo "Option 6 selected which is DotNetCore"
        echo -e '\nrunDotNetCore' >> scripts/install.sh
    fi
    if [[ ${choices[6]} ]]; then
        #Option 7 selected
        echo "Option 7 selected which is Nodejs"
        echo -e '\nrunNode' >> scripts/install.sh
    fi
    if [[ ${choices[7]} ]]; then
        #Option 8 selected
        echo "Option 8 selected which is Go"
        echo -e '\nrunGo' >> scripts/install.sh
    fi
    if [[ ${choices[8]} ]]; then
        #Option 9 selected
        echo "Option 9 selected which is AWS CLI"
        echo -e '\nrunAWS' >> scripts/install.sh
    fi
    if [[ ${choices[9]} ]]; then
        #Option 10 selected
        echo "Option 10 selected which Microsoft Azure CLI"
        echo -e '\nrunAzure' >> scripts/install.sh
    fi
    if [[ ${choices[10]} ]]; then
        #Option 11 selected
        echo "Option 11 selected which Google Cloud CLI(gloud)"
        echo -e '\nrunGoogleCloud' >> scripts/install.sh
    fi
    
}

#Variables
ERROR=" "

#Menu function
function MENU {
    echo "Menu Options"
    for NUM in ${!options[@]}; do
        echo "[""${choices[NUM]:- }""]" $(( NUM+1 ))") ${options[NUM]}"
    done
    echo "$ERROR"
}

#Menu loop
while MENU && read -e -p "Select the desired options using their number (again to uncheck, ENTER when done): " -n2 SELECTION && [[ -n "$SELECTION" ]]; do
    clear
    if [[ "$SELECTION" == *[[:digit:]]* && $SELECTION -ge 1 && $SELECTION -le ${#options[@]} ]]; then
        (( SELECTION-- ))
        if [[ "${choices[SELECTION]}" == "+" ]]; then
            choices[SELECTION]=""
        else
            choices[SELECTION]="+"
        fi
        ERROR=" "
    else
        ERROR="Invalid option: $SELECTION"
    fi
done



ACTIONS

sleep 1
echo -e " ${BLUE} Please wait while we install your DevOps-Pack"
sleep 2
if vagrant up; then
    rm scripts/install.sh
    mv scripts/install.sh.bak scripts/install.sh
    echo Done.
    sleep 1
    echo -e " ${PURPLE} Enter 'vagrant ssh' to login into your devops-pack"
    echo -e " ${PURPLE} Enter 'vagrant destroy -f ' to delete into your devops-pack"
    echo -e " ${PURPLE} Tweet me @_nerdeveloper."
else
    rm scripts/install.sh
    mv scripts/install.sh.bak scripts/install.sh
    vagrant destroy -f 
fi

