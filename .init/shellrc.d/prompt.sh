# Only do this if running interactively
if [ -n "$PS1" ] ; then
  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
    xterm-*color) color_prompt=yes ;;
    screen*)      color_prompt=yes ;;
  esac

  if [ -z "$color_prompt" -a -n "$force_color_prompt" ]; then
      # ensure that this terminal supports the "set foreground" sequence in
      # terminfo or termcap respectively
      if [ -x /usr/bin/tput ] && { tput setaf 1 || tput AF 1 ; } >&/dev/null; then
          # We have color support; assume it's compliant with Ecma-48
          # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
          # a case would tend to support setf rather than setaf.)
          color_prompt=yes
      else
          color_prompt=
      fi
  fi

  # override the one from /etc/bash.bashrc if using colour
  # (Debian default is '${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ')
  # TO-DO: use tput
  if [ "$color_prompt" = yes ]; then
    case $DISTRO_BASE in
      Debian)
        PS1="${debian_chroot:+($debian_chroot)}"'\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
        ;;
      RedHat)
        # like the default one ('[\u@\h \W]\$ ') but with Debian-style colour
        # and uses PROMPT_DIRTRIM
        PS1='[\[\e[01;32m\]\u@\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\]]\$ '
        ;;
      *)
        PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\] \$ '
    esac
  fi
  unset color_prompt

  # If this is an xterm, etc. set the title to {tty:NN} ($debian_chroot) user@host:dir
  # (by adding prefixing the prompt with a string surrounded by terminal-specific
  # escape sequences, unlike older configs which set PROMPT_COMMAND)
  # For xterm specifically, set the window and icon titles separately.
  # TO-DO: use tput
  wintitle="${debian_chroot:+($debian_chroot)}\\u@\\h: \\w"
  if [ -z "$SSH_CONNECTION" ] ; then
    # For local connections, add the pty number to the window title
    wintitle_tty='{tty:\l} '
  fi
  case "$TERM" in
    xterm*|rxvt*)
      # Set the window and icon titles respectively
      PS1="\\[\\e]1;$wintitle\\a\\]\\[\\e]2;$wintitle_tty$wintitle\\a\\]$PS1"
      ;;
    screen*)
      # use octal 134 for backslash otherwise bash gets confused and conflates
      # \\ with the following backslash somehow
      PS1="\\[\\e_$wintitle_tty$wintitle\\e\134\\]$PS1"
      ;;
    *)
      ;;
  esac
  unset wintitle wintitle_tty

  # -- extra stuff that shouldn't appear in the wintitle --
  # Custom dynamic prompt prefix for Python virtualenvs
  if [ -n "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
    PS1='${VIRTUAL_ENV+[$(basename "${VIRTUAL_ENV%.v*env}")] }'"$PS1"
  fi
fi
