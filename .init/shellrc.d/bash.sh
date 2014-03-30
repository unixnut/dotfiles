if [ -n "$PS1" ] ; then
  # append to the history file, don't overwrite it
  shopt -s histappend
  shopt -s cdspell
else
  shopt -s expand_aliases   # only enabled by default for interactive shells
fi
## shopt -s failglob
## shopt -s globstar
