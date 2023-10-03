#!/bin/bash

# Push website to Linode Server for hosting
# Ensure that Permissions match (ex: /static/images must be 'chown 666')

# Linode Server IP
SERVER='66.228.48.250'

# Ensure Server is Available
ping ${SERVER} -c 4

# Launch Server-side Script to Remove ALL Website Files
ssh root@${SERVER} 'bash -c /root/clean_server.sh'

# Copy Local Website Files to Server
scp -rp ../static ../support ../templates ../app.py ../app.wsgi ../flaskapp.conf ../webforms.py root@${SERVER}:/var/www/aanr-sw-series/