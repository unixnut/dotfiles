" .vimrc (vim auto-parse file) -- commands that vim runs at startup
" v1.0

"# version 4.0          " avoid warning for wrong version

" *** Mappings ***
" == Fixes ==
" don't make it easy to quit without checking for changes
map ZQ \

" == Random ==
map Q gq
imap  
imap  
map g/ :nohlsearch

" Make the Do key bring up the ex command prompt:
map <F10> :
map! <F10> :

" == Command shortcut keys ==
map! <F1> :bprevious
map! <F2> :bnext
map <F1> :bprevious
map <F2> :bnext
map [b :bprevious
map ]b :bnext

map! <F3> k
map! <F4> j
map <F3> k
map <F4> j

" file operations
map ZE :edit
map ZW :write
map ZN :wnext

" QuickFix commands (mostly error-jumps)
map ]e :cnext
map ]E :cnfile
map [e :cprevious
map [E :cpfile

" -- other --
" normal-mode shortcuts for various build-related commands
nmap ZM :make


" == customisations ==
imap  0
imap  $
imap  <Del>
" Alt-d deletes next word:
imap <M-d> <Space><Right><S-Right><BS>
" Ctrl-Left (Alt-b) & Ctrl-Right (Alt-f) go to previous/next word respectively:
imap <M-b> <S-Left>
imap <M-f> <S-Right>
cmap <M-b> <S-Left>
cmap <M-f> <S-Right>
map <M-b> B
map <M-f> W

map <Space> <PageDown>

" == other ==
" Commands to delete a quoted message's signature and go into insert mode:
map gr }?^>\ *.?^>\ *$?^>\ *.jc}
map gR }c?^>\ -- $?
map gz v/^-- dzbO<Up>

" Useful searching commands:
map  /[^][{};:'",.<>/?a-zA-Z!@#$%^&*()_+\|0-9\\\-=`~ 	]


" *** Features ***
"# let mysyntaxfile = "~/.vim/mysyntax.vim"   " my customised syntax highlights
if has("syntax")
  syntax enable
endif
filetype plugin on
filetype indent on


" *** Settings ***
set formatprg=
set nobackup         " don't keep a backup file
"# set viminfo=""

set nowrap sidescroll=1
set ruler hidden laststatus=2 showcmd
"# set confirm   " unknown in Vim 5.0

set shortmess="il"

set selection=exclusive   " unknown in Vim 5.0; used to work in ???; back in 6.x

"# set mouse=a
set mouse=""
set mousetime=180

" -- editing --
set bs=2             " allow backspacing over everything in insert mode
set ai               " always set autoindenting on

set textwidth=0

set expandtab
set tabstop=8
set shiftwidth=1

set pastetoggle=<f11>

" -- contextual --
set iskeyword=-,@,48-57,_,192-255
" remove "=" from the list of filename characters
set isfname-==

" -- file --
"# set formatoptions-=c formatoptions-=o formatoptions-=r
set modeline

set fileformats=unix,dos,mac

let g:filetype_i = "c"
let g:filetype_inc = "php"

" when called explicitly, changelog.vim sets \o as a mapping to open a
" pre-existing ChangeLog file in the current directory
runtime ftplugin/changelog.vim

" -- screen --
" change the terminfo settings vim uses for the number of colours and setting
" the foreground/background
"# set t_Co=8
"# set t_Sf=[3%dm
"# set t_Sb=[4%dm
set background=dark

" enable saving and restoring of the screen:
"# set t_ti=7[r[?47h t_te=[?47l9

" -- other --


" *** Misc ***
" -- digraphs --
if has("digraphs")
  digraphs a` 224
endif

