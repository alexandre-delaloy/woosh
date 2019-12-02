#!/bin/bash

pwd=$(pwd)

cp .aliases ~/.aliases 
cp .functions ~/.functions
cp .exports ~/.exports 
cp .gitignore ~/.gitignore
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile

if [ ! -d ~/.config ]; then
    mkdir ~/.config
    cd .config
    if [ ! -d ~/.config/htop ]; then
        mkdir htop
        cd htop
        cp .config/htop/htoprc  ~/.config/htop/htoprc 
    else 
        cp .config/htop/htoprc  ~/.config/htop/htoprc 
    fi
else 
    cp .config/htop/htoprc  ~/.config/htop/htoprc 
fi

cd "$pwd"