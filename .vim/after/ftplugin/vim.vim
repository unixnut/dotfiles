" TO-DO: keyword help

" Switch <K> to looking in the Vim help files
setlocal keywordprg=:help

" == Abbreviations ==
iabbr <buffer> <silent> abh     " == Abbreviations ==<F11><CR><F11><C-R>=Eatchar('\r')<CR>
iabbr <buffer> <silent> _h1     " ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h2     " ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h3     " --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> def     func ()<CR> <BS><CR>endfunc<CR><CR><Up><Up><Up><Up><C-Right><C-R>=Eatchar('[\r[:space:]]')<CR>
