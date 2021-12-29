syntax enable
let mapleader = " "
set path+=**

set number relativenumber
set expandtab shiftwidth=4 tabstop=4
" filetype plugin indent on

" Search
set ignorecase smartcase
nnoremap <Leader><Esc> :nohlsearch<CR>

set showcmd
set nowrap
set cursorline

" TODO: add list characters
set list
nnoremap <Leader>l :set list!<CR>

" File explorer
nnoremap <Leader>e :Lexplore<CR>
let g:netrw_banner=0
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

" reselect after indenting
vnoremap < <gv
vnoremap > >gv

" Plugins
lua require('plugins')
lua << END
    require'lualine'.setup()
    require'bufferline'.setup()
END

if has('termguicolors')
      set termguicolors
endif

let g:gruvbox_material_background = 'medium' "hard
let g:gruvbox_material_ui_contrast = 'high'
colorscheme gruvbox-material


" avoid freezing the vim process forever, see
" https://github.com/neovim/neovim/issues/6660
if has('win32')
    nmap <C-z> <Nop>
endif
