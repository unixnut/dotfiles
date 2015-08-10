if [ -n "$DISPLAY" -a -t 0 -a "$TERM" = xterm ] ; then
  # Determine if the terminal emulator can support 256 colour ANSI sequences.
  # Possible vars:
  #   xterm: "XTERM_LOCALE=en_AU.utf8"; "XTERM_VERSION=XTerm(261)"
  #   Konsole: "KONSOLE_DBUS_SERVICE=:1.4633"; "KONSOLE_DBUS_SESSION=/Sessions/1"
  #   gnome-terminal: "COLORTERM=gnome-terminal"
  if [ $COLORTERM = gnome-terminal -o "${XTERM_LOCALE#*.}" = utf8 -o -n "$KONSOLE_DBUS_SESSION" ] ; then
    export TERM=xterm-256color
  fi
fi
