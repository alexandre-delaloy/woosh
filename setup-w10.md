# Windows Terminal Setup

## I - Install Windows Terminal

> [Windows Terminal - Windows Store](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)

## II - Install Git

> [https://git-scm.com/download/win](https://git-scm.com/download/win)

## III - Install Linux Shell for Windows Terminal

### 1. Install the Windows Subsystem for Linux (WSL)

Open PowerShell as Administrator and run:

```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

### 2. Enable the 'Virtual Machine Platform' optional component

Open PowerShell as Administrator and run:

```PowerShell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### 3. Install Ubuntu Shell for Windows 10

- [Install Ubuntu Shell for Windows - Microsoft Store](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab)
- Open the Ubuntu Shell and set up a new distribution ( UNIX user )

### 4. Verify if Linux Shell is correctly installed

```JSON
 {
                "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
                "hidden": false,
                "name": "Ubuntu",
                "source": "Windows.Terminal.Wsl"
            }
```

##  IV - Install Fira Code font for Windows and add to Linux Shell in Windows Terminal

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

### 4. Add Fira Code font to Linux Shell in Windows Terminal

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
                "source": "Windows.Terminal.Wsl"
		"fontFace": "Fira Code" // <-- here
            }

  ]
},
```

### V - Configure GitHub in Linux Shell

#### 1. Configure user

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

#### 2. Add new SSH key for authentification

> [Connecting to GitHub with SSH - GitHub](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

- Test by cloning > modify > add > commit > push and look if you're identified in your repository.

enter yes to " contniAre you sure you want to continue connecting (yes/no/[fingerprint])? yes







