#!/bin/bash

# - Ensure that `install_requirements.sh` is executable (via `chmod +x`)
# - Install using Python Virtual Environment (`source venv/bin/activate`)

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Loading into Python Virtual Environment (doesn't always work)
. venv/bin/activate

# Performing Linux Update & Upgrade
echo -e "${GREEN}[+] Updating and Upgrading Linux${ENDCOLOR}"
sudo apt update -y
sudo apt upgrade -y

# Installing APT Dependencies
echo -e "${GREEN}[+] Installing APT Dependencies${ENDCOLOR}"
sudo apt install python3 
sudo apt install grip
sudo apt install mysql-server

# Installing Python PIP Requirements
echo -e "${GREEN}[+] Installing Python PIP Requirements${ENDCOLOR}"
pip install -r support/requirements.txt