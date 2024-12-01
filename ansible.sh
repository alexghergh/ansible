#!/bin/sh

# get os identification
if [ -f /etc/os-release ]; then
    os_id="$(sed -n '/^ID=.*$/p' /etc/os-release | sed 's/ID=//')"
else
    # if we cannot identify the system, just exit safely
    print "Couldn't identify system, exiting..."
    exit 0
fi

os_detected='0'

# update and upgrade the system and install ansible and other dependencies

# arch linux
if [ "$os_id" = 'arch' ]; then
    sudo "$(which pacman)" -Syu python-pip git ansible-core --noconfirm
    "$(which ansible-galaxy)" collection install community.general

    os_detected='1'

# ubuntu
elif [ "$os_id" = 'ubuntu' ]; then
    sudo "$(which apt-get)" update --yes
    sudo "$(which apt-get)" upgrade --yes
    sudo "$(which apt-get)" install python3-apt git ansible --yes

    os_detected='1'

# fedora asahi linux
elif [ "$os_id" = 'fedora-asahi-remix' ]; then
    sudo "$(which dnf)" upgrade --assumeyes
    sudo "$(which dnf)" install --assumeyes python3-pip git ansible ansible-collection-community-general

    os_detected='1'
fi

# if a supported operating system wasn't detected
if [ "$os_detected" = '0' ]; then
    print "Could not detect a supported os, exiting..."
    exit 0
fi

# force ansible colors even in a script
export ANSIBLE_FORCE_COLOR=1

# pull the ansible repo
mkdir "$HOME"/projects/
"$(which ansible-pull)" --url https://github.com/alexghergh/ansible.git --checkout "main" --directory "$HOME"/projects/ansible
