if [ -n "$DISPLAY" -a -t 0 ] ; then
  if [ $COLORTERM = gnome-terminal ] ; then
    export TERM=xterm-256color
  fi
fi
