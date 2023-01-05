#!/bin/bash



# READ FIRST
# - Run only after following the steps in 'modPyGit.sh'
# - In Github.com/new, include license, ~~gitignore~~
# - Modify remote SSH! --> git remote add origin <...>
# - ... Mind the Github SSH config...


# PRE-STEPS
git --version
# git config --global user.name "NAME"
# git config --global user.email e@ma.il
git config --list




# Go to DJRE directory (set relative path)
cd ~/WIP-TWT/DJRE


# Create local git repo in DJRE root directory
git init

# .GITIGNORE SHOULD BE WORKING!

# Rename current branch to 'main'
git branch -m main


# Open Github.com/new and create new repo (add LICENSE)
# Sync local and remote repo with either HTTPS or SSH
git remote add origin # (!) git@github.com:USER/REPO.git

# Update local repo with remote info
git fetch

# Update local repo with remote files (eg. license, gitignore...)
# (Avoid merge issues with 'Initial commit' Github files... rebase, etc)
git pull origin main



# Verify local repo is good (ie. 'main' branch)
git status


# EDIT & SAVE files, git ADD & COMMIT
git add .
git commit 
git commit -m "DJRE basic setup with script 'install_DJRE.sh'


Create root directory, create Python venv and activate, install Django, startproject & startapp,
create .gitignore, requirements.txt & docs/, deactivate (.venv). 

Now read '~/DJRE-scripts/readme.txt' to setup git repo!!
"

<<later

# Push 'main' branch commits!
git push



# Create new 'WIP' branch for further development
git branch -b wip-twt


# EDIT & SAVE files, git ADD & COMMIT

# Push NEW branch to Github
git push -u origin wip-twt


# Eventually, merge 'wip-twt'
git status
git checkout main
git status
git merge wip-twt
git push

# To delete branches in LOCAL and REMOTE
git branch -d <new-branch>
git push origin -d <new-branch>         # might have to be '--delete'


later