"python autocompletion
Plug 'davidhalter/jedi-vim'

autocmd VimEnter * call SetupPython()
function SetupPython()
    "=====================
    "Syntastic Configurations
    "=====================
    "let g:syntastic_python_checkers = ['flake8']
    "let g:syntastic_python_flake8_args='--max-line-length=120'

    "find usage in project
    let g:jedi#usages_command = "<leader>f"

    "move python-mode 80 char ruler
    autocmd FileType python set colorcolumn=120

    "add breakpoint for python
    nnoremap <Leader>b Oimport pdb; pdb.set_trace()<Esc>j
endfunction
