#!/bin/bash

# install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# update the package database with the Docker packages from the newly added repo
sudo apt update

# make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# install Docker
sudo apt install docker-ce

# check that docker process is running
sudo systemctl status docker

# -----

# add your username to the docker group
sudo usermod -aG docker "${USER}"

# log out of the server and back in
su - "${USER}"

# confirm that your user is now added to the docker group
id -nG

# test docker command
docker
docker info
docker run hello-world

# -----

# download the 1.26.0 release and save the executable file at /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# set the correct permissions so that the docker-compose command is executable
sudo chmod +x /usr/local/bin/docker-compose

# test docker-compose
docker-compose --version