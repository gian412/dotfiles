#|
#| File    : ~/.zshrc
#| Author  : Gianluca Regis <r.gian@protonmail.com>
#| Source  : https://github.com/gian412/dotfiles
#| License : WTFPL
#|


#|    Instant prompt                                                         {{{
#|------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#|  }}}


#|    Profile                                                                {{{
#|------------------------------------------------------------------------------
# Source profile
#if [ $(hostname) = 'garudaDell' ]; then
#    source "/home/gianluca/.profile"
#fi
#|  }}}


#|    Exports                                                                {{{
#|------------------------------------------------------------------------------
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

# Path to bvm
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Load zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set the default editor
export EDITOR='/usr/bin/nvim'

# Display man pages in color
export PAGER="most"

# Python interactive startup file
export PYTHONSTARTUP=$HOME/.pyrc

# DOTNET - Required
export PATH="$PATH:/home/gianluca/.dotnet/tools"
# DOTNET - Optional
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Development

#|  }}}


#|    Plugins                                                                {{{
#|------------------------------------------------------------------------------
#if [ $(hostname) = 'garudaDell' ]; then
#    source $(dirname $(gem which colorls))/tab_complete.sh
#fi
plugins=(git zsh-autosuggestions autoupdate you-should-use fast-syntax-highlighting dotfiles web-search)
#|  }}}


#|    Oh my zsh                                                              {{{
#|------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh
#|  }}}


#|    Alias                                                                  {{{
#|------------------------------------------------------------------------------

#|    Generic                                                                {{{
#|------------------------------------------------------------------------------
alias cp="cp -i"                                                            # Confirm before overwriting something
alias df='df -h'                                                            # Human-readable sizes
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'   # Better disk management
alias free='free -hwt'                                                      # Show human-readable units with buff and cache on two column and a total for each column
alias top='htop'                                                            # Better system monitor
alias help='tldr'                                                           # Better man pages
alias grep='ack'                                                            # Better grep
alias ping='prettyping -c 8'                                                # Better ping with count
alias myip='curl http://ipecho.net/plain; echo'                             # Find my public IP
alias ip='ip --color=auto'                                                  # Colorized ip
alias distro='cat /etc/*-release'                                           # See information about my distro
alias reload='source ~/.zshrc'                                              # Reload terminal
alias nvimconfig='nvim ~/.config/nvim/init.vim'                             # Open nvim configuration file
alias l='ls -al'                                                            # List elements
alias zshconfig='nvim ~/.zshrc'                                             # Open zsh configuration file
alias v='nvim'							                                    # Map nvim as v
alias sv='sudo nvim'							                            # Map sudo nvim as sv
alias monitors='~/Scripts/utils/xMonitorManagement.sh'                      # Execute monitor updates
alias vwrite='~/Scripts/nvim/write.sh'
alias vcode='~/Scripts/nvim/code.sh'
alias ls='colorls'                                                          # List using colorls by default
alias sd='cd /run/media/gianluca/gianluca'
#|  }}}

#|    Package manager                                                        {{{
#|------------------------------------------------------------------------------

#|    Update && Upgrade                                                      {{{
#|------------------------------------------------------------------------------
if (( $+commands[pacman]  )); then
  alias pu='sudo pacman -Syu'                                                   # Refresh package database and update all packages
elif (( $+commands[apt]  )); then
  alias pu='sudo apt update && sudo apt upgrade'
fi
if (( $+commands[yay]  )); then
  alias yu='yay'
elif (( $+commands[apt]  )); then
  alias yu='sudo apt update && sudo apt upgrade'
fi
#|  }}}

#|    Search for a package                                                   {{{
#|------------------------------------------------------------------------------
if (( $+commands[pacman]  )); then
  alias pf='pacman -Ss'                                                         # Search for a package by name
elif (( $+commands[apt]  )); then
  alias pf='sudo apt find'
fi
if (( $+commands[yay]  )); then
  alias yf='yay -Ss'
elif (( $+commands[apt]  )); then
  alias yf='sudo apt find'
fi
#|  }}}

#|    Install a pakage                                                       {{{
#|------------------------------------------------------------------------------
if (( $+commands[pacman]  )); then
  alias pi='sudo pacman -S'                                                     # Install package by name
elif (( $+commands[apt]  )); then
  alias pi='sudo apt install'
fi
if (( $+commands[yay]  )); then
  alias yi='yay -S'                                                             # Refresh package database and update all packages
elif (( $+commands[apt]  )); then
  alias yi='sudo apt install'
fi
#|  }}}

#|    Uninstall a package                                                    {{{
#|------------------------------------------------------------------------------
if (( $+commands[pacman]  )); then
  alias prm='sudo pacman -Rcns'                                                 # Uninstall package and his dependencies
elif (( $+commands[apt]  )); then
  alias prm='sudo apt remove'
fi
if (( $+commands[yay] )) then
  alias yrm='yay -Rcns'
elif (( $+commands[apt]  )); then
  alias yrm='sudo apt remove'
fi
#|  }}}

#|    Find orphan packages                                                   {{{
#|------------------------------------------------------------------------------
alias pfu='sudo pacman -Qtdq'						                # Find orphan packages
#Remove orphan packages
if (( $+commands[pacman]  )); then
  alias prmu='sudo pacman -Rns $(pacman -Qtdq)'         # Remove orphan packages
elif (( $+commands[apt]  )); then
  alias prmu='sudo apt autoclean && sudo apt autoremove'
fi
#|  }}}

#|    Developement                                                           {{{
#|------------------------------------------------------------------------------
alias compilec='gcc -o main main.c'
alias runc='./main'
#|  }}}

#|  }}}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vim: set ft=zsh fdm=marker fmr={{{,}}} fdl=0:

# added by travis gem
[ ! -s /home/gianluca/.travis/travis.sh ] || source /home/gianluca/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
