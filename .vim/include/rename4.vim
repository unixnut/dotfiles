" Rename4.vim  -  Rename a buffer within Vim and on disk.
"
" based on Rename3.vim (which couldn't handle full paths, i.e. moving the file)
" Copyright July 2013 by Alex Ehlke <alex.ehlke at gmail.com>
"
" based on Rename2.vim (which couldn't handle spaces in paths)
" Copyright July 2009 by Manni Heumann <vim at lxxi.org>
"
" which is based on Rename.vim
" Copyright June 2007 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")

function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curfilepath = expand("%:p:h")
    if a:name =~ '^[^/]*$'
        " no path specfied
        let l:newname = l:curfilepath . "/" . a:name
    else
        let l:newname = a:name
    endif

    let v:errmsg = ""
    silent! exec "saveas" . a:bang . " " . fnameescape(l:newname)
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exec "bwipe! " . fnameescape(l:curfile)
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction



" vim: set tabstop=4 shiftwidth=4 :
" Local Variables:
" tab-width: 4
" end:
