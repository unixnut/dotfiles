" Rename4.vim  -  Rename a buffer within Vim and on disk.
" Copyright July 2015 by Alastair Irvine <alastair@plug.org.au>
" TO-DO: handle case where target is a directory
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

    let l:omode = Octal_file_mode(l:curfile)

    let v:errmsg = ""
    silent! exec "saveas" . a:bang . " " . fnameescape(l:newname)
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exec "bwipe! " . fnameescape(l:curfile)
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif

            " attempt to make the new have file have same permissions using shell command
            silent! exec "!chmod " . l:omode . " " . fnameescape(l:newname)
        endif
    else
        echoerr v:errmsg
    endif
endfunction


function! Octal_file_mode(name)
    let l:mode = getfperm(a:name)
    let l:o = {'---': 0, '--x': 1, '-w-': 2, '-wx': 3, 'r--': 4, 'r-x': 5, 'rw-': 6, 'rwx': 7}
    let matches = matchlist(l:mode, '\(...\)\(...\)\(...\)')
    let l:omode = ''
    for l:item in matches[1:3]
        let l:omode .= l:o[l:item]
    endfor

    return l:omode
endfunction


" vim: set tabstop=4 shiftwidth=4 :
" Local Variables:
" tab-width: 4
" end:
