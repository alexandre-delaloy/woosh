# blyndusk's dotfiles

<p><a href="https://github.com/blyndusk/dotfiles/releases" alt="Release"><img src="https://img.shields.io/github/release/blyndusk/dotfiles.svg"></a></p>

> ⚙️ ⚙️ my personal dotfiles for MacOS, with  automated installation & update

## Get started

```bash
git clone https://github.com/blyndusk/dotfiles
cd dotfiles
source install.sh
```

`install.sh` will:

1. Synchronize **remote files** with **local files**:
    > *remote* files are in the *repository*, *local* files are located in `/Users/you`
    - if any specified file **doesn't exist**, it'll *create* it.
    - after that, sync all specified files
2. Install [Homebrew](https://brew.sh/) and all its **formulae & casks**:
    - install `brew`
    - update & upgrade `brew`
    - install all formulae (`.exports/$BREW_FORMULAES`
    - install all casks (`.exports/$BREW_CASKS`)
    - cleanup & diagnosis

`update.sh` will:

1. Synchronize **remote files** with **local files**:
    > *remote* files are in the *repository*, *local* files are located in `/Users/you`
    - if any specified file **doesn't exist**, it'll *create* it.
    - after that, sync all specified files
  
## License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.