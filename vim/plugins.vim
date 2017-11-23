"=========================
"Vim-Plug - Plugin Manager
"=========================
call plug#begin('~/.vim/plugins')
"syntax highlighting for different languages. Requires: pip install flakes8
Plug 'scrooloose/syntastic'
"language pack colletion
"Plug 'sheerun/vim-polyglot'
"puppet syntax highlighting
Plug 'rodjek/vim-puppet'
"log syntax highlighting
Plug 'dzeban/vim-log-syntax'
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
"on vim buffer splits zoom into one and return to the splits
"Plug 'vim-scripts/ZoomWin'
"silver searcher (like vim grep) Requires: apt-get install silversearcher-ag
"Plug 'rking/ag.vim'
"color scheme compilation
"Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'noahfrederick/vim-noctu'
Plug 'joshdick/onedark.vim'
"colorschemes scroller
Plug 'vim-scripts/ScrollColors'
"should replace the above
"Plugin 'ujihisa/unite-colorscheme'
"Plug 'xolox/vim-easytags'
"Plug 'Shougo/unite.vim'
"presentation plugin
"Plug 'tybenz/vimdeck'
call plug#end()

