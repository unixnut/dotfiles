# Force loading of .bashrc, even when non-interactive (see INVOCATION in bash(1))
export BASH_ENV=$HOME/.bashrc

# Check whether the shell needs to set vars for a future interactive subshell
# or is completely non-interactive, e.g. running from cron (i.e. TERM="")
# (Note: under SSH, with no terminal allocated, TERM=dumb.
# However, bash(?) sets TERM=dumb when it's not set, so override this when
# $X_LOGIN is set.)
if [ "$X_LOGIN" = y -o -n "$TERM" ] ; then
  # stuff that will be useful in a subshell where $PS1 is set
  if [ "$TERM" != dumb -o "$X_LOGIN" = y ] ; then 
    # don't put duplicate lines in the history. See bash(1) for more options
    ## # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
    ## HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace
    export HISTCONTROL

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    export HISTSIZE=1000
    export HISTFILESIZE=2000
    export HISTTIMEFORMAT='%r   '
    # ... %H:%M:%S
    ## export FCEDIT vim

    export FIGNORE="~:.o:.class:.pyc:.bak:.swp:.swo:.swn:.swm:.swl"

    # to-do: update this file (see .init/shellrc.d/completions.tcsh)
    export HOSTFILE=~/tmp/hosts

    export PROMPT_DIRTRIM=4

    #
    # Many programs using readline library for line editing
    # should know about this (e.g. bash)
    #
    if [ -s $HOME/.inputrc ]; then
      export INPUTRC=$HOME/.inputrc
    else
      if [ -s ~/.init/bash/inputrc-$DISTRO_BASE ]; then
        export INPUTRC=~/.init/bash/inputrc-$DISTRO_BASE
      elif [ -s ~/.init/bash/inputrc-$OS ]; then
        export INPUTRC=~/.init/bash/inputrc-$OS
      else
        export INPUTRC=~/.init/bash/inputrc
      fi
    fi

    # == tweaks for .bashrc ==
    # This is needed because .init/shellrc.d/term_fix.sh is run AFTER .bashrc
    # checks $TERM
    export force_color_prompt=yes
  fi

  if [ -x /usr/bin/dircolors ]; then
    # sets and exports LS_COLORS
    if [ -r ~/.dir_colors ] ; then
      dircolors_file=$HOME/.dir_colors
    fi

    # If running non-interactive, e.g. during X Windows session initialisation
    # or under SSH, have to set/override TERM respectively
    if [ -z "$TERM" -o "$TERM" = dumb ] ; then
      # (dircolors will only generate sequences that are supported by the
      # current terminal, i.e. for a given sequence, the most recent block of
      # TERM keywords has one that matches the current terminal.)
      eval "$(TERM=xterm-256color dircolors -b $dircolors_file)"
    else
      eval "$(dircolors -b $dircolors_file)"
    fi
    export USE_DIRCOLORS=y
    unset dircolors_file
  fi
fi
