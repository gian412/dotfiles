"|
"| File    : ~/.config/nvim/mappings.vim
"| Author  : Gianluca Regis
"| Source  : https://github.com/gian412/dotfiles
"| License : WTFPL
"|


" Map Leader
nmap <Space> <Nop>
let mapleader = " "


"|    Folding                                                                {{{
"|------------------------------------------------------------------------------
" Folding levels
nmap <silent> z0 :set fdl=0<CR>
nmap <silent> z1 :set fdl=1<CR>
nmap <silent> z2 :set fdl=2<CR>
nmap <silent> z3 :set fdl=3<CR>
nmap <silent> z4 :set fdl=4<CR>
nmap <silent> z5 :set fdl=5<CR>
nmap <silent> z6 :set fdl=6<CR>
nmap <silent> z7 :set fdl=7<CR>
nmap <silent> z8 :set fdl=8<CR>
nmap <silent> z9 :set fdl=9<CR>
"|   }}}


"|    Moving                                                                 {{{
"|------------------------------------------------------------------------------
" Move by screen lines, not by real lines
nnoremap j gj
nnoremap k gk

xnoremap j gj
xnoremap k gk
"|   }}}


"|    Split                                                                  {{{
"|------------------------------------------------------------------------------
" Open a vertical split and switch over (v)
nmap <leader>v <C-w>v

" Open a horizontal split and switch over (s)
nmap <leader>s <C-w>s
"|  }}}


"|    Buffers                                                                {{{
"|------------------------------------------------------------------------------
" Buffers can exist in background without being in a window
set hidden

" Automatically save before commands like :next and :make
set autowrite

" Buffer browsing with left/right arrows
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" Jump to previous buffer with tab
nnoremap <Tab> <C-^>

" Use CTRL + tab to toggle between splits
nnoremap <C-Tab> <C-W><C-W>

" Open the file under cursor in the existing split. If no splits are open,
" do nothing. Explanation:
"   :let myfile=expand("<cfile>") -  grabs the name under cursor
"   <C-W>w                        -  jump to the next available window
"   :execute("e ".myfile)         -  opens the saved file name in current window
"   <C-W>p                        -  jumps back to the previous window
nnoremap <leader>f :let myfile=expand("<cfile>")<CR><C-W>w :exec("e ".myfile)<CR><C-W>p
"|  }}}


"|    Window commands and File system                                        {{{
"|------------------------------------------------------------------------------
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
"  }}}


"|    FuGITive                                                               {{{
"|------------------------------------------------------------------------------
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
"|  }}}


"|    Miscellaneous                                                          {{{
"|------------------------------------------------------------------------------
" Map <Leader>[oO] to [oO] in normal mode
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

" Keep selection active when indenting/unindenting
vmap < <gv
vmap > >gv

" Make U a redo
map U <C-r>

" Make K more consistent with J (J = join, K = split)
nmap K i<CR><Esc>k$

" Disable pageUp and pageDown kays (bad position in my keyboard)
map <PageUp> <Left>
map <PageDown> <Right>

" Insert current date on F10
nnoremap <F10> "=strftime("%a %b %d, %Y")<CR>P
inoremap <F10> <C-R>=strftime("%a %b %d, %Y")<CR>

" Use <leader>[yp] to copy and paste from/to system clipdoard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>p :set paste<cr>"+]p:set nopaste<cr>
nnoremap <leader>P :set paste<cr>"+]P:set nopaste<cr>

" Use +/- to increment/decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" CTRL + backspace deletes last word
inoremap <C-BS> <esc>bcw

"CTRL + del deletes next word
inoremap <C-Del> <esc>wcw

"|  }}}


"|    Saving and Closing                                                     {{{
"|------------------------------------------------------------------------------
" Map <Leader>[qwex] to :[qwex] in normal mode
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>e :e<CR>
nmap <Leader>x :x<CR>

" Map :[WQ] to :[wq]
command! W w
command! WQ wq
command! Wq wq
command! Q q
"|  }}}


"|    TrimWhitespace                                                         {{{
"|------------------------------------------------------------------------------
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
"|  }}}


" vim: set ft=vim fdm=marker fmr={{{,}}} fdl=0:
