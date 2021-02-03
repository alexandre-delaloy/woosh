#!/bin/bash

source bin/utils.sh

which "sudo" > /dev/null 2>&1
if [[ "$?" = 0 ]] ; then
  ISUDO="sudo"
else
  ISUDO=""
fi

# install a few prerequisite packages which let apt use packages over HTTPS
RUN_COMMAND $ISUDO apt install apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official Docker repository to your system:
RUN_COMMAND curl -fsSL https://download.docker.com/linux/ubuntu/gpg | $ISUDO apt-key add -

# add the Docker repository to APT sources
RUN_COMMAND $ISUDO add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable\"

# update the package database with the Docker packages from the newly added repo
RUN_COMMAND $ISUDO apt update

# make sure you are about to install from the Docker repo instead of the default Ubuntu repo
RUN_COMMAND apt-cache policy docker-ce

# install Docker
RUN_COMMAND $ISUDO apt install docker-ce

# check that docker process is running
RUN_COMMAND $ISUDO systemctl status docker

# RUN_COMMAND -----

# add your username to the docker group
RUN_COMMAND $ISUDO usermod -aG docker "${USER}"

# log out of the server and back in
RUN_COMMAND su - "${USER}"

# confirm that your user is now added to the docker group
RUN_COMMAND id -nG

# test docker command
RUN_COMMAND docker
docker info
docker run hello-world

# RUN_COMMAND -----

# download the 1.26.0 release and save the executable file at /usr/local/bin/docker-compose
RUN_COMMAND $ISUDO curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# set the correct permissions so that the docker-compose command is executable
RUN_COMMAND $ISUDO chmod +x /usr/local/bin/docker-compose

# test docker-compose
RUN_COMMAND docker-compose --version