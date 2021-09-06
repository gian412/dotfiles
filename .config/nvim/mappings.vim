"|
"| File    : ~/.config/nvim/mappings.vim
"| Author  : Gianluca Regis
"| Source  : https://github.com/gian412/dotfiles
"| License : WTFPL
"|


" Map Leader
nmap <Space> <Nop>
let mapleader = " "
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"|    Folding                                                                {{{
"|------------------------------------------------------------------------------
" Code folding / unfolding
nmap <Tab>   za
nmap <S-Tab> zA

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


"|    Split                                                                  {{{
"|------------------------------------------------------------------------------
" Open a vertical split and switch over (v)
nmap <leader>v <C-w>v

" Open a horizontal split and switch over (s)
nmap <leader>s <C-w>s
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


"|    GoTo code navigation                                                   {{{
"|------------------------------------------------------------------------------
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnosti-next-error)
nnoremap <leader>cr :CocRestart
nmap <leader>do <Plug>(coc-codeaction)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
"|  }}}


"|    FuGITive                                                               {{{
"|------------------------------------------------------------------------------
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
"|  }}}


"|    Miscellaneous                                                          {{{
"|------------------------------------------------------------------------------
" Map <Leader>[qwex] to :[qwex] in normal mode
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>e :e<CR>
nmap <Leader>x :x<CR>

" Keep selection active when indenting/unindenting
vmap < <gv
vmap > >gv

" Make Y copy to the end of the line
map Y y$

" Make U a redo
map U <C-r>

" Make K more consistent with J (J = join, K = split)
nmap K i<CR><Esc>k$

" Disable pageUp and pageDown kays (bad position in my keyboard)
map <PageUp> <Left>
map <PageDown> <Right>

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
