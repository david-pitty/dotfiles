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
nnoremap <S-Right> :bn<CR>
nnoremap <S-Left> :bp<CR>

"close buffer
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>

"close all windows
nnoremap <Leader>q :qa<CR>

"yank commands
nnoremap yw yiw
nnoremap <S-y> y$

"toggle comment
map <Leader>c <plug>NERDCommenterToggle

"CtrlP on buffers
nnoremap <Leader>b :CtrlPBuffer<CR>

"vertical split
nnoremap <Leader>\| :vert ba<cr>

"save a file
"requires "stty -ixon" on shell profile
"to avoid terminal freeze, C-q unfreezes the terminal
nnoremap <C-S> :w<CR>

"suppress space on normal mode
noremap <Space> <nop>

"suppress visual mode
noremap Q <nop>

"navigate through windows with Ctrl
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Left> :wincmd h<CR>

"toggle paste mode
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>P :set paste<CR>P:set nopaste<CR>

"toggle wrap
nnoremap <Leader>w :set wrap!<CR>

"new buffer
nnoremap <Leader>n :enew<CR>

"resize windows
nnoremap <S-C-Up> :resize +5<CR>
nnoremap <S-C-Down> :resize -5<CR>
nnoremap <S-C-Right> :vert resize +5<CR>
nnoremap <S-C-Left> :vert resize -5<CR>
