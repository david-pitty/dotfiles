"=========================
"Vim-Plug - Plugin Manager
"=========================
call plug#begin('~/.vim/plugins')
"syntax highlighting for different languages. Requires: pip install flakes8
Plug 'scrooloose/syntastic'
"puppet syntax highlighting
Plug 'rodjek/vim-puppet'
"python autocompletion
Plug 'davidhalter/jedi-vim'
"Ctrl-d in sublime text
Plug 'terryma/vim-multiple-cursors'
"adds closing quotes, parens, etc
Plug 'Raimondi/delimitMate'
"file fuzzy searcher
Plug 'ctrlpvim/ctrlp.vim'
"file tree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
"commenter plugin
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
"surround text with quotes, paren, etc
Plug 'tpope/vim-surround'
"list buffers on status bar
Plug 'bling/vim-bufferline'
"vim status bar
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"auto compleations with tab
Plug 'ervandew/supertab'
"tab completion on search
Plug 'SearchComplete'
"on vim buffer splits zoom into one and return to the splits
Plug 'ZoomWin'
"silver searcher (like vim grep) Requires: apt-get install silversearcher-ag
Plug 'rking/ag.vim'
"color scheme compilation
"Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'noahfrederick/vim-noctu'
"colorschemes scroller
Plug 'ScrollColors'
"should replace the above
"Plugin 'ujihisa/unite-colorscheme'
"Plug 'xolox/vim-easytags'
"Plug 'Shougo/unite.vim'
"presentation plugin
"Plug 'tybenz/vimdeck'
call plug#end()

"=========================
"Configurations
"=========================
syntax enable
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set number
set relativenumber
set nowrap
set cursorline
"set cursorcolumn
set expandtab

"tab completion list on command mode
set wildmenu

"show key strokes on status bar
set showcmd

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
set background=dark
set t_Co=256
colorscheme gruvbox

"colorscheme zenburn
"colorscheme Tomorrow-Night
"colorscheme apprentice
"colorscheme bubblegum
"colorscheme bvemu
"colorscheme blueprint
"colorscheme bensday

"let g:airline_theme='base16'
"let g:airline_theme='tomorrow'
"let g:airline_theme='zenburn'

"=====================
"Python Configurations
"=====================
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=120'

"find usage in project
let g:jedi#usages_command = "<leader>f"

"=========================
"JavaScript Configurations
"=========================
"global installation of jshint required
let g:syntastic_javascript_checkers = ['jshint']

"====================
"CtrlP Configurations
"====================
set wildignore+=*/target/*,*/node_modules/*

"==================
"Keyboard shortcuts
"==================
let mapleader = " "

"Prevent escape from moving the cursor one character to the left
"inoremap <silent> <Esc> <Esc>`^

"open and close nerd tree
nnoremap <C-k><C-b> :NERDTreeToggle<CR>

"o without INSERT mode
nnoremap <Leader>O O<Esc>j
nnoremap <Leader>o o<Esc>k

"move across buffers
nnoremap <Leader>> :bn<CR>
nnoremap <Leader>< :bp<CR>

"yank commands
nnoremap yw yiw
nnoremap <S-y> y$

"toggle comment
map <Leader>c <plug>NERDCommenterToggle

"vertical split
nnoremap <Leader>\| :vert ba<cr>

"add breakpoint for python
nnoremap <Leader>b Oimport pdb; pdb.set_trace()<Esc>j

"save a file
"requires "stty -ixon" on shell profile
"to avoid terminal freeze, C-q unfreezes the terminal
nnoremap <C-S> :w<CR>

"suppress space on normal mode
noremap <Space> <nop>

"CtrlP on buffers
nnoremap <Leader>p :CtrlPBuffer<CR>
