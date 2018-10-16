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

# see .init/shellrc.d/prompt.sh

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
