" Remove arrow key functionality    
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Indentation shortcuts
vnoremap > >gv
vnoremap < <gv

" Buffer next and previous shortcuts
:nnoremap <A-k> :bnext<CR>
:nnoremap <A-j> :bprevious<CR>

" Ctrl Shit t for open last tab
nmap <c-s-t> :vs<bar>:b#<CR>

