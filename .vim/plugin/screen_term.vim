"  File:        screen_term.vim: (global plugin) Fixups for $TERM=="screen*"
"  Author:      Alastair Irvine <alastair@plug.org.au>
"  Version:     1.0
"  Last Change: 2020-06-12
"  Repository:  
"
" Overview
" --------
" Provides translation mappings for the escape sequences not present in the
" terminfo(5) database for the "screen*" terminals.

if exists("screen_term") || &cp
    finish
endif
let screen_term=1


if $TERM =~ "screen*"
  " Many mappings are reserved for the terminal for scrolling, switching tabs,
  " etc.
  map  <Esc>[5;3~ <M-PageUp>
  map! <Esc>[5;3~ <M-PageUp>
  map  <Esc>[6;3~ <M-PageDown>
  map! <Esc>[6;3~ <M-PageDown>
  map  <Esc>[1;3H <M-Home>
  map! <Esc>[1;3H <M-Home>
  map  <Esc>[1;5H <C-Home>
  map! <Esc>[1;5H <C-Home>
  map  <Esc>[1;3F <M-End>
  map! <Esc>[1;3F <M-End>
  map  <Esc>[1;5F <C-End>
  map! <Esc>[1;5F <C-End>
  map  <Esc>[1;5A <C-Up>
  map! <Esc>[1;5A <C-Up>
  map  <Esc>[1;2A <S-Up>
  map! <Esc>[1;2A <S-Up>
  map  <Esc>[1;5B <C-Down>
  map! <Esc>[1;5B <C-Down>
  map  <Esc>[1;2B <S-Down>
  map! <Esc>[1;2B <S-Down>
  map  <Esc>[1;5D <C-Left>
  map! <Esc>[1;5D <C-Left>
  map  <Esc>[1;2D <S-Left>
  map! <Esc>[1;2D <S-Left>
  map  <Esc>[1;6D <C-S-Left>
  map! <Esc>[1;6D <C-S-Left>
  map  <Esc>[1;5C <C-Right>
  map! <Esc>[1;5C <C-Right>
  map  <Esc>[1;2C <S-Right>
  map! <Esc>[1;2C <S-Right>
  map  <Esc>[1;6C <C-S-Right>
  map! <Esc>[1;6C <C-S-Right>
  " F1-F4 shifted mappings are not represented properly for regular terminals
  map  <Esc>[15;2~ <S-F5>
  map! <Esc>[15;2~ <S-F5>
  map  <Esc>[15;5~ <C-F5>
  map! <Esc>[15;5~ <C-F5>
  map  <Esc>[15;6~ <C-S-F5>
  map! <Esc>[15;6~ <C-S-F5>
  map  <Esc>[15;4~ <M-S-F5>
  map! <Esc>[15;4~ <M-S-F5>
  map  <Esc>[17;2~ <S-F6>
  map! <Esc>[17;2~ <S-F6>
  map  <Esc>[17;5~ <C-F6>
  map! <Esc>[17;5~ <C-F6>
  map  <Esc>[17;6~ <C-S-F6>
  map! <Esc>[17;6~ <C-S-F6>
  map  <Esc>[17;4~ <M-S-F6>
  map! <Esc>[17;4~ <M-S-F6>
  map  <Esc>[18;2~ <S-F7>
  map! <Esc>[18;2~ <S-F7>
  map  <Esc>[18;5~ <C-F7>
  map! <Esc>[18;5~ <C-F7>
  map  <Esc>[18;6~ <C-S-F7>
  map! <Esc>[18;6~ <C-S-F7>
  map  <Esc>[18;4~ <M-S-F7>
  map! <Esc>[18;4~ <M-S-F7>
  map  <Esc>[19;2~ <S-F8>
  map! <Esc>[19;2~ <S-F8>
  map  <Esc>[19;5~ <C-F8>
  map! <Esc>[19;5~ <C-F8>
  map  <Esc>[19;6~ <C-S-F8>
  map! <Esc>[19;6~ <C-S-F8>
  map  <Esc>[19;4~ <M-S-F8>
  map! <Esc>[19;4~ <M-S-F8>
  map  <Esc>[20;2~ <S-F9>
  map! <Esc>[20;2~ <S-F9>
  map  <Esc>[20;5~ <C-F9>
  map! <Esc>[20;5~ <C-F9>
  map  <Esc>[20;6~ <C-S-F9>
  map! <Esc>[20;6~ <C-S-F9>
  map  <Esc>[20;4~ <M-S-F9>
  map! <Esc>[20;4~ <M-S-F9>
  map  <Esc>[21;2~ <S-F10>
  map! <Esc>[21;2~ <S-F10>
  map  <Esc>[21;5~ <C-F10>
  map! <Esc>[21;5~ <C-F10>
  map  <Esc>[21;6~ <C-S-F10>
  map! <Esc>[21;6~ <C-S-F10>
  map  <Esc>[21;4~ <M-S-F10>
  map! <Esc>[21;4~ <M-S-F10>
  map  <Esc>[23;2~ <S-F11>
  map! <Esc>[23;2~ <S-F11>
  map  <Esc>[23;5~ <C-F11>
  map! <Esc>[23;5~ <C-F11>
  map  <Esc>[23;6~ <C-S-F11>
  map! <Esc>[23;6~ <C-S-F11>
  map  <Esc>[23;4~ <M-S-F11>
  map! <Esc>[23;4~ <M-S-F11>
  map  <Esc>[24;2~ <S-F12>
  map! <Esc>[24;2~ <S-F12>
  map  <Esc>[24;5~ <C-F12>
  map! <Esc>[24;5~ <C-F12>
  map  <Esc>[24;6~ <C-S-F12>
  map! <Esc>[24;6~ <C-S-F12>
  map  <Esc>[24;4~ <M-S-F12>
  map! <Esc>[24;4~ <M-S-F12>
endif
