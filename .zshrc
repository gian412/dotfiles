# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "/home/gianluca/.profile"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gianluca/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source $(dirname $(gem which colorls))/tab_complete.sh
plugins=(git zsh-autosuggestions autoupdate you-should-use fast-syntax-highlighting dotfiles web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='/usr/bin/nvim'
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# ## Alias section
alias cp="cp -i"                                                                # Confirm before overwriting something
alias df='df -h'                                                                # Human-readable sizes
alias free='free -hwt'                                                          # Show human-readable units with buff and cache on two column and a total for each column
alias myip='curl http://ipecho.net/plain; echo'                                 # Find my public IP
alias distro='cat /etc/*-release'                                               # See information about my distro
alias reload='source ~/.zshrc'                                                  # Reload terminal
alias nvimconfig='nvim ~/.config/nvim/init.vim'
if [ $(hostname) = 'garudadell' ]; then
  alias sd='cd /run/media/gianluca/SanDisk\ 64G'
fi

############## package manager
# Update && Upgrade
if (( $+commands[pacman]  )); then
  alias pu='sudo pacman -Syu'                                                   # Refresh package database and update all packages
elif (( $+commands[apt]  )); then
  alias pu='sudo apt update && sudo apt upgrade'
fi
if (( $+commands[yay]  )); then
  alias yu='yay'
fi
# Search for a package
if (( $+commands[pacman]  )); then
  alias pf='pacman -Ss'                                                         # Search for a package by name
elif (( $+commands[apt]  )); then
  alias ps='sudo apt find'
fi
if (( $+commands[yay]  )); then
  alias yf='yay -Ss'
fi
# Install
if (( $+commands[pacman]  )); then
  alias pi='sudo pacman -S'                                                     # Install package by name
elif (( $+commands[apt]  )); then
  alias pi='sudo apt install'
fi
if (( $+commands[yay]  )); then
  alias yi='yay -S'                                                             # Refresh package database and update all packages
fi
# Uninstall
if (( $+commands[pacman]  )); then
  alias prm='sudo pacman -Rcns'                                                 # Uninstall package and his dependencies
elif (( $+commands[apt]  )); then
  alias prm='sudo apt remove'
fi
if (( $+commands[yay] )) then
  alias yrm='yay -Rcns'
fi
# Find orphan packages
alias pfu='sudo pacman -Qtdq'						                            # Find orphan packages
#Remove orphan packages
if (( $+commands[pacman]  )); then
  alias prmu='sudo pacman -Rns $(pacman -Qtdq)'				                    # Remove orphan packages
elif (( $+commands[apt]  )); then
  alias prmu='sudo apt autoclean && sudo apt autoremove'
fi

alias ls='colorls'                                                              # List using colorls by default
alias l='ls -al'                                                                # List elements
alias zshconfig='nvim ~/.zshrc'                                                 # Open zsh configuration file using neovim
alias v='nvim'							                                        # Map neovim as v
alias sv='sudo nvim'							                                # Map sudo neovim as sv

# Develope
alias compilec='gcc -o main main.c'
alias runc='./main'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Display man pages in color
export PAGER="most"

# My git base URL
export MYGIT="https://github.com/gian412"

# Python interactive startup file
export PYTHONSTARTUP=$HOME/.pyrc

# DOTNET - Required
export PATH="$PATH:/home/gianluca/.dotnet/tools"
# DOTNET - Optional
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Development
source /usr/share/undistract-me/long-running.bash
notify_when_long_running_commands_finish_install
