#!/bin/bash

RED='\033[0;31m'
BLUE='\033[40;38;5;82m'
PURPLE='\033[0;35m'

function createfile() {
FILE=./scripts/install.sh.bak
if [ ! -f "$FILE" ]; then
     cp -r scripts/install.sh scripts/install.sh.bak
   
fi
}
createfile

#Menu options
options[0]="Docker"
options[1]="Kubernetes(Kops)"
options[2]="Ansible"
options[3]="Packer"
options[4]="Terraform"
options[5]="Terraform"
options[6]="Terraform"
options[7]="Terraform"
options[8]="Terraform"
options[9]="Terraform"
options[10]="Terraform"
options[11]="Terraform"

#Actions to take based on selection
function ACTIONS {
    if [[ ${choices[0]} ]]; then
        #Option 1 selected
        echo "Option 1 selected which is Docker"
        echo 'runDocker' >> scripts/install.sh

    fi
    if [[ ${choices[1]} ]]; then
        #Option 2 selected
        echo "Option 2 selected which is Kubernetes(Kops)"
        echo 'runKops' >> scripts/install.sh
    fi
    if [[ ${choices[2]} ]]; then
        #Option 3 selected
        echo "Option 3 selected which is Ansible"
         echo 'runAnsible' >> scripts/install.sh
        
    fi
    if [[ ${choices[3]} ]]; then
        #Option 4 selected
        echo "Option 4 selected which Packer"
          echo 'runPacker' >> scripts/install.sh

    fi
    if [[ ${choices[4]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[5]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[6]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[7]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[8]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[9]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[10]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    if [[ ${choices[11]} ]]; then
        #Option 5 selected
        echo "Option 5 selected which Terraform"
          echo 'runTerraform' >> scripts/install.sh
    fi
    
}

#Variables
ERROR=" "

# #Clear screen for menu
# clear

#Menu function
function MENU {
    echo "Menu Options"
    for NUM in ${!options[@]}; do
        echo "[""${choices[NUM]:- }""]" $(( NUM+1 ))") ${options[NUM]}"
    done
    echo "$ERROR"
}

#Menu loop
while MENU && read -e -p "Select the desired options using their number (again to uncheck, ENTER when done): " -n1 SELECTION && [[ -n "$SELECTION" ]]; do
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
echo -e " ${BLUE} Please wait while we install you DevOps-Pack \e[0m"
sleep 2
vagrant up 
rm scripts/install.sh
mv scripts/install.sh.bak scripts/install.sh
echo Done.
sleep 1
echo -e " ${PURPLE} Enter 'vagrant ssh' to login into your devops-pack"
echo -e " ${PURPLE} Enter 'vagrant destroy -f ' to delete into your devops-pack"
echo -e " ${PURPLE} Tweet me @_nerdeveloper."
