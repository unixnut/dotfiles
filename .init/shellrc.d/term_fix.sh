if [ -n "$DISPLAY" -a -t 0 -a "$TERM" = xterm ] ; then
  # Determine if the terminal emulator can support 256 colour ANSI sequences.
  # Possible vars:
  #   xterm: "XTERM_LOCALE=en_AU.utf8"; "XTERM_VERSION=XTerm(261)"
  #   Konsole: "KONSOLE_DBUS_SERVICE=:1.4633"; "KONSOLE_DBUS_SESSION=/Sessions/1"
  #   gnome-terminal: "COLORTERM=gnome-terminal"
  #   MATE: "COLORTERM=truecolor"
  if [ "$COLORTERM" = gnome-terminal -o "$COLORTERM" = mate-terminal -o \
       "$COLORTERM" = truecolor -o \
       "${XTERM_LOCALE#*.}" = utf8 -o \
       -n "$KONSOLE_DBUS_SESSION" ] ; then
    export TERM=xterm-256color
  fi
fi

# Anything that needs doing in a native X desktop if there's a prompt
if [ -n "$X_LOGIN" -a -t 0 -a -n "$PS1" ] ; then
  # Stuff to do once per pty
  if [ $SHLVL -eq 1 ] ; then
    # Only zsh seems to be able to provide the ability to have -ixon in use on the
    # command line but use ixon when commands are running.
    stty -ixon
  fi
fi
