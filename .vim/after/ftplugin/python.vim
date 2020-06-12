" per http://www.python.org/dev/peps/pep-0008/
"# setlocal noexpandtab
setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4

" my abbreviations
iabbr <buffer>          __main  if __name__ == "__main__":<C-R>
iabbr <buffer> <silent> _h1     # ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h2     # ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h3     # --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer>          ctor    def __init__(self):
