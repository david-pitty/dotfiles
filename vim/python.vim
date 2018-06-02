"=========================
"Vim-Plug - Plugin Manager
"=========================
"python autocompletion
Plug 'davidhalter/jedi-vim'

"move python-mode 80 char ruler
autocmd FileType python set colorcolumn=120

"=====================
"Syntastic Configurations
"=====================
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args='--max-line-length=120'

"find usage in project
let g:jedi#usages_command = "<leader>f"

"==================
"Keyboard shortcuts
"==================
"add breakpoint for python
nnoremap <Leader>b Oimport pdb; pdb.set_trace()<Esc>j

