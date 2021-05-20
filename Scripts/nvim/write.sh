#!/bin/sh

# Remove actual configuration
rm ~/.config/nvim/init.vim
rm ~/.config/nvim/plugins.vim
rm ~/.config/nvim/mappings.vim

cp ~/.nvimConfigs/write/wInit.vim ~/.config/nvim/init.vim
cp ~/.nvimConfigs/write/wMappings.vim ~/.config/nvim/mappings.vim
cp ~/.nvimConfigs/write/wPlugins.vim ~/.config/nvim/plugins.vim
