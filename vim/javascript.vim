"TS syntax highlighting
Plug 'leafgarland/typescript-vim'
"TS omni-completion + nav to symbol
Plug 'quramy/tsuquyomi'
"TS indentation
Plug 'jason0x43/vim-js-indent'

"=========================
"Syntastic Configurations
"=========================
"global installation of jshint required
"let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']


let g:typescript_indent_disable = 1




autocmd FileType typescript set shiftwidth=2 ts=2
