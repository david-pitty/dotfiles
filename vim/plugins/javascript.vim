"TS syntax highlighting
Plug 'leafgarland/typescript-vim'
"TS omni-completion + nav to symbol
Plug 'quramy/tsuquyomi'
"TS indentation
Plug 'jason0x43/vim-js-indent'

autocmd VimEnter * call SetupJs()
function SetupJs()
    "global installation of jshint required
    "let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']

    "allow vim-js-indent to do the indenting
    let g:typescript_indent_disable = 1
endfunction

autocmd FileType typescript setlocal shiftwidth=2 ts=2
