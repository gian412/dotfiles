"|
"| File    : ~/.config/nvim/plugins.vim
"| Author  : Gianluca Regis
"| Source  : https://github.com/gian412/dotfiles
"| License : WTFPL
"|


" Map Leader
nmap <Space> <Nop>
let mapleader = "\<Space>"


"|   Plugin installation                                                     {{{
"|------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

"|    Parenthesizing                                                         {{{
"|------------------------------------------------------------------------------
Plug 'tpope/vim-surround'    " Quoting/parenthesizing made simple
Plug 'jiangmiao/auto-pairs'  " Auto pair
"|  }}}


"|    Development                                                            {{{
"|------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc for suggedtions
" Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"|  }}}


"|    Windows and filesystem                                                 {{{
"|------------------------------------------------------------------------------
Plug 'fabi1cazenave/suckless.vim'  " i3-like windows management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"|  }}}


"|    Color schemes                                                          {{{
"|------------------------------------------------------------------------------
Plug 'Luxed/ayu-vim' " Color schemes
"|  }}}


"|    Miscellaneous                                                          {{{
"|------------------------------------------------------------------------------
Plug 'tpope/vim-repeat'      " Enable `.` to repeat mapped actions
Plug 'tpope/vim-commentary'  " Toggle comments easily
Plug 'tpope/vim-fugitive'    " A Git wrapper so awesome, it should be illegal
Plug 'mbbill/undotree'       " Undo tree viewer
"  }}}

call plug#end()
"|   }}}


"|    Plugin configuration                                                   {{{
"|------------------------------------------------------------------------------
"|    Suckless config                                                        {{{
"|------------------------------------------------------------------------------
let g:suckless_tmap = 1
let g:suckless_mappings = {
\        '<M-[sdf]>'      :   'SetTilingMode("[sdf]")'    ,
\        '<M-[hjkl]>'     :    'SelectWindow("[hjkl]")'   ,
\        '<M-[HJKL]>'     :      'MoveWindow("[hjkl]")'   ,
\      '<C-M-[hjkl]>'     :    'ResizeWindow("[hjkl]")'   ,
\        '<M-[oO]>'       :    'CreateWindow("[sv]")'     ,
\        '<M-w>'          :     'CloseWindow()'           ,
\      '<C-M-w>'          :  'CollapseWindow()'           ,
\        '<M-y>'          :       'CreateTab()'           ,
\        '<M-[UI]>'       :         'MoveTab("[hl]")'     ,
\        '<M-[ui]>'       :       'SelectTab("[hl]")'     ,
\        '<M-[123456789]>':       'SelectTab([123456789])',
\        '<M-[!@#$%^&*(]>': 'MoveWindowToTab([123456789])',
\}
set splitbelow splitright " consistency with most tiling WMs (wmii, i3…)
"|  }}}


"|    fzf config                                                             {{{
"|------------------------------------------------------------------------------
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
"|  }}}


"|    Ayu config                                                             {{{
"|------------------------------------------------------------------------------
set termguicolors "24bit colors

" Ayu light
" set background=light
" let g:ayucolor="light"  " for light version of theme

"Ayu mirage/dark
set background=dark
let g:ayucolor="mirage" " for mirage version of theme
" let g:ayucolor="dark"   " for dark version of theme
" source ~/.vim/plugged/ayu-vim/colors/ayu.vim
colorscheme ayu
"|  }}}
"|  }}}


" vim: set ft=vim fdm=marker fmr={{{,}}} fdl=0:
