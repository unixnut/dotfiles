"# setlocal formatoptions-=c formatoptions-=o formatoptions-=r
" This differs from the default in that the middle lines don't have the extra indent
setlocal comments=s:/*,mb:*,ex:*/

setlocal shiftwidth=2
setlocal tabstop=2

setlocal iskeyword=@,48-57,_

" normal-mode shortcuts for various build-related commands
"# nmap <buffer> ZC :setlocal makeprg=cc\ -o\ /tmp/moo\ '%'
nmap <buffer> ZC :setlocal makeprg=gcc\ -pedantic\ -o\ /tmp/moo\ '%'

source ~/.vim/include/c_abbrev.vim
