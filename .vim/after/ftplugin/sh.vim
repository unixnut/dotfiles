setlocal shiftwidth=2
set formatoptions+=or

" == Abbreviations ==
iabbr <buffer> #f <CR># *** FUNCTIONS ***
iabbr <buffer> #m <CR># *** MAINLINE ***
iabbr <buffer> <silent> #h1 # ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> #h2 # ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> #h3 # --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
