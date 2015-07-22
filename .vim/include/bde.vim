command! -nargs=1 -complete=file -bang -bar BDE call ReplaceBuffer('<bang>', <f-args>)

function! ReplaceBuffer(bang, newfile)
  let curbuf = bufnr('%')
  exec "e " . a:newfile
  exec "bd" . a:bang . " " . curbuf
endfunction
