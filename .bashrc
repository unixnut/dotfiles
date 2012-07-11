# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# *** (modified) stuff from /etc/skel/.bashrc ***
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# == prompt ==
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
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
      PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
      ;;
    RHEL)
      # like the default one ('[\u@\h \W]\$ ') but with Debian-style colour
      PS1='[\[\e[01;32m\]\u@\h\[\e[00m\] \[\e[01;34m\]\W\[\e[00m\]]\$ '
      ;;
    *)
      PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\] \$ '
  esac
fi
unset color_prompt

# If this is an xterm, etc. set the title to user@host:dir
# (by adding prefixing the prompt with a string surrounded by terminal-specific
# escape sequences, unlike older configs which set PROMPT_COMMAND)
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  screen)
    # STY=4122.pts-0.sirius
    screenid=${STY%.*}
    # use octal 134 for backslash otherwise bash gets confused and conflates
    # \\ with the following backslash somehow
    PS1="\[\e_${debian_chroot:+($debian_chroot)}\u@\h: \w\a\e\134\]{$screenid}$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -n "$USE_DIRCOLORS" ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# *** My stuff ***
for file in ~/.init/shellrc.d/*.sh ; do
  . $file
done


# vim: set filetype=sh :
### Local Variables:
### mode: shell-script
### sh-shell: bash
### End:
