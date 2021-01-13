#!/bin/sh

# TODO: Check wich shell is in use.
echo "\
Hello $(whoami)!
This script is the first of a serie of two. It will do the following for you:
- Full system update
- Install some package (and their dependencies):
    - base
    - base-devel
    - zsh: advanced and programmable shell
    - most: a terminal pager
    - flameshot: a powerful yet simple to use screenshot software
    - chromium: a web browser built for speed, simplicity, and security
    - speedtest-cli: command line interface for testing internet bandwidth using speedtest.net
    - npm: a package manager for javascript
    - jdk-openjdk: Java Development Kit
    - ruby: an OO language for quick and easy programming
    - curl: an URL retrieval utility and library
    - git: the fast distributed version control system
    - thunderbird: Standalone mail and news reader from mozilla.org
- Install some package from AUR (and their dependencies):
    - yay: Pacman wrapper and AUR helper written in go
    - undistract-me: notifies you when long-running terminal commands complete
    - brave-bin: web browser that blocks ads and trackers by default
    - visual-studio-code-bin: editor for building and debugging modern web and cloud applications
- Install a ruby gem:
    - colorls: a Ruby CLI gem that beautifies the terminal's ls command, with color and font-awesome icons
- Set default user name and email for git
- Set default pull behaviour to merge
- Change default shell to zsh. You can find more information at https://www.zsh.org/
- Install Oh My Zsh, an open source, community-driven framework for managing zsh configuration. You can find more information at https://github.com/ohmyzsh/ohmyzsh
- Install Powerlevel10k, a theme for zsh. You can find more information at https://github.com/romkatv/powerlevel10k
Should the script start the installation? [y/n]"

read isInstallationConfirmed

if [ $isInstallationConfirmed = "n" ]; then
    echo "Nothing won't be installed"
elif [ $isInstallationConfirmed = "y" ]; then
    echo "Starting installation..."

    # Move to home folder
    cd $HOME

    # Update system
    if ! command -v "yay" &> /dev/null; then
        yay
    else
        sudo pacman -Syu
    fi

    # Check for absent packages from Pacman
    echo "sudo pacman -S --needed base base-devel zsh most flameshot chromium speedtest-cli npm jdk-openjdk ruby curl git thunderbird"
    sudo pacman -S --needed base base-devel zsh most flameshot chromium speedtest-cli npm jdk-openjdk ruby curl git thunderbird

    # Check if yay is installed, otherwise install it
    if ! command -v "yay" &> /dev/null; then
        echo "cd /opt"
        cd /opt
        echo "sudo git clone https://aur.archlinux.org/yay-git.git"
        sudo git clone https://aur.archlinux.org/yay-git.git
        echo "sudo chown -R $USER:$USER yay-git/"
        sudo chown -R $USER:$USER yay-git/
        echo "cd yay-git"
        cd yay-git
        echo "makepkg -si"
        makepkg -si
    fi

    # Check for absent packages from AUR
    echo "yay -S --needed undistract-me brave-bin visual-studio-code-bin"
    yay -S --needed undistract-me brave-bin visual-studio-code-bin

    # Check if colorls is installed, otherwise install it
    if ! command -v "colorls" &> /dev/null; then
        echo "gem install colorls"
        gem install colorls
    else
        echo "No ruby gem to install"
    fi

    # Set default user name and email for git
    echo "Setting git..."
    echo "Enter Git user name:"
    read gitUserName
    echo "Enter Git email:"
    read gitEmail

    echo "git config --global user.name $gitUserName"
    git config --global user.name "$gitUserName"
    echo "git config --global user.email $gitEmail"
    git config --global user.email "$gitEmail"
    echo "git config --global pull.rebase false"
    git config --global pull.rebase false

    # Change default shell to zsh
    echo "Changing default shell to zsh..."
    echo "chsh -s \$(which zsh)"
    chsh -s $(which zsh)

    # Download and install Oh My Zsh
    echo "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Download and install Powerlevel10k
    echo "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc"
    sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc


else
    echo "\
Unrecognised user input: $isInstallationConfirmed
Script terminated.
"
fi
