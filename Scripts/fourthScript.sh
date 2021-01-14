#!/bin/sh

echo ":: source \$HOME/.zshrc"
source $HOME/.zshrc

echo ":: git remote add origin https://github.com/gian412/dotfiles.git"
git remote add origin $repository
echo ":: rm .gitinclude .gitignore .zshrc"
rm .gitinclude .gitignore .zshrc

# Set up neovim
echo ":: nvim -c \"PlugInstall\""
nvim -c "PlugInstall"
echo ":: nvim -c \"CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python\""
nvim -c "CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python"

echo ":: source $HOME/.zshrc"
source $HOME/.zshrc