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
Plug 'alvan/vim-closetag'    " Autoclose tag
"|  }}}


"|    Development                                                            {{{
"|------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'c', 'cpp'] }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'wakatime/vim-wakatime'
"|  }}}


"|    Windows and filesystem                                                 {{{
"|------------------------------------------------------------------------------
Plug 'fabi1cazenave/suckless.vim'  " i3-like windows management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"|  }}}


"|    Theme                                                                  {{{
"|------------------------------------------------------------------------------
Plug 'Luxed/ayu-vim' " Color schemes
Plug 'Yggdroot/indentLine' " Gliph for indented lines
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


"|    closetag config                                                        {{{
"|------------------------------------------------------------------------------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
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


"|    Coc config                                                             {{{
"|------------------------------------------------------------------------------

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-html',
    \ 'coc-markdownlint',
    \ 'coc-sh',
    \ 'coc-tailwindcss',
    \ 'coc-clangd'
    \ ]




" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

"| }}}


"|    indentLine config                                                             {{{
"|------------------------------------------------------------------------------
let g:indentLine_char = '▏'
let g:indentLine_first_char = '▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setColors = 0
"| }}}


"|    Emmet config                                                           {{{
"|------------------------------------------------------------------------------
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"| }}}


" vim: set ft=vim fdm=marker fmr={{{,}}} fdl=0:
