#!/bin/sh

# Remove actual configuration
rm -f ~/.config/nvim/init.vim
rm -f ~/.config/nvim/plugins.vim
rm -f ~/.config/nvim/mappings.vim

# if the folder does't exist, create it
if [ ! -d ~/.config/nvim ] ; then
  mkdir ~/.config/nvim
fi

# Copy configuration for writers
cp ~/.nvimConfigs/write/wInit.vim ~/.config/nvim/init.vim
cp ~/.nvimConfigs/write/wMappings.vim ~/.config/nvim/mappings.vim
cp ~/.nvimConfigs/write/wPlugins.vim ~/.config/nvim/plugins.vim
