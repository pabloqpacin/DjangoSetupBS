# Setup GIT for DJRE

> WORK-IN-PROGRESS

See [README.md](/README.md)

> Info regarding `git clone ...` may be provided in due time

- [Setup GIT for DJRE](#setup-git-for-djre)
  - [git config](#git-config)
  - [init 'main' — `188ee21`](#init-main--188ee21)
    - [create local git repo](#create-local-git-repo)
    - [create remote \& sync with local repo](#create-remote--sync-with-local-repo)
    - [commit and push](#commit-and-push)
  - [merge 'wip-setup' — `e4b6fa2`](#merge-wip-setup--e4b6fa2)
    - [create branch and commit](#create-branch-and-commit)
    - [merge and push!](#merge-and-push)
    - [how to delete branches](#how-to-delete-branches)
  - ['wip-twt' — `∞`](#wip-twt--)


## git config
```bash
# Verify git is installed
git --version

# Set username & email if necessary!
git config --list
git config --global user.name "NAME"
git config --global user.email your@email.here
```

## init 'main' — `188ee21`

> First, run the installation script and protect the **secret key**.

### create local git repo
```bash
# Change to DJRE root directory, set relative path
cd ~/WIP-TWT/DJRE

# Create local git repo in DJRE
git init

# .GITIGNORE SHOULD BE WORKING!

# Rename current branch to 'main'
git branch -m main
```


### create remote & sync with local repo
```bash
# Create remote repo in Github.com/new (add LICENSE)
# Sync remote and local via HTTPS or preferably SSH
git remote add origin git@github.com:[USER]/[REPO].git
# (!)

# Update local repo with remote info
git fetch

# Pull remote files (eg. license, gitignore...)
# (Avoid merge issues with remote commits... rebase, etc.)
git pull origin main
```

### commit and push
```bash
# Verify local repo is good (ie. red but 'main' branch)
git status

# EDIT & SAVE files

# git ADD & COMMIT
git add .

# Verify branch status!!
git status

# First actual DJRE commit...
git commit -m "Run 'setup-DJRE.sh', follow 'setup-modPyGit.md'

- First run 'script' command to make typescript of terminal session ('exit' later).
- Create root-dir, Python-venv, install Django, startproject & startapp.
- Create gitignore, secure SECRET_KEY, create Github remote & local git repo."

# Basic 'git push' didn't work now...
# "The current branch 'main' has no upstream branch.
# To push the current branch and set the remote as upstream, use"
git push --set-upstream origin main
```

---


## merge 'wip-setup' — `e4b6fa2`

<!-- REMEMBER
- mv ~/DJRE-scripts/* ~/WIP-TWT/DJRE/scripts
  - but then... /* -t scripts docs test
  - (!!!)

-->

### create branch and commit
```bash
# Create new 'WIP' branch for further development
git branch -b wip-setup

# EDIT & SAVE files, git ADD

# COMMIT!
git commit -m "Elaborate 'README.md' & prepare 'docs/'

- README: introduction, 'contribute', setup-related checklist, outline current status and TWT TUTORIAL.
- docs/: include 'setup-DJRE.7z' instructions, update documentation especially 'setup-git.md', copypaste 'wip-twt.md' (core of future development) from MEWEBSEY (github.com/pabloqpacin/mewebsey)."
```

### merge and push!
```bash
# # Push NEW branch to Github
# git push -u origin wip-setup

# Eventually, merge 'wip-twt'
git status
git checkout main
git status
git merge wip-setup
git push

# You could also push the new branch to Github with
git push -u origin [branch-name]
```

### how to delete branches
```bash
# # To delete branches in LOCAL and REMOTE
# git branch -d <new-branch>
# git push origin -d <new-branch> # might be '--delete' ...
```


---

## 'wip-twt' — `∞`

> WORK-IN-PROGRESS
>
> Section in **active development**

```bash
# Create new WIP branch
git checkout -b wip-twt

# See commit log
git log --oneline
```

This branch is the only one we should **edit** from now on. We may `merge` it into 'main' if necessary.

All commits are still documented below (may be seen at any time with `git log --oneline`): <!-- HOW ABOUT git log -god ... !! -->

| commit ID | date | -m Title |
| ---       | ---  | --- |
|0dde9c6|2022-12-14|Start-continue TWT-TUTORIAL, from #1 'startapp API' onwards
|60d2d1c|2022-12-15|Create alt dev-server landing page (TWT+API mods), improve 'install_DJRE.sh
|08111b0|2022-12-15|Create /tools/DJRE-setup.7z install-files, improve README.md and /docs
|cc24f49|2022-12-16|Tinker with VIEWS and ROUTES, complete TUTO # Part 1|
|18b3c89|2022-12-16|Create ROOM model in API/models.py, make-migrations; start # Part 2|
|0efde80|2022-12-16|Create API/serializers.py, modify API/views.py and API/urls.py|
|07f32ff|2022-12-16|Create first Room via browser, return Room list (model view); end # Part 2|
||2022-12-17| |
