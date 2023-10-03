# AANR-SW-SERIES
A website for the AANR-SW 5K Racing Series

### APT Dependencies
- (apt) python3 
- (apt) grip
- (apt) mysql-server

### PIP Dependencies
- (pip) flask
- (pip) flask-wtf
- (pip) flask-sqlalchemy
- (pip) mysql-connector-python
- (pip) pymysql
- (pip) cryptography
- (pip) Flask-Migrate
- (pip) flask_login
- (pip) flask-ckeditor

### Old Setup
- python3 -m venv venv
- source venv/bin/activate
- deactivate (optional)
- pip install <dependencies>
- pip freeze (to view install python modules)
- export FLASK_DEBUG=True
- export FLASK_APP=hello.py
- *setup Database with 'notes/database.md'*
- flask run

### New Setup
- apt install python3.10-venv
- python3 -m venv venv
- source venv/bin/activate
- ./support/install_requirements.txt
- *setup Database with 'support/notes/database.md'*
- make run

### Old Daily Use
- source venv/bin/activate
- flask run --debug

### New Daily Use
- make run

### Other Commands
- echo $FLASK_ENV
- unset FLASK_ENV
- flask shell
- grip (view README.md locally)

### TODO
- Deploy to Production
    - https://flask.palletsprojects.com/en/2.3.x/tutorial/deploy/
- Deploy to Heroku
    - https://youtu.be/SiCAIRc0pEI