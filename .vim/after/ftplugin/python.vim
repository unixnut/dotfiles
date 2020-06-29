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
iabbr <buffer> <silent> _c      logger.critical("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbr <buffer> <silent> _e      logger.error("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbr <buffer> <silent> _w      logger.warning("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbr <buffer> <silent> _i      logger.info("")<Left><Left><C-R>=Eatchar('\s')<CR>
iabbr <buffer> <silent> _d      logger.debug("")<Left><Left><C-R>=Eatchar('\s')<CR>
