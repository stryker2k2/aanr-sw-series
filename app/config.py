import os
import json

try:    
    with open('/etc/config.json', 'r') as config_file:
        config = json.load(config_file)
        print('[+] Loading Config File from /etc/config.json')
except:
    with open('./config.json', 'r') as config_file:
        config = json.load(config_file)
        print('[+] Loading Config File from ./config.json')

class Config:
    # SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://db-admin:password@localhost/our_users'
    # SECRET_KEY = '9fa87cf0-62f2-11ee-b650-9dcbc88ae8b7'
    
    SQLALCHEMY_DATABASE_URI = config.get('SQLALCHEMY_DATABASE_URI')
    SECRET_KEY = config.get('SECRET_KEY')
    UPLOAD_FOLDER = config.get('UPLOAD_FOLDER')
    ADMIN_ID = config.get('ADMIN_ID')

###
# $ nano ~/.profile
# 
# # Global Variables
#   export SQLALCHEMY_DATABASE_URI='mysql+pymysql://db-admin:password@localhost/our_users'
#   export SECRET_KEY='9fa87cf0-62f2-11ee-b650-9dcbc88ae8b7'
###