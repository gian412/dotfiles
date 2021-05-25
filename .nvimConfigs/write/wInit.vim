
"|
"| File    : ~/.config/nvim/init.vim
"| Author  : Gianluca Regis
"| Source  : https://github.com/gian412/dotfiles
"| License : WTFPL
"|


" Map Leader
nmap <Space> <Nop>
let mapleader = "\<Space>"


"|    Miscellaneous                                                          {{{
"|------------------------------------------------------------------------------
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor5
"       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"       \,sm:block-blinkwait175-blinkoff150-blinkon175
set winblend=20                     " Neovim 0.4+ pseudo-transparency for floating windows
set backspace=indent,eol,start      " Backspace over these items
set complete-=i                     " ins-completion scan current and included file
set nrformats-=octal                " Base used for numbers when using <C-A> and <C-X>
set laststatus=2                    " Always have status line
set ruler                           " Show line and column number of the cursor position
set display+=lastline               " Set how to display long lines
set autoread                        " Detect changes to open file and automatically read it again
set sessionoptions-=options         " Change the effect of the :mksession command
set viewoptions=options             " Change the of the :mkview command+
set modeline                        " Default but some distro disable it
set modelines=5                     " Default but some distro disable it
set showmatch                       " When inserting a bracke, briefly jump to its match
set encoding=utf-8                  " String encoding
set nodigraph                       " Disable digraph input to make
set noswapfile                      " Disable swap for buffers
set nobackup                        " Disable backup for files changed
set undodir=~/.config/nvim/undodir  " Enable undo tree
set undofile                        " Enable undo saving at buffer close
set updatetime=500                  " Write swap if nothing is wrote for 500 ms
set noerrorbells                    " Disable error bells
set visualbell                      " Enable visual bell
set mouse=a                         " Enable mouse
set formatoptions=nt               " 't'=wrap text on 'textwidth', 'a' turns on the real-time reformatting
set formatoptions+=or               " Keep inserting comment leader character on subsequential lines
set nopaste	                        " Pasting with auto-indent disabled (breaks bindings in cli vim)
set nofoldenable                    " No folding
"|  }}}


"|    80-characters lines                                                   {{{
"-------------------------------------------------------------------------------
set textwidth=80    " Max line length
set wrapmargin=0

autocmd BufRead,BufNewFile   *.sh setlocal textwidth=0 linebreak
"|  }}}


"|    Spell Check                                                            {{{
"-------------------------------------------------------------------------------
" Enable in-line spell check
set spell
set spelllang=en

command! SPCLEAN :runtime spell/cleanadd.vim

"|  }}}


"|    Search settings                                                        {{{
"|------------------------------------------------------------------------------
set hlsearch          " Highlight search results
set incsearch         " When searching, start highlighting partial matches
set inccommand=split  " Incremental replace: show as you type (in a split)
set ignorecase        " Search is case-insensitive...
set smartcase         " ... except if the search pattern contains uppercase chars
set nowrapscan        " Don't loop through search results
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <leader><leader> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
"|  }}}


"|    Case-insensitive tab completion in the command line                    {{{
"|------------------------------------------------------------------------------
set wildmenu               " Enhanced command-line completion in the statusline
set wildmode=longest,full  " Use 'list:longest' to complete files like a shell
set wildignorecase         " Ignore case when completing file names and directories
set showfulltag
"|  }}}


"|    Indentation                                                            {{{
"|------------------------------------------------------------------------------
set smarttab                        " <Tab> inserts blank accordingly to 'shiftwidth'
set tabstop=4                       " <Tab> setted to 4
set softtabstop=4                   " Makes backspace treat 4 spaces like a tab
set shiftwidth=4                    " Makes indents 4 spaces wide as well
set expandtab                       " Expand tabs into spaces
setlocal noautoindent
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=
"|  }}}


"|    User Interface                                                         {{{
"|------------------------------------------------------------------------------
set showmode           " Display current mode below the status line
set showtabline=1      " Show tab bar if there are at least 2 buffers
set laststatus=2       " Always show the status line
set ruler              " Display line/col cursor position in the statusline
set cursorline         " Highlight current line
set virtualedit=block  " Easier rectangular selections
set number             " Show absolute number on current line
set relativenumber     " Show relative line numbers
set scrolloff=5        " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=5    " Minimal number of screen columns to keep to the left and right of the cursor
set cmdheight=2        " Status line use 2 lines

syntax enable
"|  }}}


"|    Conditional Miscellaneous                                              {{{
"|------------------------------------------------------------------------------
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>, precedes:<,nbsp:+ " Strings to use in 'list'
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch'))
  set shell=/usr/bin/env\ bash " Shell to use for! and:! commands
endif

if $history < 1000
  set history=1000 " Set commands and search patterns history dimension
endif

if &tabpagemax <50
  set tabpagemax=50 " Maximum number of tab pages to be opeed by the -p CLI argument of the ":tab all'
endif
"|  }}}


"|    Plugins and mappings                                                   {{{
"|------------------------------------------------------------------------------
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
"  }}}


"|    Source configuration files on save to apply all changes immediately    {{{
"|------------------------------------------------------------------------------
augroup configurationFiles
  autocmd! BufWritePost init.vim      source %
  autocmd! BufWritePost Xresources    !xrdb -load ~/.Xresources
  autocmd! BufWritePost .Xresources   !xrdb -load ~/.Xresources
  autocmd! BufWritePost tmux.conf     !tmux source-file ~/.tmux.conf
  autocmd! BufWritePost .tmux.conf    !tmux source-file ~/.tmux.conf
augroup END
"|  }}}


" vim: set ft=vim fdm=marker fmr={{{,}}} fdl=0:
