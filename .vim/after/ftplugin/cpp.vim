source ~/.vim/after/ftplugin/c.vim

if !exists("s:incpath")
  " find the greatest version subdirectory
  let s:incpath = substitute(glob("/usr/include/c++/[0-9].*"), ".*\n", "", "")
endif
" append it to the path option (current buffer only)
let &l:path = &path . ',' . s:incpath

nmap <buffer> ZC :setlocal makeprg=c++\ -pedantic\ -o\ /tmp/moo\ '%'
"# setlocal formatoptions-=c formatoptions-=o formatoptions-=r
