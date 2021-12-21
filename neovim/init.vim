syntax enable
let mapleader = " "

set path+=**

set number relativenumber
set expandtab shiftwidth=4 tabstop=4

" Search
set ignorecase smartcase
nnoremap <C-c> :nohlsearch<CR>

set showcmd
set nowrap
set cursorline

" TODO: add list characters
nnoremap <Leader>l :set list!<CR>

" File explorer
nnoremap <C-E> :Lexplore<CR>
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3

" Windows
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>

" Buffers
nnoremap <Leader>\| :vert ba<cr>
nnoremap <S-Right> :bn<CR>
nnoremap <S-Left> :bp<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>

nnoremap yw yiw
nnoremap <S-y> y$
nnoremap <Leader>O O<Esc>j
nnoremap <Leader>o o<Esc>k

nnoremap <Leader>w :set wrap!<CR>

nnoremap <Leader>n :enew<CR>

nnoremap <Leader>B :windo set scrollbind!<CR>

"suppress visual mode
noremap Q <nop>
