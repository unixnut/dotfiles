source ~/.vim/after/ftplugin/c.vim

if !exists("s:incpath")
  " find the greatest version subdirectory
  let s:incpath = substitute(glob("/usr/include/c++/[0-9].*"), ".*\n", "", "")
endif
" append it to the path option (current buffer only)
let &l:path = &path . ',' . s:incpath

" This differs from the default in that the middle lines don't have the extra indent
" Thanks to http://vim.wikia.com/wiki/Disable_automatic_comment_insertion for the //
setlocal comments=s:/*,mb:*,ex:*/,f://

nmap <buffer> ZC :setlocal makeprg=c++\ -pedantic\ -o\ /tmp/moo\ '%'
