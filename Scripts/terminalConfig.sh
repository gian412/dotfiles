#!/bin/sh

echo ":::: \
    ::: Hello $(whoami)!
    ::: This script is the second of a serie of two.
    ::: Have you already run the first script? [y/n]?"

    read input

    if [ $input = "n" ]; then
        echo ":::: run the script preTerminalConfig.sh and come back!"
        exit
    fi

    echo "This script will do the following for you:
        :::: - Clone some usefull repository:
            :::: - vim-plug (neovim installation): a minimalist Vim plugin manager. https://github.com/junegunn/vim-plug
            :::: - zsh-autosuggestions: fish-like fast/unobtrusive autosuggestions for zsh.https://github.com/zsh-users/zsh-autosuggestions
            :::: - autoupdate: oh-my-zsh plugin for auto updating of git-repositories in the zsh custom folder. https://github.com/TamCore/autoupdate-oh-my-zsh-plugins
            :::: - You Should Use: simple zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed. https://github.com/MichaelAquilina/zsh-you-should-use
            :::: - F-Sy-H: feature rich syntax highlighting for Zsh. https://github.com/zdharma/fast-syntax-highlighting
            :::: - dotfiles-plugin: an Oh My Zsh plugin to keep your dotfines in sync across multiple PCs using Git. https://github.com/vladmyr/dotfiles-plugin
            :::: - web-search: a plugin that allow aliases for searching from terminal with some popular web search engines. https://github.com/sinetoami/web-search
            :::: - dotfiles: my dotfiles. https://github.com/gian412/dotfiles
        :::: Should the script start the installation? [y/n]?"

        read isInstallationConfirmed

        if [ $isInstallationConfirmed = "n" ]; then
            echo ":::: Nothing won't be installed"
        elif [ $isInstallationConfirmed = "y" ]; then

            echo ":::: cd $HOME"
            cd $HOME

            # Check if vim-plug is installed, otherwise install it
            if [[ -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]; then
                echo ":::: sh -c 'curl -fLo "\${XDG_DATA_HOME:-\$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
                sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            fi

            # Check if zsh-autosuggestions is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
                git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            fi

            # Check if autoupdate is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/autoupdate/autoupdate.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins \$ZSH_CUSTOM/plugins/autoupdate"
                git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
            fi

            # Check if You Shoul Use is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/you-should-use/you-should-use.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \$ZSH_CUSTOM/plugins/you-should-use"
                git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
            fi

            # Check if fast-syntax-highlighting is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/zdharma/fast-syntax-highlighting.git \
                \${ZSH_CUSTOM:-\$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting"
                git clone https://github.com/zdharma/fast-syntax-highlighting.git \
                ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
            fi

            # Check if dotfiles-plugin is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/dotfiles/dotfiles.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/vladmyr/dotfiles-plugin.git \$ZSH_CUSTOM/plugins/dotfiles"
                git clone https://github.com/vladmyr/dotfiles-plugin.git $ZSH_CUSTOM/plugins/dotfiles
                echo ":::: sh <(curl -sL https://raw.githubusercontent.com/vladmyr/dotfiles-plugin/master/install.sh)"
                sh <(curl -sL https://raw.githubusercontent.com/vladmyr/dotfiles-plugin/master/install.sh)
            fi

            # Check if web-search is installed, otherwise install it
            if [[ -f $ZSH_CUSTOM/plugins/web-search/web_search.dotfiles.plugin.zsh ]]; then
                echo ":::: git clone https://github.com/sinetoami/web-search.git \"\$ZSH_CUSTOM/plugins/web-search\""
                git clone https://github.com/sinetoami/web-search.git "$ZSH_CUSTOM/plugins/web-search"
            fi

            # Set the dotfiles repository
            echo ":::: sed -i -e 's/plugins=(git)/plugins=(git dotfiles)/g' \$HOME/.zshrc"
            sed -i -e 's/plugins=(git)/plugins=(git dotfiles)/g' $HOME/.zshrc
            echo ":::: source \$HOME/.zshrc"
            source $HOME/.zshrc

            echo ":::: Do you want to use the script creator repository? [y/n]"
            read input

            if [ $input = "y"]; then
                repository=https://github.com/gian412/dotfiles.git
            else
                echo ":::: Insert the URL to clone the repository"
                read repository
            fi

            echo ":::: git remote add origin $repository"
            git remote add origin $repository
            echo ":::: rm .gitinclude .gitignore .zshrc"
            rm .gitinclude .gitignore .zshrc

            # Set up neovim
            echo ":::: nvim -c \"PlugInstall\""
            nvim -c "PlugInstall"
            echo ":::: nvim -c \"CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python\""
            nvim -c "CocInstall coc-tsserver coc-eslint coc-html coc-css coc-java coc-python"

            echo ":::: source $HOME/.zshrc"
            source $HOME/.zshrc
        else
            echo ":::: \
                :::: Unrecognised user input: $isInstallationConfirmed
                :::: Script terminated.
                "
        fi


    # sed plugins=(git)
