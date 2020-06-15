" .vimrc (vim auto-parse file) -- commands that vim runs at startup
" v2.0

"# version 4.0          " avoid warning for wrong version

" *** Mappings ***
" == Fixes ==
" don't make it easy to quit without checking for changes
nmap ZQ <nop>

" == Random ==
map Q gq
imap <C-Z> <C-O><C-Z>
imap <C-L> <C-O><C-L>
nmap <silent> g/ :nohlsearch<CR>
vmap <silent> g/ :<C-U>nohlsearch<CR>gv
" not useful
"# nmap <silent> g<C-L> :redrawstatus<CR>

" Make the Do key bring up the ex command prompt:
nmap <F10> :
vmap <F10> :
imap <F10> <C-O>:

nmap <Esc><C-Z> <C-Z>
vmap <Esc><C-Z> <C-Z>


" == Command shortcut keys ==
" (note: <C-F1> doesn't work in gnome-terminal!)
" <C-F1> through to <C-F4> (and <S-F1> through to <S-F4>)
" don't work in vim.  This was tried but doesn't work:
"# cmap <Esc>O1;2S <S-F4>

" -- list all buffers --
" <C-F2>
imap <Esc>O1;5Q <C-O>:ls<CR>
nmap <Esc>O1;5Q :ls<CR>
vmap <Esc>O1;5Q :<C-U>ls<CR>gv
imap <Esc>[1;5Q <C-O>:ls<CR>
nmap <Esc>[1;5Q :ls<CR>
vmap <Esc>[1;5Q :<C-U>ls<CR>gv

" -- previous buffer --
nmap <silent> [b :bprevious<CR>
vmap <silent> [b :<C-U>bprevious<CR>
imap <silent> <F1> <C-O>:bprevious<CR>
nmap <silent> <F1> :bprevious<CR>
vmap <silent> <F1> :<C-U>bprevious<CR>
" <S-F1> splits the window
if $TERM == 'linux'
  imap <silent> <Esc>[25~ <C-O>:sbprevious<CR>
  nmap <silent> <Esc>[25~ :sbprevious<CR>
  vmap <silent> <Esc>[25~ :<C-U>sbprevious<CR>
elseif $TERM == 'putty'
  imap <silent> <Esc>[23~ <C-O>:sbprevious<CR>
  nmap <silent> <Esc>[23~ :sbprevious<CR>
  vmap <silent> <Esc>[23~ :<C-U>sbprevious<CR>
else
  imap <silent> <Esc>O1;2P <C-O>:sbprevious<CR>
  nmap <silent> <Esc>O1;2P :sbprevious<CR>
  vmap <silent> <Esc>O1;2P :<C-U>sbprevious<CR>
  imap <silent> <Esc>[1;2P <C-O>:sbprevious<CR>
  nmap <silent> <Esc>[1;2P :sbprevious<CR>
  vmap <silent> <Esc>[1;2P :<C-U>sbprevious<CR>
endif
" -- next buffer --
nmap <silent> ]b :bnext<CR>
vmap <silent> ]b :<C-U>bnext<CR>
imap <silent> <F2> <C-O>:bnext<CR>
nmap <silent> <F2> :bnext<CR>
vmap <silent> <F2> :<C-U>bnext<CR>
" <S-F2> splits the window
if $TERM == 'linux'
  imap <silent> <Esc>[26~ <C-O>:sbnext<CR>
  nmap <silent> <Esc>[26~ :sbnext<CR>
  vmap <silent> <Esc>[26~ :<C-U>sbnext<CR>
elseif $TERM == 'putty'
  imap <silent> <Esc>[24~ <C-O>:sbnext<CR>
  nmap <silent> <Esc>[24~ :sbnext<CR>
  vmap <silent> <Esc>[24~ :<C-U>sbnext<CR>
else
  imap <silent> <Esc>O1;2Q <C-O>:sbnext<CR>
  nmap <silent> <Esc>O1;2Q :sbnext<CR>
  vmap <silent> <Esc>O1;2Q :<C-U>sbnext<CR>
  imap <silent> <Esc>[1;2Q <C-O>:sbnext<CR>
  nmap <silent> <Esc>[1;2Q :sbnext<CR>
  vmap <silent> <Esc>[1;2Q :<C-U>sbnext<CR>
endif
" -- this buffer --
" <C-S-F1> splits the window
nmap <silent> <Esc>O1;6P :split<CR>
vmap <silent> <Esc>O1;6P :<C-U>split<CR>gv
imap <silent> <Esc>O1;6P <C-O>:split<CR>
nmap <silent> <Esc>[1;6P :split<CR>
vmap <silent> <Esc>[1;6P :<C-U>split<CR>gv
imap <silent> <Esc>[1;6P <C-O>:split<CR>
nmap <silent> <C-S-F1> :split<CR>
vmap <silent> <C-S-F1> :gvsplit<CR>gv
imap <silent> <C-S-F1> <C-O>:split<CR>


" -- window switching --
imap <F3> <C-O><C-W>k
nmap <F3> <C-W>k
vmap <F3> <C-W>k
imap <F4> <C-O><C-W>j
nmap <F4> <C-W>j
vmap <F4> <C-W>j

" -- window resizing --
" <S-F3>
if $TERM == 'linux'
  imap <Esc>[28~ <C-O><C-W>-
  nmap <Esc>[28~ <C-W>-
  vmap <Esc>[28~ <C-W>-
elseif $TERM == 'putty'
  imap <Esc>[25~ <C-O><C-W>-
  nmap <Esc>[25~ <C-W>-
  vmap <Esc>[25~ <C-W>-
else
  imap <Esc>O1;2R <C-O><C-W>-
  nmap <Esc>O1;2R <C-W>-
  vmap <Esc>O1;2R <C-W>-
  imap <Esc>[1;2R <C-O><C-W>-
  nmap <Esc>[1;2R <C-W>-
  vmap <Esc>[1;2R <C-W>-
endif

" <S-F4>
if $TERM == 'linux'
  imap <Esc>[29~ <C-O><C-W>+
  nmap <Esc>[29~ <C-W>+
  vmap <Esc>[29~ <C-W>+
elseif $TERM == 'putty'
  imap <Esc>[26~ <C-O><C-W>+
  nmap <Esc>[26~ <C-W>+
  vmap <Esc>[26~ <C-W>+
else
  imap <Esc>O1;2S <C-O><C-W>+
  nmap <Esc>O1;2S <C-W>+
  vmap <Esc>O1;2S <C-W>+
  imap <Esc>[1;2S <C-O><C-W>+
  nmap <Esc>[1;2S <C-W>+
  vmap <Esc>[1;2S <C-W>+
endif

" -- window closing --
" <C-F3> -- close all other windows
imap <C-F3> <C-O><C-W>o
nmap <C-F3> <C-W>o
vmap <C-F3> <C-W>ogv
imap <Esc>O1;5R <C-O><C-W>o
nmap <Esc>O1;5R <C-W>o
vmap <Esc>O1;5R <C-W>ogv
imap <Esc>[1;5R <C-O><C-W>o
nmap <Esc>[1;5R <C-W>o
vmap <Esc>[1;5R <C-W>ogv
" (PuTTY has no key code)

" <C-F4> -- close this window
imap <C-F4> <C-O><C-W>c
nmap <C-F4> <C-W>c
vmap <C-F4> <C-W>c
imap <Esc>O1;5S <C-O><C-W>c
nmap <Esc>O1;5S <C-W>c
vmap <Esc>O1;5S <C-W>c
imap <Esc>[1;5S <C-O><C-W>c
nmap <Esc>[1;5S <C-W>c
vmap <Esc>[1;5S <C-W>c
" (PuTTY has no key code)

" <C-S-F4>
imap <Esc>O1;6S <C-O>:bunload<CR>
nmap <Esc>O1;6S :bunload<CR>
vmap <Esc>O1;6S :<C-U>bunload<CR>gv
imap <Esc>[1;6S <C-O>:bunload<CR>
nmap <Esc>[1;6S :bunload<CR>
vmap <Esc>[1;6S :<C-U>bunload<CR>gv

" -- file operations --
nmap <silent> ZE :edit<CR>
nmap <silent> ZW :write<CR>
nmap ZN :wnext<CR>

" QuickFix commands (mostly error-jumps)
nmap [e :cprevious<CR>
vmap [e :<C-U>cprevious<CR>gv
nmap <F6> :cprevious<CR>
vmap <F6> :<C-U>cprevious<CR>gv
imap <F6> <C-O>:cprevious<CR>
nmap [E :cpfile<CR>
nmap <C-S-F6> :cpfile<CR>

nmap ]e :cnext<CR>
vmap ]e :<C-U>cnext<CR>gv
nmap <F7> :cnext<CR>
vmap <F7> :<C-U>cnext<CR>gv
imap <F7> <C-O>:cnext<CR>
nmap ]E :cnfile<CR>
nmap <C-S-F7> :cnfile<CR>

" -- tab switching --
nmap <M-PageUp>   gT
vmap <M-PageUp>   gT
imap <M-PageUp>   <C-O>gT
nmap <S-Tab> gT
vmap <S-Tab> <C-O>gT
nmap <M-PageDown> gt
vmap <M-PageDown> gt
imap <M-PageDown> <C-O>gt

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
nmap <M-Home> :tabfirst<CR>
nmap <M-End> :tablast<CR>

if exists("*function")
  " can't use <expr> because that can't handle a count
  " have to use the <C-U> to avoid passing the count to :call
  nmap <silent> g<Tab> :<C-U>call JumpBetweenTabs(v:count)<CR>
  vmap <silent> g<Tab> :<C-U>call JumpBetweenTabs(v:count)<CR>

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

" -- toggles --
imap <silent> <F8> <C-O>:silent set wrap!<CR>
nmap <silent> <F8> :silent set wrap!<CR>
vmap <silent> <F8> :<C-U>silent set wrap!<CR>gv

if $TERM == 'linux'
  imap <Esc>[34~ <C-O>:silent setlocal spell!\|setlocal spell?<CR>
  nmap <Esc>[34~ :silent setlocal spell!\|setlocal spell?<CR>
  vmap <Esc>[34~ :<C-U>silent setlocal spell!\|setlocal spell?<CR>gv
else
  imap <S-F8> <C-O>:silent setlocal spell!\|setlocal spell?<CR>
  nmap <S-F8> :silent setlocal spell!\|setlocal spell?<CR>
  vmap <S-F8> :<C-U>silent setlocal spell!\|setlocal spell?<CR>gv
endif

imap <C-F8> <C-O>:silent set ignorecase!\|set ignorecase?<CR>
nmap <C-F8> :silent set ignorecase!\|set ignorecase?<CR>
vmap <C-F8> :<C-U>silent set ignorecase!\|set ignorecase?<CR>gv
imap <C-S-F8> <C-O>:silent set hlsearch!\|set hlsearch?<CR>
nmap <C-S-F8> :silent set hlsearch!\|set hlsearch?<CR>
vmap <C-S-F8> :<C-U>silent set hlsearch!\|set hlsearch?<CR>gv

imap <silent> <S-F10> <C-O>:set number!<CR>
nmap <silent> <S-F10> :set number!<CR>

imap <silent> <C-F10> <C-O>:if &diff \| :diffoff \| :else \| :diffthis \| :endif<CR>
nmap <silent> <C-F10> :if &diff \| :diffoff \| :else \| :diffthis \| :endif<CR>

imap <silent> <C-S-F10> <C-O>:set list!<CR>
nmap <silent> <C-S-F10> :set list!<CR>
vmap <silent> <C-S-F10> :<C-U>set list!<CR>

" -- Explore --
nmap <silent> <C-W>e :Sexplore<CR>
nmap <silent> <C-W>V :Vexplore<CR>
nmap <silent> <C-W>E :Texplore<CR>
nmap <silent> g<C-O> :Rexplore<CR>


" -- other --
" normal-mode shortcuts for various build-related commands
nmap ZM :make<CR>
nmap <F9> :make<CR>
nmap <C-F9> :clist<CR>
imap <C-F9> <C-O>:clist<CR>
nmap <S-F9> :setlocal makeprg=
imap <S-F9> <C-O>:setlocal makeprg=
nmap <C-S-F9> :colder<CR>
imap <C-S-F9> <C-O>:colder<CR>


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
" -- ex command prompt --
cmap <F6> <S-Tab>
cmap <F7> <Tab>

" Commands to delete a quoted message's signature and go into insert mode:
nmap gr }?^>\ *.<CR>?^>\ *$<CR>?^>\ *.<CR>jc}<CR>
nmap gR }c?^>\ -- $?<CR><C-U><C-U><CR>
nmap gz v/^-- <CR>dzbO<CR><CR><Up>

" -- Useful searching commands --
map  <F5> /
imap <F5> <C-O>/
if $TERM == 'linux'
  nmap  <Esc>[31~ ?
  imap <Esc>[31~ <C-O>?
else
  nmap  <S-F5> ?
  imap <S-F5> <C-O>?
endif
nmap <C-F5> n
imap <C-F5> <C-O>n
nmap <C-S-F5> N
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
vmap <Esc>O1;6Q :<C-U>tabs<CR>gv
imap <Esc>O1;6Q <C-O>:tabs<CR>
nmap <Esc>[1;6Q :tabs<CR>
vmap <Esc>[1;6Q :<C-U>tabs<CR>gv
imap <Esc>[1;6Q <C-O>:tabs<CR>
nmap <C-S-F2> :tabs<CR>
vmap <C-S-F2> :<C-U>tabs<CR>gv
imap <C-S-F2> <C-O>:tabs<CR>

" == terminal window running a shell ==
if has("terminal")
  map g<C-S> :tab terminal<CR>
  map gS :terminal<CR>

  " -- :term mappings --
  tmap <M-PageUp> <C-W>NgT
  tmap <M-PageDown> <C-W>Ngt
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
nmap <C-F6> [c
vmap <C-F6> [c
imap <C-F6> <C-O>[c
nmap <C-F7> ]c
vmap <C-F7> ]c
imap <C-F7> <C-O>]c

" == spell ==
if $TERM == 'linux'
  imap <Esc>[32~ <C-O>[s
  nmap <Esc>[32~ [s
  vmap <Esc>[32~ [s
  imap <Esc>[33~ <C-O>]s
  nmap <Esc>[33~ ]s
  vmap <Esc>[33~ ]s
else
  imap <S-F6> <C-O>[s
  nmap <S-F6> [s
  vmap <S-F6> [s
  imap <S-F7> <C-O>]s
  nmap <S-F7> ]s
  vmap <S-F7> ]s
endif

" == netrw ==
let g:netrw_sort_sequence='[\/]$,\<core\%(\.\d\+\)\=\>,README,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.sw.$,\.bak$,\~$'

" == Packages ==
if has('packages')
  packadd! matchit
else
  runtime! macros/matchit.vim
endif


" *** Functions and commands to use them ***
if exists("*function")
  " :Rename
  runtime include/rename4.vim
  " :BDE
  runtime include/bde.vim

  " Eat one character matching the given regex from the input stream, e.g. at
  " the end of an abbr expansion.
  " E.g. `:iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>`
  func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
  endfunc
endif


" *** Settings ***
set formatprg=
set nobackup         " don't keep a backup file
set viminfo='100,<900,s10,h

set nowrap sidescroll=1
set ruler hidden laststatus=2 showcmd
"# set confirm   " unknown in Vim 5.0
set foldclose=             " Automatic foldclosing is irritating too

set shortmess=filtoOrmw

set selection=exclusive   " unknown in Vim 5.0; used to work in ???; back in 6.x

set nohlsearch
set smartcase    " Override the 'ignorecase' option if the search pattern contains upper case characters

" Help buffers and hit-enter and more-prompt prompts only
"# set mouse=a
set mouse=hr
set mousemodel=popup_setpos
set mousetime=180

" Selection (<S-Left> etc. starts type-to-replace selection mode)
set selectmode=key
set keymodel=startsel   " Don't use "stopsel" because that breaks Visual mode

" Disable default: autoselect,exclude:cons\|linux
set clipboard=

" -- editing --
set bs=2             " allow backspacing over everything in insert mode
set autoindent

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
vmap <S-F11> :<C-U>set textwidth=
imap <S-F11> <C-O>:set textwidth=
nmap <C-S-F11> :set textwidth=0<CR>
vmap <C-S-F11> :<C-U>set textwidth=0<CR>gv
imap <C-S-F11> <C-O>:set textwidth=0<CR>
imap <F12> <C-O>:silent set expandtab!\|set expandtab?<CR>
nmap <F12> :silent set expandtab!\|set expandtab?<CR>
vmap <F12> :<C-U>silent set expandtab!\|set expandtab?<CR>gv
imap <C-F12> <C-O>:silent set autoindent!\|set autoindent?<CR>
nmap <C-F12> :silent set autoindent!\|set autoindent?<CR>
vmap <C-F12> :<C-U>silent set autoindent!\|set autoindent?<CR>gv
imap <silent> <S-F12> <C-O>:set readonly!<CR>
nmap <silent> <S-F12> :set readonly!<CR>
vmap <silent> <S-F12> :<C-U>set readonly!<CR>gv
if exists("*function")
  nmap <C-S-F12> :call Mousetoggle()<CR>
  vmap <C-S-F12> :<C-U>call Mousetoggle()<CR>gv
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
" See 'fo-table'
set formatoptions-=o formatoptions+=n
if v:version >= 801
  set formatoptions+=p
endif
set modeline

set fileformats=unix,dos,mac

" -- other --
set titleold=Terminal


" *** Misc ***
runtime include/abbrevs.vim

" -- digraphs --
if has("digraphs")
  digraphs a` 224
endif

" -- Git support --
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'


" *** Fixups ***
" == Terminal ==


" *** Extensibility ***
if exists("*filereadable") && exists("$ZONE")
  " source the zone-specific rc file, if it exists
  let s:zone_rc_file = $HOME . "/.init/Zones/" . $ZONE . "/vimrc"
  if filereadable(s:zone_rc_file)
    execute "source" s:zone_rc_file
  endif
endif
