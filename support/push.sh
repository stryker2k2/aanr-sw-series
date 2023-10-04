#!/bin/bash

# Push website to Linode Server for hosting
# Ensure that Permissions match (ex: /static/images must be 'chown 666')
# Launch from 'aanr-sw-series' Root Directory

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Linode Server IP
SERVER='66.228.48.250'
APP_FILES='static support templates app.py webforms.py'
APACHE_FILES='app.wsgi'

# Ensure Server is Available
echo -e "${GREEN}[+] Ensuring Server is Online${ENDCOLOR}"
ping ${SERVER} -c 1

# Making a Backup of Images Folder
echo -e "${GREEN}[+] Making a Backup of Images Folder${ENDCOLOR}"
scp -rp root@${SERVER}:var/www/aanr-sw-series/static/images ./static/

# Launch Server-side Script to Remove ALL Website Files
echo -e "${GREEN}[+] Launching Server-side Script to Remove ALL Website Files${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/clean_server.sh'

# Copy Local Website Files to Server
echo -e "${GREEN}[+] Copying Local Website Files to Server${ENDCOLOR}"
scp -rp ${APP_FILES} ${APACHE_FILES} root@${SERVER}:/var/www/aanr-sw-series/

# Copy Apache Conf to Server
echo -e "${GREEN}[+] Copying Local Website Files to Server${ENDCOLOR}"
scp -rp flaskapp.conf root@${SERVER}:/etc/apache2/sites-available/

# Restarting Apache Service on Server
echo -e "${GREEN}[+] LRestarting Apache Service on Server${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/restart_apache2.sh'