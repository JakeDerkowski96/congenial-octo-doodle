#!/bin/bash
# download interesting packages

# example list of packages
# list of packages installed
packages=(twine apt-transport-https dnsmap changeme)

# echo ${packages[*]}


function who_dis {
        if [ "$EUID" -ne 0 ]; then
                echo -e "must be root to install packages"
                exit 1
        else
                clear;
                echo -e "Installing tools that I commonly use"; sleep 1;
        fi
}

# who_dis;

function get_you_some {
        apt install -y $1
}

get_you_some ${packages[*]}
