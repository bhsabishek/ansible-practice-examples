#!/bin/bash

# Function to check if ansible is installed
check_ansible() {
    if command -v ansible >/dev/null 2>&1; then
        echo "Ansible is already installed."
        exit 0
    else
        echo "Ansible is not installed. Installing now..."
        install_ansible
    fi
}

# Function to install ansible based on OS
install_ansible() {
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y ansible
    elif [ -f /etc/redhat-release ]; then
        sudo yum install -y epel-release && sudo yum install -y ansible
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Sy --noconfirm ansible
    elif [ -f /etc/alpine-release ]; then
        sudo apk add --no-cache ansible
    else
        echo "Unsupported OS. Please install Ansible manually."
        exit 1
    fi
    echo "Ansible installation completed."
}

# Run the check
check_ansible

