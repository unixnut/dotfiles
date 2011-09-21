" help.vim (Vim mode-support auto-parse file) -- extra stuff for help windows

" bind Ctrl-A / X to find the next/previous tag (these are surrounded by bar characters in help files) 
nmap <buffer> <silent> <C-X> :call search('\|[^ 	.)]', "b")<CR>
nmap <buffer> <silent> <C-A> :call search('\|[^ 	.)]', "")<CR>

" remap the section start/end commands to look for the line of equals signs between help file sections
nmap <buffer> <silent> [[ :call search('^====', "b")<CR>
nmap <buffer> <silent> ]] :call search('^====', "")<CR>

