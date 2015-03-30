" Run ":runtime syntax/hitest.vim" to see all current groups
" Run ":runtime syntax/colortest.vim" to see examples of 16 colours
" Visit http://pln.jonas.me/xterm-colors for all 256 colours and similar X ones

highlight Comment term=bold ctermfg=DarkGreen guifg=#00bb00

" #87afff. A bit darker than LightBlue.
highlight helpExample term=reverse ctermfg=111 guifg=SkyBlue2

" #444444. A fair bit darker than DarkGray.
highlight Ignore ctermfg=238 guifg=Grey27

"# :highlight link cComment Question

" Break the link to Identifier
highlight Function term=underline cterm=bold ctermfg=14
"# highlight Identifier term=bold ctermfg=150 guifg=DarkSeaGreen3
highlight Identifier term=bold ctermfg=156 guifg=PaleGreen1
