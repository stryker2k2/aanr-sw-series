# AANR-SW-SERIES
A website for the AANR-SW 5K Racing Series

### APT Dependencies
- (apt) python3 
- (apt) python3.10-venv
- see ./support/install_requirements.sh

### PIP Dependencies
- see ./support/requirements.txt

### Setup
- apt install python3.10-venv
- python3 -m venv venv
- source venv/bin/activate
- ./support/install_requirements.txt
- *setup Database with 'support/notes/database.md'*
- make run

### Daily Use
- make run

### Other Commands
- flask shell
- grip (view README.md locally)

### TODO
- Password Reset Request via Email
    - https://youtu.be/vutyTx7IaAI
- Flask Sessions
    - testdriven.io/blog/flask-sessions