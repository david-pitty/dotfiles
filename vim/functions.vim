let s:lineLengthActive = 1
function ToggleLineLength()
    if s:lineLengthActive == 0
        let s:lineLengthActive = 1
        match ErrorMsg '\%>120v.\+'
    else
        let s:lineLengthActive = 0
        call matchdelete(1)
    endif
endfunction

nnoremap <Leader>m :call ToggleLineLength()<CR>
