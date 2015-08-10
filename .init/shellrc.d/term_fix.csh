if ($?DISPLAY && $?tty && $TERM == xterm) then
  if ($COLORTERM == gnome-terminal || $?KONSOLE_DBUS_SESSION) then
    setenv TERM xterm-256color
  else if ($?XTERM_LOCALE) then
    # Note: should force this using the "XTerm.xtermName" resource
    # (...but which probably doesn't work)
    if ($XTERM_LOCALE:e == utf8) then
      setenv TERM xterm-256color
    endif
  endif
endif
