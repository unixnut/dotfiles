" This differs from the default in that the middle lines don't have the extra indent
" Thanks to http://vim.wikia.com/wiki/Disable_automatic_comment_insertion for the //
setlocal comments=s:/*,mb:*,ex:*/,f://,:#

" == Abbreviations ==
iabbr <buffer> <silent> #h1 // ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> #h2 // ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> #h3 // --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>

