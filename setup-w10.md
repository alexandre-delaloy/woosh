# Windows Terminal Setup

- [Windows Terminal Setup](#windows-terminal-setup)
  - [I - Install Windows Terminal](#i---install-windows-terminal)
  - [II - Install Git](#ii---install-git)
  - [III - Install Ubuntu Shell for Windows Terminal](#iii---install-ubuntu-shell-for-windows-terminal)
    - [1. Install the Windows Subsystem for Linux (WSL)](#1-install-the-windows-subsystem-for-linux-wsl)
    - [2. Enable the 'Virtual Machine Platform' optional component](#2-enable-the-virtual-machine-platform-optional-component)
    - [3. Install Ubuntu Shell for Windows 10](#3-install-ubuntu-shell-for-windows-10)
    - [4. Verify if Ubuntu Shell is correctly installed](#4-verify-if-ubuntu-shell-is-correctly-installed)
    - [5. Set Ubuntu Shell as default](#5-set-ubuntu-shell-as-default)
  - [IV - Install Fira Code font for Windows and add to Ubuntu Shell in Windows Terminal](#iv---install-fira-code-font-for-windows-and-add-to-ubuntu-shell-in-windows-terminal)
    - [1. Install Chocolatery](#1-install-chocolatery)
    - [2. Install FiraCode font via `choco`](#2-install-firacode-font-via-choco)
    - [3. Verify the installation success](#3-verify-the-installation-success)
    - [4. Add Fira Code font to Ubuntu Shell in Windows Terminal](#4-add-fira-code-font-to-ubuntu-shell-in-windows-terminal)
  - [V - Configure GitHub in Ubuntu Shell](#v---configure-github-in-ubuntu-shell)
    - [1. Configure user](#1-configure-user)
    - [2. Add new SSH key for authentification](#2-add-new-ssh-key-for-authentification)
  - [VI - Install Zsh and Oh-My-Zsh on Ubuntu Shell](#vi---install-zsh-and-oh-my-zsh-on-ubuntu-shell)
    - [1. Install Zsh](#1-install-zsh)
    - [2. Install Oh-My-Zsh](#2-install-oh-my-zsh)
  - [VII - Add Zsh plugins](#vii---add-zsh-plugins)
    - [1. zsh-autosuggestions](#1-zsh-autosuggestions)
      - [Clone](#clone)
      - [Add plugin](#add-plugin)
      - [Add permission](#add-permission)
    - [2. zsh-syntax-highlighting](#2-zsh-syntax-highlighting)
      - [Clone](#clone-1)
      - [Add plugin](#add-plugin-1)
      - [Add permission](#add-permission-1)
    - [3. Update prompt](#3-update-prompt)
  - [VIII - install an advanced zsh theme (here: spaceship-prompt)](#viii---install-an-advanced-zsh-theme-here-spaceship-prompt)
    - [1. Install (via Oh-My-Zsh)](#1-install-via-oh-my-zsh)
    - [2. Update `.zshrc`](#2-update-zshrc)

## I - Install Windows Terminal

> [Windows Terminal - Windows Store](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)

## II - Install Git
S
> [https://git-scm.com/download/win](https://git-scm.com/download/win)

## III - Install Ubuntu Shell for Windows Terminal

### 1. Install the Windows Subsystem for Linux (WSL)

Open PowerShell as Administrator and run:

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Ubuntu /all /norestart
```

### 2. Enable the 'Virtual Machine Platform' optional component

Open PowerShell as Administrator and run:

```PowerShell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 3. Install Ubuntu Shell for Windows 10

- [Install Ubuntu Shell for Windows - Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab)
- Open the Ubuntu Shell and set up a new distribution ( UNIX user )

### 4. Verify if Ubuntu Shell is correctly installed

```JSON
{
  "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
  "hidden": false,
  "name": "Ubuntu",
  "source": "Windows.Terminal.Wsl"
}
```

### 5. Set Ubuntu Shell as default

- Go to Settings (`Ctrl` + `+`)
- Replace `"defaultProfile": "{OLD_GUID}",`<br>by `"defaultProfile": "{2c4de342-38b7-51cf-b940-2309a097f518}",`

## IV - Install Fira Code font for Windows and add to Ubuntu Shell in Windows Terminal

### 1. Install Chocolatery

Open PowerShell as Administrator and run:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Then try `choco -?` to verify installation success.

### 2. Install FiraCode font via `choco`

Open PowerShell as Administrator and run:

```PowerShell
choco install firacode
```

### 3. Verify the installation success

- Go to `Settings > Personnalisation > Fonts`
- Type `Fira Code` in the "Available Fonts" input and check for existence

### 4. Add Fira Code font to Ubuntu Shell in Windows Terminal

- Open Windows Terminal
- `Ctrl` + `+`
- Add `"fontFace": "Fira Code"` in the Profile List

```JSON
"profiles": {
  "list": [
    {
      "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
      "hidden": false,
      "name": "Ubuntu",
      "source": "Windows.Terminal.Wsl",
      "fontFace": "Fira Code" // <-- here
    }
  ]
},
```

## V - Configure GitHub in Ubuntu Shell

### 1. Configure user

```bash
git config --global user.name "username"
git config --global user.email "your@email.com"
```

Result:

```bash
$ cat .gitconfig

[user]
  name = blyndusk
  email = alexandre.delaloy.dev@gmail.com
```

### 2. Add new SSH key for authentification

> [Connecting to GitHub with SSH - GitHub](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

- Test with `ssh -T git@github.com`
- Enter yes to `iAre you sure you want to continue connecting (yes/no/[fingerprint])?`

## VI - Install Zsh and Oh-My-Zsh on Ubuntu Shell

> [Oh My Zsh](https://ohmyz.sh/)

### 1. Install Zsh

```bash
sudo apt install zsh
```

### 2. Install Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## VII - Add Zsh plugins

### 1. zsh-autosuggestions

> [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

#### Clone

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Add plugin

```bash
plugins=(
  ...
  zsh-autosuggestions
  ...
)
```

#### Add permission 

```
chmod 755 /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

### 2. zsh-syntax-highlighting

> [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### Clone

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### Add plugin

```bash
plugins=(
  ...
  zsh-syntax-highlighting
  ...
)
```

#### Add permission 

```
chmod 755 /home/$USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### 3. Update prompt

```bash
source ~/.zshrc
```

## VIII - install an advanced zsh theme (here: spaceship-prompt)

> [Spaceship Prompt](https://denysdovhan.com/spaceship-prompt/)

### 1. Install (via Oh-My-Zsh)

```bash
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

### 2. Update `.zshrc`

```bash
...
10  ZSH_THEME="spaceship"
...
```

Then `source ~/.zshrc` to update your prompt