" .vimrc (vim auto-parse file) -- commands that vim runs at startup
" v2.0

"# version 4.0          " avoid warning for wrong version

" *** Mappings ***
" == Fixes ==
" don't make it easy to quit without checking for changes
nmap ZQ \

" == Random ==
map Q gq
imap <C-Z> <C-O><C-Z>
imap <C-L> <C-O><C-L>
nmap g/ :nohlsearch<CR>

" Make the Do key bring up the ex command prompt:
map <F10> :
imap <F10> <C-O>:

nmap <Esc><C-Z> <C-Z>

" == Command shortcut keys ==
" (note: <C-F1> doesn't work in gnome-terminal!)
" <C-F1> through to <C-F4> (and <S-F1> through to <S-F4>)
" don't work in vim.  This was tried but doesn't work:
"# cmap <Esc>O1;2S <S-F4>

" -- list all buffers --
" <C-F2>
imap <Esc>O1;5Q <C-O>:ls<CR>
nmap <Esc>O1;5Q :ls<CR>

" -- previous buffer --
nmap [b :bprevious<CR>
imap <F1> <C-O>:bprevious<CR>
nmap <F1> :bprevious<CR>
" <S-F1> splits the window
if $TERM == 'linux'
  imap <Esc>[25~ <C-O>:sbprevious<CR>
  nmap <Esc>[25~ :sbprevious<CR>
else
  imap <Esc>O1;2P <C-O>:sbprevious<CR>
  nmap <Esc>O1;2P :sbprevious<CR>
  " (PuTTY)
  imap <Esc>[23~ <C-O>:sbprevious<CR>
  map <Esc>[23~ :sbprevious<CR>
endif
" -- next buffer --
nmap ]b :bnext<CR>
imap <F2> <C-O>:bnext<CR>
nmap <F2> :bnext<CR>
" <S-F2> splits the window
if $TERM == 'linux'
  imap <Esc>[26~ <C-O>:sbnext<CR>
  nmap <Esc>[26~ :sbnext<CR>
else
  imap <Esc>O1;2Q <C-O>:sbnext<CR>
  nmap <Esc>O1;2Q :sbnext<CR>
  " (PuTTY)
  imap <Esc>[24~ <C-O>:sbnext<CR>
  map <Esc>[24~ :sbnext<CR>
endif

" -- window switching --
imap <F3> <C-O><C-W>k
imap <F4> <C-O><C-W>j
map <F3> <C-W>k
map <F4> <C-W>j

" -- window resizing --
" <S-F3>
if $TERM == 'linux'
  imap <Esc>[28~ <C-O><C-W>-
  map <Esc>[28~ <C-W>-
else
  imap <Esc>O1;2R <C-O><C-W>-
  map <Esc>O1;2R <C-W>-
  " (PuTTY)
  imap <Esc>[25~ <C-O><C-W>-
  map <Esc>[25~ <C-W>-
endif

" <S-F4>
if $TERM == 'linux'
  imap <Esc>[29~ <C-O><C-W>+
  map <Esc>[29~ <C-W>+
else
  imap <Esc>O1;2S <C-O><C-W>+
  map <Esc>O1;2S <C-W>+
  " (PuTTY)
  imap <Esc>[26~ <C-O><C-W>+
  map <Esc>[26~ <C-W>+
endif

" -- window closing --
" <C-F3>
imap <Esc>O1;5R <C-O><C-W>o
map <Esc>O1;5R <C-W>o
" (PuTTY)
imap <Esc>[13~ <C-O><C-W>o
map <Esc>[13~ <C-W>o

" <C-F4>
imap <Esc>O1;5S <C-O><C-W>c
map <Esc>O1;5S <C-W>c
" (PuTTY)
imap <Esc>[14~ <C-O><C-W>c
map <Esc>[14~ <C-W>c

" -- file operations --
nmap ZE :edit<CR>
nmap ZW :write<CR>
nmap ZN :wnext<CR>

" QuickFix commands (mostly error-jumps)
nmap ]e :cnext<CR>
nmap <F7> :cnext<CR>
nmap ]E :cnfile<CR>
if $TERM == 'linux'
  nmap map <Esc>[33~ :cnfile<CR>
else
  nmap map <S-F7> :cnfile<CR>
endif

nmap [e :cprevious<CR>
nmap <F6> :cprevious<CR>
nmap [E :cpfile<CR>
nmap <S-F6> :cpfile<CR>

" -- toggles --
imap <F8> <C-O>:set wrap!<CR>
map <F8> :set wrap!<CR>
if $TERM == 'linux'
  imap <Esc>[34~ <C-O>:setlocal spell!<CR>
  map <Esc>[34~ :setlocal spell!<CR>
else
  imap <S-F8> <C-O>:setlocal spell!<CR>
  map <S-F8> :setlocal spell!<CR>
endif
imap <C-F8> <C-O>:set ignorecase!<CR>
map <C-F8> :set ignorecase!<CR>
imap <C-S-F8> <C-O>:set hlsearch!<CR>
map <C-S-F8> :set hlsearch!<CR>

" -- other --
" normal-mode shortcuts for various build-related commands
nmap ZM :make<CR>
nmap <F9> :make<CR>
nmap <C-F9> ZC


" == customisations ==
imap <C-B> <C-O>0
imap <C-E> <C-O>$
imap <C-D> <Del>
" Alt-d deletes next word:
imap <M-d> <Space><Right><S-Right><C-W><BS>
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
nmap gr }?^>\ *.<CR>?^>\ *$<CR>?^>\ *.<CR>jc}<CR>
nmap gR }c?^>\ -- $?<CR><C-U><C-U><CR>
nmap gz v/^-- <CR>dzbO<CR><CR><Up>

" Useful searching commands:
map <F5> /
imap <F5> <C-O>/
if $TERM == 'linux'
  map <Esc>[31~ ?
  imap <Esc>[31~ <C-O>?
else
  map <S-F5> ?
  imap <S-F5> <C-O>?
endif
map <C-F5> n
imap <C-F5> <C-O>n
map <C-S-F5> N
imap <C-S-F5> <C-O>N
map  /[^][{};:'",.<>/?a-zA-Z!@#$%^&*()_+\|0-9\\\-=`~ 	]<CR>

" -- GUI commands --
" open a new tab
map g<C-T> :tabe<CR>


" *** Features ***
"# let mysyntaxfile = "~/.vim/mysyntax.vim"   " my customised syntax highlights
if has("syntax")
  syntax enable
  if exists(":filetype")
    filetype plugin on
    filetype indent on
    let g:filetype_i = "c"
    let g:filetype_inc = "php"
  endif
endif

if has("spell")
  set spelllang=en_au
endif

" == diff ==
map <C-F7> ]c
map <C-F6> [c


" *** Settings ***
set formatprg=
set nobackup         " don't keep a backup file
"# set viminfo=""

set nowrap sidescroll=1
set ruler hidden laststatus=2 showcmd
"# set confirm   " unknown in Vim 5.0

set shortmess="il"

set selection=exclusive   " unknown in Vim 5.0; used to work in ???; back in 6.x

set nohlsearch

"# set mouse=a
set mouse=""
set mousetime=180

" -- editing --
set bs=2             " allow backspacing over everything in insert mode
set ai               " always set autoindenting on

set textwidth=0

set expandtab
"# set tabstop=2
set shiftwidth=1

set pastetoggle=<F11>
" <C-F11> doesn't exist due to the above
" <S-F9> and above don't exist when $TERM == 'linux'
map <S-F11> :set textwidth=
imap <S-F11> <C-O>:set textwidth=
map <C-S-F11> :set textwidth=0<CR>
imap <C-S-F11> <C-O>:set textwidth=0<CR>
imap <F12> <C-O>:set expandtab!<CR>
map <F12> :set expandtab!<CR>
imap <C-F12> <C-O>:set autoindent!<CR>
map <C-F12> :set autoindent!<CR>
imap <S-F12> <C-O>:set readonly!<CR>
map <S-F12> :set readonly!<CR>

" -- contextual --
set iskeyword=-,@,48-57,_,192-255
" remove "=" from the list of filename characters
set isfname-==

" -- file --
"# set formatoptions-=c formatoptions-=o formatoptions-=r
set modeline

set fileformats=unix,dos,mac


" when called explicitly, changelog.vim sets \o as a mapping to open a
" pre-existing ChangeLog file in the current directory
runtime ftplugin/changelog.vim

" -- screen --
" change the terminfo settings vim uses for the number of colours and setting
" the foreground/background
"# set t_Co=8
"# set t_Sf=<Esc>[3%dm
"# set t_Sb=<Esc>[4%dm
set background=dark

highlight Comment term=bold ctermfg=2 guifg=#00bb00

" -- other --
set titleold=Terminal


" *** Misc ***
" -- digraphs --
if has("digraphs")
  digraphs a` 224
endif


" *** Extensibility ***
if exists("*filereadable") && exists("$ZONE")
  " source the zone-specific rc file, if it exists
  let s:zone_rc_file = $HOME . "/.init/Zones/" . $ZONE . "/vimrc"
  if filereadable(s:zone_rc_file)
    execute "source" s:zone_rc_file
  endif
endif
