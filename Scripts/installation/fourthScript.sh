#!/bin/sh

echo"\
    Hello $(whoami)!
    This script is the fourth of a serie of four.
    Have you already run the first three scripts? [y/n]"

    read input

    if [ $input = "n" ]; then
        echo "Run them and then come back!"
        exit
    fi

echo ":: source \$HOME/.zshrc"
source $HOME/.zshrc

echo ":: cd ~"
cd ~

echo "rm .zshrc"
rm .zshrc

echo ":: git init"
git init
echo ":: git remote add origin https://github.com/gian412/dotfiles.git"
git remote add origin https://github.com/gian412/dotfiles.git
echo ":: git pull origin main"
git pull origin main

# Set up neovim
echo ":: nvim -c \"PlugInstall\""
nvim -c "PlugInstall"
echo ":: nvim -c \"CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python\""
nvim -c "CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python"

echo ":: source $HOME/.zshrc"
source $HOME/.zshrc
