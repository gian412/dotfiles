#!/bin/sh

# Remove actual configuration
rm ~/.config/nvim/init.vim
rm ~/.config/nvim/plugins.vim
rm ~/.config/nvim/mappings.vim

cp ~/.nvimConfigs/code/cInit.vim ~/.config/nvim/init.vim
cp ~/.nvimConfigs/code/cMappings.vim ~/.config/nvim/mappings.vim
cp ~/.nvimConfigs/code/cPlugins.vim ~/.config/nvim/plugins.vim
