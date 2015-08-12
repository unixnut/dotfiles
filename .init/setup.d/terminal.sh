if [ -n "$SSH_CONNECTION" -a "$TERM" = xterm ] ; then
  TERM=xterm-256color
fi

# Anything that needs doing if there's a prompt
if [ -t 0 -a -n "$PS1" ] ; then
  # Only zsh seems to be able to provide the ability to have -ixon in use on the
  # command line but use ixon when commands are running.
  stty -ixon
fi
