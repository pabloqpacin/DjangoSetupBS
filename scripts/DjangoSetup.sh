#!/bin/bash


# OBSERVING GOOD PRACTICES
# https://learn.microsoft.com/en-us/windows/python/web-frameworks



# Make typescript of terminal session (remember to input 'exit' later to end typescript) 
read -p "We recommend running 'script ~/DjangoSetup' before running this installer. Continue? [Y/n]? "
if [[ $REPLY == 'n' ]];
    then exit
    else echo -e "Proceeding...\n (Run 'exit' later if necessary to end 'script ~/DjangoSetup')\n"
fi


## PART-1

# Verify Python is installed, install pip & venv; see current GLOBAL Python packages
python3 --version
sudo apt install python3-pip python3-venv
pip list

# Create and change to new project root directory
mkdir -p ~/PQP/OhMyDjango && cd "$_" && pwd

# Create and activate Python virtual environment; see current (.venv) Python packages
python3 -m venv .venv
source .venv/bin/activate
pip list


## PART-2

# Install Django, DRF & dotenv within (.venv); save project packages
pip install django djangorestframework python-dotenv
pip list && pip freeze > requirements.txt

# Create Django project & first webapp (CHANGE THE NAMES!)
django-admin startproject web_project .
    # Mind the "." to avoid nested directories
django-admin startapp first_webapp || python3 manage.py startapp first_webapp




## PART-3

# Create relevant directories (where the .7z package contents might go!) and .env to later protect the SECRET_KEY
mkdir docs pkg scripts
touch .env

# Create README.md
now=$(date) && echo -e "# Django Setup\n\n$now\n\nWow, such empty..." > README.md

# Create .gitignore
echo "# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Javascript / React
node_modules/
bundles/


# CUSTOM
test/
bk/
" > .gitignore

# Last words
echo -e "$USER, follow the 'instructions.md' file and, if necessary,\nrun 'exit' to end the typescript and 'deactivate' (.venv)"
