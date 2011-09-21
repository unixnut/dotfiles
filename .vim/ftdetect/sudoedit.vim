" redetect the type of sudoedit temporary files
" (they have a name consisting of the name of the original file, with a
" mktemp(1) random extension, e.g. php.ini.XXWwf8TC)
au BufNewFile,BufRead ??*.[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]
	\ exe "doau filetypedetect BufRead " . expand("<afile>:r")

