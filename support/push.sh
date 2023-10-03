#!/bin/bash

# Push website to Linode Server for hosting
# Ensure that Permissions match (ex: /static/images must be 'chown 666')
# Launch from 'aanr-sw-series' Root Directory

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

# Linode Server IP
SERVER='66.228.48.250'

# Ensure Server is Available
echo -e "${GREEN}[+] Ensuring Server is Online${ENDCOLOR}"
ping ${SERVER} -c 1

# Making a Backup of Images Folder
echo -e "${GREEN}[+] Making a Backup of Images Folder${ENDCOLOR}"
scp -rp root@${SERVER}:/var/www/aanr-sw-series/static/images ./static/

# Launch Server-side Script to Remove ALL Website Files
echo -e "${GREEN}[+] Launching Server-side Script to Remove ALL Website Files${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/clean_server.sh'

# Copy Local Website Files to Server
echo -e "${GREEN}[+] Copying Local Website Files to Server${ENDCOLOR}"
scp -rp static support templates app.py app.wsgi flaskapp.conf webforms.py root@${SERVER}:/var/www/aanr-sw-series/

# Send the Command to Restart the Server
echo -e "${GREEN}[+] Sending the Command to Restart the Server${ENDCOLOR}"
ssh root@${SERVER} 'bash -c /root/restart_apache2.sh'