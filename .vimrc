"=========================
"Vim-Plug - Plugin Manager
"=========================
call plug#begin('~/.vim/plugins')
Plug 'klen/python-mode'
Plug 'terryma/vim-multiple-cursors' "Ctrl-d in sublime text
Plug 'Raimondi/delimitMate' "addes closing quotes, paren, etc
Plug 'ctrlpvim/ctrlp.vim' "file fuzzy searcher
Plug 'scrooloose/nerdtree' "file tree
Plug 'scrooloose/nerdcommenter' "commenter plugin
Plug 'tpope/vim-surround' "surround test with quotes, paren, etc
Plug 'bling/vim-airline' "vim status bar
Plug 'ervandew/supertab' "auto compleations with tab
Plug 'ZoomWin' "on vim buffer splits zoom into one and return to the splits
"Plug 'fholgado/minibufexpl.vim' "list buffers
"Plug 'ervandew/ag' "silver searcher (like vim grep) 
Plug 'flazz/vim-colorschemes' "color scheme compilation
Plug 'ScrollColors'
"Plug 'scrooloose/syntastic' "syntax highlighting for different languages
"Plug 'junegunn/vim-journal' "for note taking
call plug#end()

"=========================
"Configurations
"=========================
syntax enable
set number
set cursorline 
set ignorecase
set hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<Bar>:echo<CR>

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

"highligth text after 120 characters
match ErrorMsg '\%>120v.\+'

set foldlevel=99

"=========================
"Color Scheme
"=========================
set t_Co=256
set background=dark
colorscheme zenburn
"colorscheme Tomorrow-Night

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
let mapleader = ","

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
nnoremap <Leader>m :bn<CR>
nnoremap <Leader>n :bp<CR>

"yank commands
nnoremap yw yiw
nnoremap <S-y> y$
