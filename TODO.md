# TODO

## APT

- [ ] INSTALL CURL
- [ ] INSTALL HTOP
- [ ] INSTALL GIT
- [ ] INSTALL 

## ZSH

- [ ] INSTALL ZSH
- [ ] INSTALL OH-MY-WSH
- [ ] INSTALL ZSH-SYNTAX-HIGHLIGHTINH 
- [ ] INSTALL ZSH-AUTOSUGGESTIONS 
- [ ] INSTALL SPACESHIP-PROMPT


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