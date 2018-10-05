# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# *** My preparation ***
# Older versions of SSH don't run the shell with the --login option,
# so .profile might not have been sourced
if [ -z "$OS" ] ; then
  # Assume there is an SSH connection, therefore not a login shell
  . ~/.init/setup.sh
fi

# *** (modified) stuff from /etc/skel/.bashrc ***

# == prompt ==
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

  # Custom dynamic prompt prefix for Python virtualenvs
  if [ -n "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
    PS1='${VIRTUAL_ENV+[$(basename "${VIRTUAL_ENV%.v*env}")] }'"$PS1"
  fi

  # If this is an xterm, etc. set the title to user@host:dir
  # (by adding prefixing the prompt with a string surrounded by terminal-specific
  # escape sequences, unlike older configs which set PROMPT_COMMAND)
  # TO-DO: use tput
  case "$TERM" in
    xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
    screen)
      # use octal 134 for backslash otherwise bash gets confused and conflates
      # \\ with the following backslash somehow
      PS1="\[\e_${debian_chroot:+($debian_chroot)}\u@\h: \w\e\134\]$PS1"
      ;;
    *)
      ;;
  esac
fi

# enable color support of ls and also add handy aliases
if [ -n "$USE_DIRCOLORS" ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Only do this if running interactively
if [ -n "$PS1" ] ; then
  # Enable programmable completion features
  # (Only do this if not already done by /etc/profile.d/bash_completion.sh *
  # (which runs even under SSH) but of course it will still need to be done for subshells.)
  # (This might also have already been done by /etc/bash.bashrc)
  # (* pre-sources "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion".
  # All cases (which use /usr/share/bash-completion/bash_completion)
  # post-sources ~/.bash_completion .)
  if ! shopt -oq posix && [ -z "$(complete)" ]
  then
    if [ -f /etc/bash_completion ] ; then
      . /etc/bash_completion
    elif [ -f /usr/share/bash-completion/bash_completion ] ; then
      . /usr/share/bash-completion/bash_completion
    fi
  fi
fi

# *** My stuff ***
for file in ~/.init/shellrc.${OS_BASE-$OS}.d/*.sh ; do
  . $file
done

for file in ~/.init/shellrc.d/*.sh ; do
  . $file
done

# Zone- and machine-specific stuff
if [ -r ~/.init/Zones/$ZONE/rc.sh ]; then
  . ~/.init/Zones/$ZONE/rc.sh
fi
if [ -r ~/.init/Zones/$ZONE/${HOST}.sh ]; then
  . ~/.init/Zones/$ZONE/${HOST}.sh
fi

# *** Post facto ***
# (Useful for local overrides)

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# vim: set filetype=sh :
### Local Variables:
### mode: shell-script
### sh-shell: bash
### End:
