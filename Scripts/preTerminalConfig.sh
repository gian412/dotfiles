#!/bin/sh

# TODO: Check wich shell is in use.
echo "\
Hello $(whoami)!
This script is the first of a serie of two. It will do the following for you:
- Install some usefull package (and their dependencies):
    - zsh: advanced and programmable shell
    - most: a terminal pager
    - flameshot: a powerful yet simple to use screenshot software
    - chromium: a web browser built for speed, simplicity, and security
    - speedtest-cli: command line interface for testing internet bandwidth using speedtest.net
    - npm: a package manager for javascript
    - jre-openjdk: Java full Runtime Enviroment
    - jdk-openjdk: Java Development Kit
    - ruby: an OO language for quick and easy programming
    - curl: an URL retrieval utility and library
    - git: the fast distributed version control system

- Install some usefull package from AUR (and their dependencies):
    - yay: Pacman wrapper and AUR helper written in go
    - undistract-me: notifies you when long-running terminal commands complete
    - brave-bin: web browser that blocks ads and trackers by default

- Set default user name and email for git
- Set default pull behaviour as merge
- Change default shell to zsh. You can find more information at https://www.zsh.org/
- Install Oh My Zsh, an open source, community-driven framework for managing zsh configuration. You can find more information at https://github.com/ohmyzsh/ohmyzsh
- Install Powerlevel10k, a theme for zsh. You can find more information at https://github.com/romkatv/powerlevel10k
Should the script start the installation [y/n]?"

read isInstallationConfirmed

if [ $isInstallationConfirmed = "n" ]; then
    echo "Nothing won't be installed"
elif [ $isInstallationConfirmed = "y" ]; then
    echo "Starting installation..."

    # Check for absent packages from Pacman
    packages=("zsh" "most" "flameshot" "chromium" "npm" "ruby" "curl" "git")
    packagesToInstall=""

    for pkg in ${packages[@]}; do
        if ! command -v ${pkg} &> /dev/null; then
            echo "${pkg} could not be found"
            packagesToInstall="$packagesToInstall ${pkg}"
        fi
    done

    if ! command -v "javac" &> /dev/null; then
        packagesToInstall="$packagesToInstall jdk-openjdk"
    fi

    # If there is any absent package, install it
    if [ -n "$packagesToInstall" ]; then
        sudo pacman -S $packagesToInstall
    else
        echo "Nothing to install from Pacman."
    fi

    # Check if yay is installed, otherwise install it
    if ! command -v "yay" &> /dev/null; then
        cd /opt
        sudo git clone https://aur.archlinux.org/yay-git.git
        sudo chown -R $USER:$USER yay.git/
        cd yay-git
        makepkg -si
    fi

    # Check for absent packages from AUR
    if ! test -f "/usr/share/undistract-me/long-running.bash"; then
        packagesToInstallAUR="$packagesToInstallAUR undistract-me"
    fi


    if ! command -v "brave" &> /dev/null; then
        packagesToInstallAUR="$packagesToInstallAUR brave-bin"
    fi

    # If there is any absent package , install it
    if [ -n "$packagesToInstallAUR" ]; then
        yay -S $packagesToInstallAUR
    else
        echo "Nothing to install from AUR."
    fi

    echo "Changing default shell to zsh..."

    # Set default user name and email for git
    echo "Enter Git user name:"
    read gitUserName
    echo "Enter Git email:"
    read gitEmail

    git config --global user.name "$gitUserName"
    git config --global user.email "$gitEmail"
    git config --global pull.rebase false

    # Change default shell to zsh
    shell=`printenv | grep SHELL=`
    if [ $shell = "SHELL=/usr/bin/fish" ]; then
        chsh -s (which zsh)
    else
        chsh -s $(which zsh)
    fi

else
    echo "\
Unrecognised user input: $isInstallationConfirmed
Script terminated.
"
fi
