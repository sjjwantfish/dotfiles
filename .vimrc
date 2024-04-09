" options
set number
syntax on
set nocompatible
set showcmd
set shiftwidth=4
set expandtab
set cursorline
set wrap
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

let mapleader=" "

" quit
nnoremap <c-q> <cmd>qall<cr>

" netrw
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
nnoremap <space>e <cmd>:Lex<cr>
nnoremap <space>E <cmd>:E<cr>

" windows
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-j> <C-w>j

" split windows
map <leader>- <cmd>split<cr>
map <leader>\| <cmd>vsplit<cr>

" resize
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" search
map gw *N
