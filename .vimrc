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
nmap <silent> g/ :nohlsearch<CR>
" not useful
"# nmap <silent> g<C-L> :redrawstatus<CR>

" Make the Do key bring up the ex command prompt:
map  <F10> :
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
nmap <silent> [b :bprevious<CR>
imap <silent> <F1> <C-O>:bprevious<CR>
nmap <silent> <F1> :bprevious<CR>
" <S-F1> splits the window
if $TERM == 'linux'
  imap <silent> <Esc>[25~ <C-O>:sbprevious<CR>
  nmap <silent> <Esc>[25~ :sbprevious<CR>
elseif $TERM == 'putty'
  imap <silent> <Esc>[23~ <C-O>:sbprevious<CR>
  map <silent>  <Esc>[23~ :sbprevious<CR>
else
  imap <silent> <Esc>O1;2P <C-O>:sbprevious<CR>
  nmap <silent> <Esc>O1;2P :sbprevious<CR>
endif
" -- next buffer --
nmap <silent> ]b :bnext<CR>
imap <silent> <F2> <C-O>:bnext<CR>
nmap <silent> <F2> :bnext<CR>
" <S-F2> splits the window
if $TERM == 'linux'
  imap <silent> <Esc>[26~ <C-O>:sbnext<CR>
  nmap <silent> <Esc>[26~ :sbnext<CR>
elseif $TERM == 'putty'
  imap <silent> <Esc>[24~ <C-O>:sbnext<CR>
  map <silent>  <Esc>[24~ :sbnext<CR>
else
  imap <silent> <Esc>O1;2Q <C-O>:sbnext<CR>
  nmap <silent> <Esc>O1;2Q :sbnext<CR>
endif

" -- window switching --
imap <F3> <C-O><C-W>k
imap <F4> <C-O><C-W>j
map  <F3> <C-W>k
map  <F4> <C-W>j

" -- window resizing --
" <S-F3>
if $TERM == 'linux'
  imap <Esc>[28~ <C-O><C-W>-
  map  <Esc>[28~ <C-W>-
elseif $TERM == 'putty'
  imap <Esc>[25~ <C-O><C-W>-
  map  <Esc>[25~ <C-W>-
else
  imap <Esc>O1;2R <C-O><C-W>-
  map  <Esc>O1;2R <C-W>-
endif

" <S-F4>
if $TERM == 'linux'
  imap <Esc>[29~ <C-O><C-W>+
  map  <Esc>[29~ <C-W>+
elseif $TERM == 'putty'
  imap <Esc>[26~ <C-O><C-W>+
  map  <Esc>[26~ <C-W>+
else
  imap <Esc>O1;2S <C-O><C-W>+
  map <Esc>O1;2S <C-W>+
endif

" -- window closing --
" <C-F3> -- close all other windows
imap <Esc>O1;5R <C-O><C-W>o
map  <Esc>O1;5R <C-W>o
" (PuTTY has no key code)

" <C-F4> -- close this window
imap <Esc>O1;5S <C-O><C-W>c
map  <Esc>O1;5S <C-W>c
" (PuTTY has no key code)

" <C-S-F4>
imap <Esc>O1;6S <C-O>:bunload<CR>
nmap <Esc>O1;6S :bunload<CR>

" -- file operations --
nmap <silent> ZE :edit<CR>
nmap <silent> ZW :write<CR>
nmap ZN :wnext<CR>

" QuickFix commands (mostly error-jumps)
nmap [e :cprevious<CR>
nmap <F6> :cprevious<CR>
imap <F6> <C-O>:cprevious<CR>
nmap [E :cpfile<CR>
nmap <C-S-F6> :cpfile<CR>

nmap ]e :cnext<CR>
nmap <F7> :cnext<CR>
imap <F7> <C-O>:cnext<CR>
nmap ]E :cnfile<CR>
nmap <C-S-F7> :cnfile<CR>

" -- tab switching --
nmap <M-PageUp>   gT
nmap <M-PageDown> gt
imap <M-PageDown> <C-O>gt
imap <M-PageUp>   <C-O>gT

" -- toggles --
imap <silent> <F8> <C-O>:set wrap!<CR>
nmap <silent> <F8> :set wrap!<CR>

if $TERM == 'linux'
  imap <Esc>[34~ <C-O>:setlocal spell!<CR>
  nmap <Esc>[34~ :setlocal spell!<CR>
else
  imap <S-F8> <C-O>:setlocal spell!<CR>
  nmap <S-F8> :setlocal spell!<CR>
endif

imap <C-F8> <C-O>:set ignorecase!<CR>
nmap <C-F8> :set ignorecase!<CR>
imap <C-S-F8> <C-O>:set hlsearch!<CR>
nmap <C-S-F8> :set hlsearch!<CR>

imap <silent> <S-F10> <C-O>:set number!<CR>
nmap <silent> <S-F10> :set number!<CR>

imap <silent> <C-F10> <C-O>:if &diff \| :diffoff \| :else \| :diffthis \| :endif<CR>
nmap <silent> <C-F10> :if &diff \| :diffoff \| :else \| :diffthis \| :endif<CR>

" -- Explore --
nmap <silent> <C-W>e :Sexplore<CR>
nmap <silent> <C-W>E :Texplore<CR>
nmap <silent> g<C-O> :Rexplore<CR>


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
map  <M-b> B
map  <M-f> W

map  <Space> <PageDown>

" == Strings ==
" Note that this makes a delay before the regular Ctrl-X options show up
"# imap <C-X>% <C-R>=expand("%:t")<CR>
inoremap <expr> <C-X>% expand("%:t")

" Does the same as the default ^D
" an argument could be made for using &tabstop here
inoremap <expr> <S-Tab> repeat("\<BS>", &shiftwidth)


" == other ==
" Commands to delete a quoted message's signature and go into insert mode:
nmap gr }?^>\ *.<CR>?^>\ *$<CR>?^>\ *.<CR>jc}<CR>
nmap gR }c?^>\ -- $?<CR><C-U><C-U><CR>
nmap gz v/^-- <CR>dzbO<CR><CR><Up>

" Like o or O, but suppresses auto commend insertion
" Too complicated to impolement, because:-
"   1) :normal dumps out of insert mode at completion, which is forced
"   2) indent from 'autoindent' is virtual and is cleared when leaving insert mode
"   3) would need to calculate indent for a new line from the previous line
"   4) have to honour 'smartindent' or 'cindent' (overrides 3)
"# nmap <silent> go :let saved_fo=&formatoptions \| setlocal formatoptions-=o\|:normal o<C-O>:exe "setlocal formatoptions=" . saved_fo<CR>

" -- Useful searching commands --
map  <F5> /
imap <F5> <C-O>/
if $TERM == 'linux'
  map  <Esc>[31~ ?
  imap <Esc>[31~ <C-O>?
else
  map  <S-F5> ?
  imap <S-F5> <C-O>?
endif
map  <C-F5> n
imap <C-F5> <C-O>n
map  <C-S-F5> N
imap <C-S-F5> <C-O>N
" search for non-printing characters [Ctrl-/ (or ^_, i.e. Ctrl-shift--)]
nmap  /[^][{};:'",.<>/?a-zA-Z!@#$%^&*()_+\|0-9\\\-=`~ 	]<CR>
" search for whitespace at EOL [Ctrl-space (or ^@, i.e. Ctrl-shift-2)]
" FIXME: no match returns 0, which goes to EOF
nmap <expr> <Nul> search('[ \t]$') . "G"

" -- GUI commands --
" open a new tab
nmap g<C-T> :tabedit<CR>
" C-S-F2: list tabs & buffers
nmap <Esc>O1;6Q :tabs<CR>
nmap <C-S-F2> :tabs<CR>
nmap <Esc>1 1gt
nmap <Esc>2 2gt
nmap <Esc>3 3gt
nmap <Esc>4 4gt
nmap <Esc>5 5gt
nmap <Esc>6 6gt
nmap <Esc>7 7gt
nmap <Esc>8 8gt
nmap <Esc>9 9gt
nmap <Esc>0 10gt

if exists("*function")
  " can't use <expr> because that can't handle a count
  " have to use the <C-U> to avoid passing the count to :call
  nmap <silent> g<Tab> :<C-U>call JumpBetweenTabs(v:count)<CR>

  let g:previous_tab = 1
  " When no count is supplied, switch to the previous tab where this function
  " was called.  When a count is supplied, act like "gt".
  " (Note that "gt" effectively forgets the current tab, so afterwards, this
  " function without a count will go back to the previous-previous tab.)
  function! JumpBetweenTabs(count)
    if a:count > 0
      let g:previous_tab = tabpagenr()
      exe ":tabn" a:count
    else
      " have to figure things out first, because :exe must happen last
      let l:new_tab = g:previous_tab
      let g:previous_tab = tabpagenr()
      exe ":tabn" l:new_tab
    endif
  endfunction
endif


" *** Features ***
if has("syntax")
  " -- settings --
  set background=dark

  if exists(":filetype")
    filetype plugin indent on
    let g:filetype_i = "c"
    let g:filetype_inc = "php"
  endif

  " -- activation --
  syntax enable

  " -- customisation --
  "# let mysyntaxfile = "~/.vim/mysyntax.vim"   " my customised syntax highlights
  " See .vim/colors/mine.vim
  colorscheme mine
endif

" when called explicitly, changelog.vim sets \o as a mapping to open a
" pre-existing ChangeLog file in the current directory
runtime ftplugin/changelog.vim

if has("spell")
  set spelllang=en_au
endif

" == diff ==
map  <C-F6> [c
imap <C-F6> <C-O>[c
map  <C-F7> ]c
imap <C-F7> <C-O>]c

" == spell ==
if $TERM == 'linux'
  map  <Esc>[32~ <C-O>[s
  map  <Esc>[32~ [s
  map  <Esc>[33~ <C-O>]s
  map  <Esc>[33~ ]s
else
  imap <S-F6> <C-O>[s
  map  <S-F6> [s
  imap <S-F7> <C-O>]s
  map  <S-F7> ]s
endif


" *** Functions and commands to use them ***
if exists("*function")
  " :Rename
  runtime include/rename4.vim
  " :BDE
  runtime include/bde.vim
endif


" *** Settings ***
set formatprg=
set nobackup         " don't keep a backup file
"# set viminfo=

set nowrap sidescroll=1
set ruler hidden laststatus=2 showcmd
"# set confirm   " unknown in Vim 5.0
set foldclose=             " Automatic foldclosing is irritating too

set shortmess=filtoOrmw

set selection=exclusive   " unknown in Vim 5.0; used to work in ???; back in 6.x

set nohlsearch
set smartcase    " Override the 'ignorecase' option if the search pattern contains upper case characters

"# set mouse=a
set mouse=
set mousemodel=popup_setpos
set mousetime=180

" -- editing --
set bs=2             " allow backspacing over everything in insert mode
set ai               " always set autoindenting on

set textwidth=0

set expandtab
"# set tabstop=2
set shiftwidth=1
set showfulltag
"# set smartindent

set pastetoggle=<F11>
" <C-F11> doesn't exist due to the above
" <S-F9> and above don't exist when $TERM == 'linux'
nmap <S-F11> :set textwidth=
imap <S-F11> <C-O>:set textwidth=
nmap <C-S-F11> :set textwidth=0<CR>
imap <C-S-F11> <C-O>:set textwidth=0<CR>
imap <F12> <C-O>:set expandtab!<CR>
nmap <F12> :set expandtab!<CR>
imap <C-F12> <C-O>:set autoindent!<CR>
nmap <C-F12> :set autoindent!<CR>
imap <silent> <S-F12> <C-O>:set readonly!<CR>
nmap <silent> <S-F12> :set readonly!<CR>
if exists("*function")
  nmap <C-S-F12> :call Mousetoggle()<CR>
  imap <C-S-F12> <C-O>:call Mousetoggle()<CR>
  function! Mousetoggle()
    if &mouse == ""
      set mouse=a
    else
      set mouse=
    endif
  endfunction
endif

" -- contextual --
set iskeyword=-,@,48-57,_,192-255
" remove "=" from the list of filename characters
set isfname-==

" -- file --
"# set formatoptions-=c formatoptions-=o formatoptions-=r
set modeline

set fileformats=unix,dos,mac

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
