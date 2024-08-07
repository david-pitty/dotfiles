syntax enable
let mapleader = " "
set path+=**
set wildignore+=**/venv/*,**/.git/*,**/obj/*,**/bin/*,**/__pycache__/*,tags

set number relativenumber
set expandtab shiftwidth=4 tabstop=4
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set tags=tags

" Search
set ignorecase smartcase
nnoremap <Leader><Esc> :nohlsearch<CR>
set grepprg=git\ grep\ -n

" UI
set showcmd
set nowrap
set cursorline

" Folds
set foldmethod=indent
set foldlevelstart=99

" TODO: add list characters
set list
nnoremap <Leader>l :set list!<CR>

" File explorer
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
nnoremap <Leader>e :NvimTreeToggle<CR>

nnoremap <Leader>p :find *

" Save
nnoremap <C-s> :w<CR>

" Movement
" change r for substitute
noremap r s
nnoremap R S
" use s for movement instead of l
noremap s l

" Windows
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-w>v :vsplit <BAR> wincmd l<CR>
nnoremap <C-w>s :split <BAR> wincmd j<CR>
" resize
nnoremap <S-Up> :resize +10<CR>
nnoremap <S-Down> :resize -10<CR>
nnoremap + :vertical resize +10<CR>
nnoremap - :vertical resize -10<CR>

" Buffers
nnoremap <Leader>\| :vert ba<cr>
nnoremap <S-Right> :bn<CR>
nnoremap <S-Left> :bp<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>

" Quickfix list
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprevious<CR>

" Tag list
" `Ctrl + ]` navigate to tag
nnoremap <Leader>to :tselect<CR>
nnoremap <Leader>tn :tnext<CR>
nnoremap <Leader>tp :tprevious<CR>

" Navigate code
" all references
nnoremap <Leader>r yiw:vim /\.<C-r>0[^a-z]/ **/*<CR><C-o>:copen<CR>
nnoremap <Leader>R yiw:vim /<C-r>0[^a-z]/ **/*<CR><C-o>:copen<CR>

"Terminal
tnoremap <C-\> <C-\><C-n>
if has('win32')
  set shell=pwsh
endif

" Surround
" TODO: use marks to not lose spot in line after surround function runs
function! Surround()
    let char = nr2char(getchar())
    let char2 = substitute(char, '(', ')', '')
    let char2 = substitute(char2, '[', ']', '')
    let char2 = substitute(char2, '{', '}', '')
    let char2 = substitute(char2, '<', '>', '')
    let sub_cmd = ':s/\%V\(.*\%V.\)/' . char . '\1' . char2
    execute sub_cmd
endfunction
xnoremap <leader>s :<c-u>call Surround()<cr>

function! SurroundLines()
    let char = nr2char(getchar())
    let char2 = substitute(char, '(', ')', '')
    let char2 = substitute(char2, '[', ']', '')
    let char2 = substitute(char2, '{', '}', '')
    let char2 = substitute(char2, '<', '>', '')
    let sub_cmd = ":'<,'>s/\\(.*\\)/" . char . "\\1" . char2
    execute sub_cmd
endfunction
xnoremap <leader>S :<c-u>call SurroundLines()<cr>

" add at the end of the line
xnoremap I :norm I
xnoremap <Leader>A :norm A


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


if has('termguicolors')
      set termguicolors
endif

" let g:gruvbox_material_background = 'medium' "hard
" let g:gruvbox_material_ui_contrast = 'high'
"set background=light
"colorscheme Atelier_ForestLight
"
"colorscheme Atelier_CaveDark
colorscheme vim-material


" avoid freezing the vim process forever, see
" https://github.com/neovim/neovim/issues/6660
if has('win32')
    nmap <C-z> <Nop>
endif

" Refresh nvim config
if !exists('*Refresh')
    function! Refresh()
        source $MYVIMRC
    endfunction
endif
command! Refresh call Refresh()

" Plugins
lua require('plugins')
lua << END
    require'lualine'.setup()
    require'bufferline'.setup()
    require'nvim-tree'.setup()
END

