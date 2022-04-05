#!/bin/sh

# Author: alexghergh

# get os identification
if [ -f /etc/os-release ]; then
    os_id="$(sed '3q;d' /etc/os-release | sed 's/ID=//')"
else
    # if we cannot identify the system, just exit safely
    exit 0
fi

# update and upgrade the system and install ansible and other dependencies

# if we're on arch linux
if [ "$os_id" = 'arch' ]; then
    sudo "$(which pacman)" -Syu git ansible-core --noconfirm
    "$(which ansible-galaxy)" collection install community.general

# if we're on ubuntu
elif [ "$os_id" = 'ubuntu' ]; then
    sudo "$(which apt-get)" update --yes
    sudo "$(which apt-get)" upgrade --yes
    sudo "$(which apt-get)" install python-apt python3-apt git ansible --yes
fi

# force ansible colors even in a script
export ANSIBLE_FORCE_COLOR=1

# pull the ansible repo
"$(which ansible-pull)" --url https://github.com/alexghergh/ansible.git --checkout "v0.2-rc" --directory "$HOME"/ansible
