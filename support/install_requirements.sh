#!/bin/bash

# - Ensure that `install_requirements.sh` is executable (via `chmod +x`)
# - Install using Python Virtual Environment (`source venv/bin/activate`)

# Loading into Python Virtual Environment (doesn't always work)
. venv/bin/activate

# Performing Linux Update & Upgrade
sudo apt update -y
sudo apt upgrade -y

# Installing APT Dependencies
sudo apt install python3 
sudo apt install grip
sudo apt install mysql-server

# Installing Python PIP Requirements
pip install -r support/requirements.txt