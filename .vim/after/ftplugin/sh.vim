setlocal shiftwidth=2
set formatoptions+=or

" == Abbreviations ==
iabbr <buffer>          #f      <CR># *** FUNCTIONS ***
iabbr <buffer>          #m      <CR># *** MAINLINE ***
iabbr <buffer> <silent> _h1     # ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h2     # ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h3     # --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> def     ()<CR>{<CR> <BS><CR>}<CR><CR><C-O>[[<Up><C-R>=Eatchar('[\r[:space:]]')<CR>
