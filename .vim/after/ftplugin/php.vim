" This differs from the default in that the middle lines don't have the extra indent
" Thanks to http://vim.wikia.com/wiki/Disable_automatic_comment_insertion for the //
setlocal comments=s:/*,mb:*,ex:*/,f://,:#

" == Abbreviations ==
iabbr <buffer>          #c      <CR># *** CLASSES ***
iabbr <buffer>          #f      <CR># *** FUNCTIONS ***
iabbr <buffer>          #m      <CR># *** MAINLINE ***
iabbr <buffer> <silent> #i      require_once "";<Left><Left><C-R>=Eatchar('\s')<CR>
iabbr <buffer> <silent> _h1     // ***  ***<Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h2     // ==  ==<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> _h3     // --  --<Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ;;      <?php ; ?><Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ;=      <?=  ?><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ;;b     <?php<CR><CR>?><Home><Up><Tab><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ;;i     <?php if (): ?><Left><Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ;;l     <?php elseif (): ?><Left><Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer>          ;;e     <?php else: ?>
iabbr <buffer>          ;;I     <?php endif; ?>
iabbr <buffer> <silent> ;;w     <?php while (): ?><Left><Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer>          ;;W     <?php endwhile; ?>
iabbr <buffer> <silent> ;;f     <?php for (;;): ?><Left><Left><Left><Left><Left><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer>          ;;F     <?php endfor; ?>
iabbr <buffer>          ///     /*<CR><CR>/<Up>
iabbr <buffer> <silent> def     function ()<CR>{<CR> <BS><CR>}<CR><CR><Up><Up><End><C-O>%<Up><C-Right><C-R>=Eatchar('[\r[:space:]]')<CR>
iabbr <buffer> <silent> ctor    function __construct()<CR>{<CR> <BS><CR>}<CR><CR><Up><Up><Up><End><C-R>=Eatchar('[\r[:space:]]')<CR>
