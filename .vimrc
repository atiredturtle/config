" Plugin section
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim' " Cool statusline 

" Plug 'tpope/vim-sensible' " Some sensible defaults  
Plug 'christoomey/vim-tmux-navigator'  " Allows for tmux Ctrl-? nav from vim windowns

Plug 'JamshedVesuna/vim-markdown-preview' " adds a markdown preview window in browser

Plug 'vimwiki/vimwiki'

Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }

Plug 'airblade/vim-gitgutter' " Adds git gutter

Plug 'morhetz/gruvbox' " Colorscheme

Plug 'scrooloose/nerdtree' " Tree explorer

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sheerun/vim-polyglot' " Language handling

" Plug 'w0rp/ale' " Linter

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Initialize plugins
call plug#end()

"" My settings
" For vimwiki to work
set nocompatible
filetype plugin on

" Other settings
syntax enable	" enable syntax colors

set redrawtime=10000

set path+=src

set relativenumber

set showcmd     " Show last command enterd in very bottom right of vim

set wildmenu    " Visual autocomplete for command menu

set laststatus=2 " Always keep bottom bar open

" Searching
set showmatch   " Highligh matching for [{()}]
set hlsearch    " Highligh matches
set ruler 	" Always show current position

set expandtab   " Use spaces instead of tab

"set smarttab 	" Be smart when using tab

"set ai 		" Auto indent
"set si 		" Smart indent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:gruvbox_contrast_dark = 'hard'
silent colorscheme gruvbox " Set colorscheme 

" Modifies lightline
" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }
 
" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction
 
" Silver searcher plugin
let g:ackprg = 'ag --nogroup --nocolor --column'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Ale settings
" let g:ale_open_list = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
"let g:ale_linters = {
"\ 'javascript': ['flow-language-server'],
"\}

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR><CR>

" Shortcut to open fzf file fuzzy finder
let mapleader = " "
nnoremap <silent> <leader><Space> :GFiles<CR>

" Cursor shapes on different modes 
if exists('$TMUX') " for tmux
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

" Vim markdown settings
"" let vim_markdown_preview_temp_file=1 " remove rendered html after 
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1 " Uses Grip (Github flavoured markdown)
"" let vim_markdown_preview_toggle=2 " auto render
 

" vimwiki/vimwiki settings
let wiki_1 = {}
let wiki_1.path = '~/repos/personal.wiki'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1] " can add multiple wikis 
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Nerd tree shortcut
function! NerdTreeToggle()
        " If nerdtree open, then close it
        " if exists("g:NERDTree") && g:NERDTree.IsOpen()
        if IsNerdTreeEnabled()
                execute ":NERDTreeToggle"
                " close  
        " Otherwise open up to current file
        else
                execute ":NERDTreeFind"
        endif
endfunction

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let NERDTreeHijackNetrw=1
map <C-\> :call NerdTreeToggle()<CR>
