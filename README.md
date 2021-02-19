# Woosh

![language](https://img.shields.io/github/languages/top/blyndusk/dotfiles)
![license](https://img.shields.io/github/v/release/blyndusk/dotfiles)
![license](https://img.shields.io/github/license/blyndusk/dotfiles)
![banner](assets/banner.jpg)

## I - Goal

**Woosh** is my personnal *Ubuntu configuraion setup assistant*.

It will be charged for me, after the installation of a fresh Ubuntu operating system, to:
- update my **apt packages** and **install new ones** (*git, htop, tmux, etc...*)
- install my **development snap applications** (*vscode, postman, arduino, etc...*), **chat applications** (*telegram, discord, slack, etc...*) and **others**
- install my **bash aliases and functions**
- *other things under construction*

## II - Install

To install **Woosh** and run it on your machine, you just have to clone the repository, make `woo.sh` executable and then run it using bash.

```bash
git clone https://github.com/blyndusk/woosh.git ~/.woosh
cd ~/.woosh
chmod +x woo.sh
bash woo.sh
```

![woosh](assets/woosh.jpg)

## II - Use

A **prompt will be displayed**, and depending on the *number* you enter, an **action will be performed**.

## III - Test

You can test some **Woosh**'s features in a *remote Ubuntu machine*, to avoid overwriting your local configuration**, by using Docker.

```bash
docker build -t woosh . ; docker run --rm -it woosh
```

## Bonus

Create an SSH key for your GitHub account example

```bash
# generate new key
ssh-keygen -t rsa -b 4096 -C "alexandre.delaloy.pro@gmail.com"
# path to create your key: service_os_computerbrand. e.g. github_ubuntu_dell
/home/alexandre/.ssh/gitlab_ubuntu_dell
# test agent
eval "$(ssh-agent -s)"
# add key to agent
ssh-add /home/you/.ssh/service_os_computerbrand
# copy public key in clipboard
xclip -sel clip < /home/you/.ssh/service_os_computerbrand.pub 
# paste content in "Settings > SSH & GPG keys > Create new key"
ssh -T git@github.com | ssh -T git@gitlab.com
...
# Then when you clone a new repo:
git clone git@github.com:user/repo.git
# add your local git user config
git config user.email "alexandre.delaloy.pro@gmail.com" ; git config user.name "blyndusk"

```

## IV - License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.
