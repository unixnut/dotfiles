source ~/.vim/after/ftplugin/c.vim

setlocal path+=/usr/include/c++/4.2

nmap <buffer> ZC :setlocal makeprg=c++\ -o\ /tmp/moo\ '%'
"# setlocal formatoptions-=c formatoptions-=o formatoptions-=r
