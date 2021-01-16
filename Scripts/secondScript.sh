#!/bin/sh

echo "\
Hello $(whoami)!
This script is the second of a serie of four.
Have you already run the first script? [y/n]"

    read input

    if [ $input = "n" ]; then
        echo "Run it and then come back!"
        exit
    fi

    echo "\
This script will do the following for you:

- Install Oh My Zsh, an open source, community-driven framework for managing zsh configuration. You can find more information at https://github.com/ohmyzsh/ohmyzsh
- Install Powerlevel10k, a theme for zsh. You can find more information at https://github.com/romkatv/powerlevel10k

Should the script start the installation? [y/n]"

read isInstallationConfirmed
if [ $isInstallationConfirmed = "y" ]; then

    # Download and install Powerlevel10k
    echo ":: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo ":: sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc"
    sed -i -e 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc

    echo"\
    Close your terminal, open it again and you can then set your theme.
    Once your theme is setted, run the third script.
    See you later!"

elif [ $isInstallationConfirmed = "n" ]; then
    echo "Nothing won't be installed"
else
    echo"\
Unrecognised user input: $scriptChoice.
Script terminated."
fi
