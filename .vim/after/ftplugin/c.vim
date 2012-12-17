"# setlocal formatoptions-=c formatoptions-=o formatoptions-=r
setlocal comments-=mb:*
setlocal comments+=m:\ 
"# setlocal comments-=s1:/*
"# setlocal comments+=s2:/*

setlocal shiftwidth=2
setlocal tabstop=2

setlocal iskeyword=@,48-57,_

" normal-mode shortcuts for various build-related commands
"# nmap <buffer> ZC :setlocal makeprg=cc\ -o\ /tmp/moo\ '%'
nmap <buffer> ZC :setlocal makeprg=gcc\ -pedantic\ -o\ /tmp/moo\ '%'

source ~/.vim/include/c_abbrev.vim
