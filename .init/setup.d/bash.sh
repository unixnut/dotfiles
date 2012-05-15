# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
## HISTCONTROL=ignoredups:ignorespace
export HISTCONTROL

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

export INPUTRC=~/.init/bash/inputrc

# == tweaks for .bashrc ==
export force_color_prompt=yes

if [ -x /usr/bin/dircolors ]; then
  # sets and exports LS_COLORS
  # (Have to set TERM since dircolors will only generate sequences that are
  # supported by the current terminal, i.e. for a given sequence, the
  # most recent block of TERM keywords has one that matches the current
  # terminal.)
  if [ -r ~/.dircolors ] ; then
    eval "$(TERM=gnome-256color dircolors -b ~/.dircolors)"
  else
    eval "$(TERM=gnome-256color dircolors -b)"
  fi
  export USE_DIRCOLORS=y
fi
