#!/bin/bash

# Push website to Linode Server for hosting
# Ensure that Permissions match (ex: /static/images must be 'chown 666')
# Launch from 'aanr-sw-series' Root Directory

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Linode Server IP
SERVER='66.228.48.250'
APP_FILES='app support logs run.py'
NGINX_FILES='config.json'
# FLASK_ROOT='/root'
FLASK_ROOT='/var/www'

# Ensure Server is Available
echo -e "${GREEN}[+] Ensuring Server is Online${ENDCOLOR}"
ping ${SERVER} -c 1

# Making a Backup of Images Folder
echo -e "${GREEN}[+] Making a Backup of Images Folder${ENDCOLOR}"
scp -rp root@${SERVER}:${FLASK_ROOT}/aanr-sw-series/app/static/images ./app/static/

# Changing Permissions of all Images to Public (chmod 777)
echo -e "${GREEN}[+] Changing Permissions of all Images to Public (chmod 777)${ENDCOLOR}"
chmod -R 777 ./app/static/images/

# Launch Server-side Script to Remove ALL Website Files
echo -e "${GREEN}[+] Launching Server-side Script to Remove ALL Website Files${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/clean_server.sh'

# Copy Local Website Files to Server
echo -e "${GREEN}[+] Copying Local Website Files to Server${ENDCOLOR}"
scp -rp ${APP_FILES} app.wsgi root@${SERVER}:${FLASK_ROOT}/aanr-sw-series/

# # Copying NGINX Flask Config to Server
# echo -e "${GREEN}[+] Copying NGINX Config to Server${ENDCOLOR}"
# scp -rp ${NGINX_FILES} root@${SERVER}:/etc/

# Copy Apache Conf to Server
echo -e "${GREEN}[+] Copying Local Website Files to Server${ENDCOLOR}"
scp -rp flaskapp.conf root@${SERVER}:/etc/apache2/sites-available/

# Restarting Apache Service on Server
echo -e "${GREEN}[+] Restarting Apache Service on Server${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/restart_apache2.sh'