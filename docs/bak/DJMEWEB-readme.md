# MEWEB

> WORK-IN-PROGRESS

This repo documents how to build a website with **Django** in 2023.


```markdown
# CONTRIBUTE
$ work LINUX
$ code PYTHON && $more
$ command GIT
$ speak ENGLISH || SPANISH
$ learn DJANGO && WEB DEVELOPMENT
$ ready DOCUMENTATION
$ setup ENVIRONMENT
$ develop WEB APPS
$ implement FRONTEND
$ manage BACKEND
$ handle DEVOPS
$ admin SERVER
$ strengthen SECURITY

more='JavaScript HTML Shell'
```

*Table of Contents*

<!-- 
<details>
<summary>Table of Contents</summary> -->

- [MEWEB](#meweb)
  - [Documentation](#documentation)
  - [Getting started!](#getting-started)
    - [System Environment](#system-environment)
    - [Python Environment - `pip` and `venv`](#python-environment---pip-and-venv)
  - [Django Project Creation — The Basics](#django-project-creation--the-basics)
    - [1. Install **Django** within `(.venv)`](#1-install-django-within-venv)
    - [2. Create **Django** project and test server](#2-create-django-project-and-test-server)
    - [3. Securely **Git** the **Django** project](#3-securely-git-the-django-project)
      - [3.1 Prepare a `.gitignore` file](#31-prepare-a-gitignore-file)
      - [3.2 Secure the **secret key** with `dotenv`](#32-secure-the-secret-key-with-dotenv)
      - [3.3. Declare installed **pip packages**](#33-declare-installed-pip-packages)
      - [3.4 **Git** setup to `push` to **Github**](#34-git-setup-to-push-to-github)
  - [Django Web-App Creation — "Hello, Django!"](#django-web-app-creation--hello-django)
    - [Working with Git branches](#working-with-git-branches)
    - [Create a **Django** web app](#create-a-django-web-app)
      - [1. Run the `startapp` utility](#1-run-the-startapp-utility)
      - [2. Customize the home page in `<app>/views.py`](#2-customize-the-home-page-in-appviewspy)
      - [3. Create `<app>/urls.py` to set routes](#3-create-appurlspy-to-set-routes)
      - [4. Modify `<project>/urls.py` to render our web app](#4-modify-projecturlspy-to-render-our-web-app)
      - [5. Test *"Hello, Django!"* running the server!](#5-test-hello-django-running-the-server)
  - [Django \& React Tutorial — Full Stack Web App With Python \& JavaScript](#django--react-tutorial--full-stack-web-app-with-python--javascript)

<!-- 
</details> -->


## Documentation
- @MicrosoftDocs: [Get started using Python for web development on Windows](https://learn.microsoft.com/en-us/windows/python/web-frameworks) — setup WSL2, VS Code, Python (`pip` and `venv`) — web-app **Hello, Django!** tutorial
- @PipDocs: [`pip` User Guide](https://pip.pypa.io/en/stable/) — in-depth docs.
- @PythonDocs: [using `venv` Virtual Environments to manage `pip` Packages](https://docs.python.org/3/tutorial/venv.html) — in-depth docs. — cheatsheet
- **@DjangoDocs: [`django-admin` and `manage.py`](https://docs.djangoproject.com/en/4.1/ref/django-admin/)** — in-depth documentation
- **@DjangoDocs: [Django `settings.py`](https://docs.djangoproject.com/en/4.1/ref/settings/#secret-key)** — in-depth documentation — `SECRET_KEY` and more
- @builtWithDjango.com: [How to Version Control your Django project](https://builtwithdjango.com/blog/django-version-control) — relevant `.gitignore`
- @Medium.com: [How to protect your Django project’s secret key and OAuth key](https://medium.com/@akashcsemu/how-to-protect-your-django-projects-secret-key-and-oauth-key-1976f809447e) with `dotenv`
- @GithubDocs: [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) — important system config


## Getting started!

In this section we are seting up:
- **System Environment:** that is the WSL 2, an Ubuntu VM, the VS Code editor and Oh-My-Zsh
- **Python Environment**: making sure Python, `pip` and `venv` are installed in our Ubuntu system

### System Environment

For this **Python** and **Django** web-dev project, we are set to follow all relevant *good practices*.

Before diving into the code, let's go through our system configuration following the [documentation](#documentation) above (complete guide in [TOOLKIT.md](/docs/TOOLKIT.md))
1. Enable **WSL2**
   - These steps should work for both **Windows10** and **Windows11** systems
   - Recommended **Windows Subsystem for Linux** setup (inspired by [@Wolfang'sChannel](https://youtu.be/5Tls2LRKh-c&t=338s)):
     1. Open `Windows Features`, activate:
        - `Virtual Machine Platform`
        - `Windows Subsystem for Linux`
      2. `Restart` Windows
      3. Open **PowerShell** and enter...
         - `wsl --set-default-version 2`
      4. Update Linux kernel:
         - Visit [WSL docs. website](https://learn.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package),
         - download the latest...
         - `WSL2 Linux kernel update package for x64 machines`
         - and execute it!

2. Run **Ubuntu**
   - With WSL2 enabled, download **Ubuntu 22.04** (or else) from the **Microsoft Store**
   - Install it, set username and password, `sudo apt update` and `sudo apt upgrade -y`
   - Notice how **Python** comes pre-installed with Ubuntu!

3. Install **VS Code**
   - `Download for Windows` from [**VS Code**'s website](https://code.visualstudio.com/) 
   - Install the [**WSL-Remote**](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension and recommended [**Python**](https://marketplace.visualstudio.com/items?itemName=ms-python.python) extensions <!--(SHARE me fave extensions...)-->

4. *EXTRA TOOLS*
   - While not mandatory for our **Django** project, we deem these tools important:
     1. **Windows Terminal**
        - Powerful terminal emulator for all *CMD*, *PowerShell*, *Bash*...
        - Download it from the **Microsoft Store** (tweaks in [TOOLKIT.md](/docs/TOOLKIT.md))
     2.  **Oh-My-Zsh**
         - Exciting *Z-shell* framework
         - Follow the official [documentation](https://github.com/ohmyzsh/ohmyzsh)
     3.  **Git**
         -  Extremely important!!
         -  Version-control and cloud-sync with **Github**
         -  Likely pre-installed in **Ubuntu**!
         -  See [documentation](#documentation) above for tricky SSH config


> I may add SSH-config details to [TOOLKIT.md](/docs/TOOLKIT.md) in due time 


### Python Environment - `pip` and `venv`

Bear in mind we are running **Python for Linux**, meaning that all *shell commands* below will be different on **Windows**.

As mentioned above, Ubuntu usually comes with **Python** pre-installed. However that's not the case for neither the `pip` package manager, the `venv` module or **Django** itself. Please read now the [documentation](#documentation) above.

Open your *tweaked* **Terminal** application, which by default should be booting up **Ubuntu**.

```bash
# Verify your shell (eg. /bin/bash, /usr/bin/zsh...)
which $SHELL || echo $SHELL

# Verify the system is up to date
sudo apt update
sudo apt upgrade -y
```

Now let's make sure **Python**, `pip` and `venv` are installed globally.

Note how commands like `python3 -m pip list` may be shortened to `pip list`.

```bash
# Verify Python is installed (eg. Python 3.10.6)
python3 --version

# Install pip if not yet installed
sudo apt install python3-pip

# Install the venv module
sudo apt install python3-venv

## See pip packages installed globally
pip list || python3 -m pip list
```

Running `pip list` should return a list of around 80 **Python** packages installed globally (eg. `keyring`, `oauthlib`, `pyOpenSSL`...).
<!-- *I AIN'T 100% SURE THEY COME WITH `PIP INSTALL`-- THEY MIGHT BE COMING FROM SOMEWHERE ELSE ||||||||| maybe from Ubuntu itself (as Python does)?? * -->

## Django Project Creation — The Basics

In this section we may:
1. **Install Django in a Python virtual environment**
   - create env. with `python3 -m venv .venv`
   - activate with `source .venv/bin/activate`
   - download Django with `pip install Django`
2. **Create Django project and test server**
   - `django-admin startproject NAME .` should generate some core files
   - `python3 manage.py runserver` to verify development server status
3. **Securely Git the Django project**
   - Prepare `.gitignore` file
   - Protect the **secret key**
     - within `(.venv)`, `pip install python-dotenv`
     - edit `settings.py`
   - `pip freeze > requirements.txt` to declare `(.venv)` pip packages
4. **Complete Git setup to `push` to Github**
   - `git remote add origin <git@github>`
   - rename branch, `fetch` & `pull origin main`
   - edit & save, `git add` & `commit`
   - `git push -u origin main` 


### 1. Install **Django** within `(.venv)`

Now Python, `pip` and `venv` are installed in our Ubuntu system, we are ready to rock. Terminal time:

```bash
# Create a root directory for the project
mkdir ~/DJ

# Open VSCode (use its integrated terminal)
code DJ

# Verify current working directory
cd ~/DJ

# Create a dedicated virtual environment named ".venv"
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Exit (.venv) at any time
deactivate

# See current pip packages
pip list

# Install Django within (.venv)
pip install django

# Verify!
pip list

# See package details
pip show django
```

Next to your user prompt in the terminal, `(.venv)` should be on display, meaning that we are operating in an isolated Python environment. As such, `pip list` should only return a handful of packages. 


### 2. Create **Django** project and test server

With **Django** installed in a designated `(.venv)` virtual environment, we can start using it!. See the [documentation](#documentation) above for detailed information.


```bash
# Create a Django project called MEWEB
django-admin startproject MEWEB .
# Mind the dot to avoid nested MEWEB directories 

# Verify Django's development server is working
python3 manage.py runserver

# Specify server port (default is 8000)
python3 manage.py runserver 5000

# READ TERMINAL OUTPUT!

# Visit default website (http://127.0.0.1:5000)
Ctrl+click

# Stop the server at any time
Ctrl+C
```

Upon running these commands and visiting the website, the terminal may log some relevant data, and new files are created in our root directory. Besides, create a `README.md` file for documentation.

```markdown
# DJ
.
├── .venv
│   └── ...
├── db.sqlite3
├── manage.py
├── README.md                   <!--optional-->
└── MEWEB
    ├── __pycache__
    │   ├── __init__.cpython-310.pyc
    │   ├── settings.cpython-310.pyc
    │   ├── urls.cpython-310.pyc
    │   └── wsgi.cpython-310.pyc
    ├── __init__.py
    ├── asgi.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```



### 3. Securely **Git** the **Django** project
Everything works fine but before moving on with **Django**, let' set up **Git** for version-control and cloud sync with **Github** maintaining a public repository.

To summarize the [documentation](#documentation) above, login to **Github** and `Create repository` (add `License`), then run `git init` in the root directory (`~/DJ`) and do the following (DON'T `git commit` YET!):
1. prepare `.gitignore` file
2. install `dotenv` to secure the **secret key**
3. declare `(.venv)` **pip packages**
4. complete **Git** setup to `push` to **Github**


#### 3.1 Prepare a `.gitignore` file

Create a `.gitignore` file in the root directory (`~/DJ`) and copypaste to it the content of this [gist](https://gist.github.com/rasulkireev/1412ab0c3585ab8ffa50764e68f2d6d7). This is basically Github's `.gitignore` template for Python, but including the following code:

```bash
# DB
back-dbs/
media/
*.sqlite3

# Javascript
node_modules/
bundles/

# Other
.DS_Store
```

Instead of manually creating the `.gitignore`, you could also add a template when creating the Github repo and `pull` it later.


#### 3.2 Secure the **secret key** with `dotenv`

1. Install package with `pip` within `(.venv)` 

```bash
# Verify your directory and Python virtual env.
cd ~/DJ && source .venv/bin/activate

# Install python-dotenv
pip install python-dotenv

# Verify!
pip list
```

2. Create `.env` file in root directory (`~/DJ`)

3. In `settings.py` where the **secret key** is: 
   - paste the Python code below up on top to import `os` and `dotenv` modules
   - copypaste secret key unto the `.env` file —remove all spaces and quotation marks—
   - replace secret key string in `settings.py` with the code below

4. Run the server (`python3 manage.py runserver`) to verify Django still works!

```python
# Added to protect the SECRET_KEY
import os
from dotenv import load_dotenv
load_dotenv()
```

```python
# SECURITY WARNING: ...
SECRET_KEY = str(os.getenv('SECRET_KEY'))
```



#### 3.3. Declare installed **pip packages**

As all **Python** pip packages installed in `(.venv)` will remain isolated, create a `requirements.txt` file with `pip freeze` to account for them:

```bash
# Verify your directory and Python virtual env.
cd ~/DJ && source .venv/bin/activate

# See current pip packages
pip list

# "Freeze" list and save it as a TXT file
pip freeze > requirements.txt
cat requirements.txt

# To install these packages in any new (.venv)...
python -m pip install -r requirements.txt
```

> <!--(MIRAR BIEN LA MOVIDITA DE `GIT CLONE` Y TAL)-->


#### 3.4 **Git** setup to `push` to **Github**

Our root directory finally contains the core files necessary for **Django** development:

```markdown
# DJ
.
├── .venv
│   └── ...
├── .env
├── .gitignore          <!--optional-->
├── db.sqlite3
├── manage.py
├── README.md           <!--optional-->
├── requirements.txt
└── MEWEB
    └── ...
```

To close this chapter, manage the **Git** repo as usual to eventually `push` our files to the Internet.

If SSH-auth-related problems arise, see the relevant [documentation](#documentation) above and use **VS Code**'s "Source Control" extension if you only fail to `push`.

```bash
# First, rename the current branch to main
git branch -m main

# Open Github and find the SSH code provided,
# now sync local with remote files via terminal
git remote add origin git@github.com:pabloqpacin/MEWEBSEY.git

# Update the local repo
git fetch

# Pull remote license and .gitignore if present,
# to avoid merge issues due to 'Initial commit'
git pull origin main
```

```bash
# Save all edits to all root directory files
Ctrl+S

# Add local files to Git version-control 
git add .

# Verify everything is green
git status

# Create snapshop of the project files
git commit -m "feat: DJ is begun"

# Push local branch to remote for the first time
git push -u origin main

# Next time same branch
git push
```


We have successfully:
- engineered our development environment
- created a functional **Django** project
- stocked our work in a Github repo (either public or private)

Now, `deactivate` our working `(.venv)` and take a break dawg!

<!--
TACKLE
- git clone
- (git fetch)
- ...
- git stash
- git squash
- lo importante es poder hacer commits si quiero y luego como transformar tipo 10 o 20 en 1 (por lo menos de cara al historial, pa no saturar)

-->


## Django Web-App Creation — "Hello, Django!" 

In this section we may:
- manage different **Git** branches
- create a *"Hello, Django!"* web-app
  1. run `startapp HDJ`
  2. modify `HDJ/views.py`
  3. create `HDJ/urls.py`
  4. modify former `MEWEB/urls.py`
  5. test web app in development server


### Working with Git branches
Same repo, same files, new features... new branch!

First off, create and switch to a new **Git** branch to develop a *Hello World* **Django** web-app, that is, *"Hello, Django!"*.

```bash
# Create & switch to new branch
git checkout -b wip-helloDjango

# Verify Git is good
git branch -a
git status

# Once 'Hello, Django!' is running fine,
# save all edits, add and commit as usual,
# then push new-branch to remote repo
git push -u origin wip-helloDjango

# To later merge new branch into main
git checkout main
git merge wip-helloDjango
git push
```

<!--
PERFECT OPPORTUNITY
- `git stash`
- `git squash`
-->



### Create a **Django** web app

Now that we have a designated **Git** branch (`wip-helloDjango`) to develop new features, let's create our first web app.


#### 1. Run the `startapp` utility

First off, create a **Django** web-app from the terminal:

```bash
# Verify root directory, git branch and (.venv)!
cd ~/DJ && git status
source .venv/bin/activate

# Run 'startapp' and choose a name
python3 manage.py startapp HDJ
```

A new directory `HDJ` should have been created in the root directory. Please see the [documentation](#documentation) above to learn more about these files:

```markdown
# DJ
.
├── (...)
└── HDJ
    ├── migrations
    │   └── __init__.py
    ├── __init__.py
    ├── admin.py
    ├── apps.py
    ├── models.py
    ├── tests.py
    └── views.py
```

#### 2. Customize the home page in `<app>/views.py`

Modify `DJ/HDJ/views.py` to match the following code, which creates a single view for the app's home page:

```python
from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello, Django!")
```

At this point, **Pylance** (!) returns a `problem`:

> Import "django.http" could not be resolved from source — Pylance(reportMissingModuleSource)


#### 3. Create `<app>/urls.py` to set routes

Create a file, `DJ/HDJ/urls.py`, with the contents below. The `urls.py` file is where we specify patterns to route different **URLs** to their appropriate **views**. The code below contains one route to map the root URL of the app (`""`) to the `views.home` function we just added to `DJH/views.py`:

```python
from django.urls import path
from HDJ import views

urlpatterns = [
    path("", views.home, name="home"),
]
```

Yet again, **Pylance** returns a `problem`:

> Import "django.urls" could not be resolved from source — Pylance(reportMissingModuleSource)


#### 4. Modify `<project>/urls.py` to render our web app

The `MEWEB` directory also contains a `urls.py` file, which is where URL routing is actually handled.

Open `MEWEB/urls.py` and modify it to match the following code, which pulls in the app's `HDJ/urls.py` using `django.urls.include`, which keeps the app's routes contained within the app.

```python
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("", include("HDJ.urls")),
]
```

It is advised to **comment** (`Ctrl+ç` for our keyboard layout) "unnecessary" default code rather than deleting it, as it might be relevant later on.

This time we have 3 Python `problems`:

> Import "django.contrib" could not be resolved from source — Pylance(reportMissingModuleSource)
>
> Import "django.contrib.admin" could not ...
>
> Import "django.urls" could not ...

#### 5. Test *"Hello, Django!"* running the server!

With all the necessary code changes performed, let's test our web app running the development server. For now, we're leaving the mentioned **Python** `problems` aside.


```bash
# Save all modified files
Ctrl+S

# Run the development server
python3 manage.py runserver
```

With the server running, open a browser to http://127.0.0.1:8000/ to see a page that renders *"Hello, Django!"*.

Everything works, meaning we are ready to go much further. We are about to start developing actual web apps.

But first, complete the steps outlined [above](#working-with-git-branches) to successfully merge this **Git** branch into `main`.


## Django & React Tutorial — Full Stack Web App With Python & JavaScript

> WORK-IN-PROJECT

Next up, we are following *@TechWithTim*'s [Django & React Tutorial](https://www.youtube.com/watch?v=JD-age0BPVo&list=PLzMcBGfZo4-kCLWnGmK0jUBmGLaJxvi4j&ab_channel=TechWithTim). 

New features are to be developed and much documentation needs to be written. As a result, any `README.md` already in use might become as unstable as the [MEWEBSEY](https://github.com/pabloqpacin/MEWEBSEY) repo as a whole.

Shortly after starting [twt-notes.md](/docs/twt-notes.md) documentation, felt overwhelmed and decided to move all **CURRENT DEVELOPMENT** to a different [DJRE](...) repository, providing a fresh dev environment.

Notice the structure of the **Django+React** tutorial down below:


<!-- The tutorial we are following was made with love by *@TechWithTim*, is a few hours long and should follow the structure below: -->


```markdown
# Django & React Tutorial!
Introduction
Part 01 - Full Stack Web App With Python & JavaScript
Part 02 - Django REST Framework
Part 03 - React Integration Using Webpack & Babel
Part 04 - React Router and Building Components
Part 05 - Handling POST Requests (Django REST)
Part 06 - Material UI Components
Part 07 - Calling API Endpoints From React
Part 08 - Creating The Room Join Page
Part 09 - ComponentDidMount and Django Sessios
Part 10 - Django Sessions and Leaving Rooms
Part 11 - Updating Django Models
Part 12 - React Default Props and Callbacks
Part 13 - Spotify API Tutorial (Auth & Tokens)
Part 14 - Using the Spotify API
Part 15 - Pausing & Playing Music With Spotify
Part 16 - Skipping Songs and Handling Votes
Part 17 - Functional Components (useState, useEffect)
```



<!-- - explain VM `POP-DJRE`
- explain repo `DJRE`
  - hosting `wip-twt`
  - in brand-new **environment** -->