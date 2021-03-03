<h1 align="center">Woosh {@.@}</h1>
<p align="center">
  <img alt="woosh" src="https://img.shields.io/badge/Woosh-%7B%40.%40%7D-b72a2a?style=flat-square"/>
  <br/>
  <img alt="release" src="https://img.shields.io/github/v/release/blyndusk/woosh?style=flat-square"/>
  <img alt="top language" src="https://img.shields.io/github/languages/top/blyndusk/woosh?style=flat-square"/>
  <img alt="code size" src="https://img.shields.io/github/languages/code-size/blyndusk/woosh?style=flat-square"/>
  <img alt="license" src="https://img.shields.io/github/license/blyndusk/woosh?style=flat-square"/>
  <br/>
  <img alt="last commit" src="https://img.shields.io/github/last-commit/blyndusk/woosh?style=flat-square"/>
</p>

![banner](assets/banner.png)

## I - Goal

**Woosh** is my personnal _Ubuntu configuration setup assistant_.

It will be charged for me, after the installation of a fresh Ubuntu operating system, to:

- update my **apt packages** and **install new ones** (_git, htop, tmux, etc..._)
- install my **snap applications**: **developement** (_vscode, postman, arduino, etc..._), **chat** (_telegram, discord, slack, etc..._) and **others** (_spotify, libreoffice, gimp, etc..._)
- install my **bash aliases, functions, exported variables, gitconfig**, **tmux and VSCode config**
- _other things under construction_

## II - Install

To install **Woosh** and run it on your machine, you just have to clone the repository, make `woo.sh` executable and then run it using bash.

```bash
git clone git@github.com:blyndusk/woosh.git ~/.woosh
cd ~/.woosh
chmod +x woo.sh
bash woo.sh
```

## II - Use

A **prompt will be displayed**, and depending on the _number_ you enter, an **action will be performed**.

![woosh](assets/prompt.png)

## III - Test

You can test some **Woosh**'s features in a _remote Ubuntu machine_, to avoid **overwriting your local configuration**, by using Docker.

```bash
docker build -t woosh . ; docker run --rm -it woosh
```

## IV - License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.
