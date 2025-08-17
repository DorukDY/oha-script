#!/bin/bash

echo "Oha Script getting set..."

sudo cp oha.sh /usr/local/bin/oha
sudo cp info.txt /etc/oha-info.txt

# Script içinde info.txt yolunu güncelle
sudo sed -i 's/info.txt/\/etc\/oha-info.txt/g' /usr/local/bin/oha

echo "Setup is completed now you can use command \"oha\"."
read -p "Now you can delete this folder. Do you want to delete now? [y/n]:" a

condition="true"

while [[ $condition = "true" ]]
do
    if [[ "${a,,}" = "y" ]]
    then 
        SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
        # rm -rf $SCRIPT_DIR
        condition="false"
    elif [[ "${a,,}" = "n" ]]
    then
        echo "Terminating..."
        condition="false"
    else
        continue
    fi
done