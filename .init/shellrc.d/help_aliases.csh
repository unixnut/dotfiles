# show help for the previous command
# (includes a hack that avoids supplying "--help" to certain commands that
# don't support it)
alias help '\!-1:0 `if (\!-1:0 != host) echo --help`'
alias shelp \!-1:1 --help

