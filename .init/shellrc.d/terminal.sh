# Anything that needs doing if there's a prompt
if [ -n "$PS1" -a -z "$MY_TERM_SETUP" ] ; then
  # Only zsh seems to be able to provide the ability to have -ixon in use on the
  # command line but use ixon when commands are running.
  stty -ixon

  export MY_TERM_SETUP=done
fi
