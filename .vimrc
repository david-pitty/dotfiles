"=========================
"Vim-Plug - Plugin Manager
"=========================
call plug#begin('~/.vim/plugins')
"Plug 'klen/python-mode'
Plug 'scrooloose/syntastic' "syntax highlighting for different languages. Requires: pip install flakes8
Plug 'davidhalter/jedi-vim' "python autocompletion
Plug 'terryma/vim-multiple-cursors' "Ctrl-d in sublime text
Plug 'Raimondi/delimitMate' "addes closing quotes, paren, etc
Plug 'ctrlpvim/ctrlp.vim' "file fuzzy searcher
Plug 'scrooloose/nerdtree' "file tree
Plug 'scrooloose/nerdcommenter' "commenter plugin
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround' "surround test with quotes, paren, etc
Plug 'bling/vim-bufferline' "list buffers on status bar
Plug 'vim-airline/vim-airline' "vim status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab' "auto compleations with tab
Plug 'SearchComplete' "tab completion on search
Plug 'ZoomWin' "on vim buffer splits zoom into one and return to the splits
"Plug 'rking/ag.vim' "silver searcher (like vim grep) Requires: apt-get install silversearcher-ag
Plug 'flazz/vim-colorschemes' "color scheme compilation
Plug 'ScrollColors'
call plug#end()

"=========================
"Configurations
"=========================
syntax enable
set autoindent
set copyindent
set expandtab
set shiftwidth=4
set shiftround
set number
set relativenumber
set cursorline
"set cursorcolumn

"ignore case only if search is in lowercase
set ignorecase
set smartcase

"use plugins and key mappings depending on file type
filetype plugin indent on

"insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

"allow for :e to open new buffer without saving the previous one
set hidden

"highlight searches and double Esc to deselect
set hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<Bar>:echo<CR>

"move python-mode 80 char ruler
autocmd FileType python set colorcolumn=120

"highlight non-ascii character
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=6*

autocmd bufwritepre * :FixWhitespace

"tab space size
set ts=4

"auto source .vimrc after save
autocmd! bufwritepost .vimrc source %

"Save to clipboard
set clipboard=unnamed

"highligth text after 120 characters
match ErrorMsg '\%>120v.\+'

"avoid auto colapse of functions
set foldlevel=99

"force vim-airline to show on single file
set laststatus=2

"============
"Color Scheme
"============
set t_Co=256
set background=dark
"colorscheme zenburn
colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'
"let g:airline_theme='zenburn'

"=====================
"Python Configurations
"=====================
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=120'

"find usage in project
let g:jedi#usages_command = "<leader>f"

"==================
"Keyboard shortcuts
"==================
let mapleader = " "

"Prevent escape from moving the cursor one character to the left
inoremap <silent> <Esc> <Esc>`^

"open and close nerd tree
nnoremap <C-k><C-b> :NERDTreeToggle<CR>

"open and close minibufexplorer
"nnoremap <C-k><C-i> :MBEToggle<CR>

"o without INSERT mode
nnoremap <Leader>O O<Esc>j
nnoremap <Leader>o o<Esc>k

"move across buffers
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>h :bp<CR>

"yank commands
nnoremap yw yiw
nnoremap <S-y> y$

"toggle comment
map <C-S-c> <plug>NERDCommenterToggle

"vertical split
nnoremap <Leader>\| :vert ba<cr>
