# @blyndusk's dotfiles

![language](https://img.shields.io/github/languages/top/blyndusk/dotfiles)
![license](https://img.shields.io/github/v/release/blyndusk/dotfiles)
![license](https://img.shields.io/github/license/blyndusk/dotfiles)
![banner](assets/banner.jpg)

## I - Install

```bash
git clone https://github.com/blyndusk/dotfiles.git
chmod +x woo.sh
```

![woosh](assets/woosh.jpg)

## II - Use

```bash
bash woo.sh
```

![woosh](assets/woosh.gif)

- 1 - Do everything in the list below
- 2 - Install `apt packages` like `curl`, `git`, `htop`, etc
- 3 - Copy dotfiles like `.aliases`, `.functions`, etc
- 0 - Exit script

## III - Test

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

## III - License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.
