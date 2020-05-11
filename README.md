# blyndusk's dotfiles

<p><a href="https://github.com/blyndusk/dotfiles/releases" alt="Release"><img src="https://img.shields.io/github/release/blyndusk/dotfiles.svg"></a></p>

> 🛠 my personal dotfiles for MacOS, with  automated installation & update

## Install

```bash
git clone https://github.com/blyndusk/dotfiles.git
git config core.hooksPath .githooks
chmod +x ./.githooks/commit-msg
```

## Quick start

```bash
git clone https://github.com/blyndusk/dotfiles.git
cd dotfiles
source install.sh
```

[`install.sh`](https://github.com/blyndusk/dotfiles/blob/master/install.sh) will:

1. Synchronize **remote files** with **local files**:
    > source: [`bin/sync.sh`](https://github.com/blyndusk/dotfiles/blob/master/bin/sync.sh)

    > *remote* files are in this *repository*, *local* files are located in `/Users/you`
    - if any specified file **doesn't exist**, it'll *create* it.
    - after that, sync all specified files
2. Install [Homebrew](https://brew.sh/) and all its **formulae & casks**:
   > source: [`bin/brew.sh`](https://github.com/blyndusk/dotfiles/blob/master/bin/brew.sh)
    - **install** `brew`
    - **update** & **upgrade** `brew`
    - install all **formulae** (`.exports/$BREW_FORMULAES`)
    - install all **casks** (`.exports/$BREW_CASKS`)
    - **cleanup** & **diagnosis**

[`update.sh`](https://github.com/blyndusk/dotfiles/blob/master/update.sh) will:

> source: [`bin/sync.sh`](https://github.com/blyndusk/dotfiles/blob/master/bin/sync.sh)

> `source update.sh -f || source update.sh --forced` will automatically overwrite local files

1. Synchronize **remote files** with **local files**:
   > *remote* files are in this *repository*, *local* files are located in `/Users/you`
    - if any specified file **doesn't exist**, it'll *create* it.
    - after that, sync all specified files
  
## License

Under [MIT](https://github.com/blyndusk/dotfiles/blob/master/LICENSE) license.