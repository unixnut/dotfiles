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

export FIGNORE="~:.o:.class:.pyc:.bak"

# to-do: update this file (see .init/shellrc.d/completions.tcsh)
export HOSTFILE=~/tmp/hosts

#
# Many programs using readline library for line editing
# should know about this (e.g. bash)
#
if [ -s $HOME/.inputrc ]; then
  export INPUTRC=$HOME/.inputrc
else
  export INPUTRC=~/.init/bash/inputrc
fi

# == tweaks for .bashrc ==
export force_color_prompt=yes

if [ -x /usr/bin/dircolors ]; then
  # sets and exports LS_COLORS
  # (Have to set TERM since dircolors will only generate sequences that are
  # supported by the current terminal, i.e. for a given sequence, the
  # most recent block of TERM keywords has one that matches the current
  # terminal.)
  if [ -r ~/.dir_colors ] ; then
    eval "$(TERM=xterm-color dircolors -b ~/.dir_colors)"
  else
    eval "$(TERM=xterm-color dircolors -b)"
  fi
  export USE_DIRCOLORS=y
fi
