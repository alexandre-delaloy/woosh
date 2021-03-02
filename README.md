# Woosh {@.@}

![woosh](https://img.shields.io/badge/Woosh-%7B%40.%40%7D-b72a2a?style=flat-square)
![license](https://img.shields.io/github/v/release/blyndusk/dotfiles?style=flat-square)
![language](https://img.shields.io/github/languages/top/blyndusk/dotfiles?style=flat-square)
![code size](https://img.shields.io/github/languages/code-size/blyndusk/woosh?style=flat-square)
![license](https://img.shields.io/github/license/blyndusk/dotfiles?style=flat-square)
![last commit](https://img.shields.io/github/last-commit/blyndusk/woosh?style=flat-square)
![banner](assets/banner.png)

## I - Goal

**Woosh** is my personnal *Ubuntu configuration setup assistant*.

It will be charged for me, after the installation of a fresh Ubuntu operating system, to:
- update my **apt packages** and **install new ones** (*git, htop, tmux, etc...*)
- install my **development snap applications** (*vscode, postman, arduino, etc...*), **chat applications** (*telegram, discord, slack, etc...*) and **others** (*spotify, libreoffice, gimp, etc...*)
- install my **bash aliases and functions**, **tmux and VSCode config**
- *other things under construction*

## II - Install

To install **Woosh** and run it on your machine, you just have to clone the repository, make `woo.sh` executable and then run it using bash.

```bash
git clone git@github.com:blyndusk/woosh.git ~/.woosh
cd ~/.woosh
chmod +x woo.sh
bash woo.sh
```


## II - Use

A **prompt will be displayed**, and depending on the *number* you enter, an **action will be performed**.


![woosh](assets/prompt.png)

## III - Test

You can test some **Woosh**'s features in a *remote Ubuntu machine*, to avoid **overwriting your local configuration**, by using Docker.

```bash
docker build -t woosh . ; docker run --rm -it woosh
```


## IV - License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.
