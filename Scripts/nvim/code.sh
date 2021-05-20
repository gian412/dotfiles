#!/bin/sh

# Remove actual configuration
rm -f ~/.config/nvim/init.vim
rm -f ~/.config/nvim/plugins.vim
rm -f ~/.config/nvim/mappings.vim

# if the folder does't exist, create it
if [ ! -d ~/.config/nvim ] ; then
  mkdir ~/.config/nvim
fi

# Copy configuration for coders
cp ~/.nvimConfigs/code/cInit.vim ~/.config/nvim/init.vim
cp ~/.nvimConfigs/code/cMappings.vim ~/.config/nvim/mappings.vim
cp ~/.nvimConfigs/code/cPlugins.vim ~/.config/nvim/plugins.vim
