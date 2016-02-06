"=========================
"Vim-Plug - Plugin Manager
"=========================
call plug#begin('~/.vim/plugins')
Plug 'klen/python-mode'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'ZoomWin'
Plug 'fholgado/minibufexpl.vim'
Plug 'ervandew/ag'
"Plug 'scrooloose/syntastic' "add linters for python, js, angular, html
"Plug 'junegunn/vim-journal'
call plug#end()

"=========================
"Configurations
"=========================
set number
set cursorline 
set ignorecase
syntax enable

"move python-mode 80 char ruler
autocmd FileType python set colorcolumn=120

"highlight non-ascii character
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=6*

"tab space size
set ts=4

"auto source .vimrc after save
autocmd! bufwritepost .vimrc source %

"Save to clipboard
set clipboard=unnamed

"Prevent escape from moving the cursor one character to the left
inoremap <silent> <Esc> <Esc>`^

"highligth text after 120 characters
match ErrorMsg '\%>120v.\+'

set foldlevel=99

"==================
"PyMode Configurations
"==================
let g:pymode_lint_options_pep8 = {'max_line_length': 120}

"turn off rope plugin
"let g:pymode_rope = 0

let g:pymode_rope_goto_definition_bind = "<F12>"

"==================
"Keyboard shortcuts
"==================
map <C-k><C-b> :NERDTreeToggle<CR>


