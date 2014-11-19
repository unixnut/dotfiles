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

export FIGNORE="~:.o:.class:.pyc:.bak"

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
  export INPUTRC=~/.init/bash/inputrc
fi

# == tweaks for .bashrc ==
export force_color_prompt=yes

if [ -x /usr/bin/dircolors ]; then
  # sets and exports LS_COLORS
  if [ -r ~/.dir_colors ] ; then
    eval "$(dircolors -b ~/.dir_colors)"
  else
    eval "$(dircolors -b)"
  fi
  export USE_DIRCOLORS=y
fi
