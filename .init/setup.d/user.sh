# -- general setup --
if [ -n "$(type -p vim)" ] ; then
  export VISUAL=vim
elif [ -n "$(type -p vi)" ] ; then
  export VISUAL=vi
fi
if [ -d ~/lisp/Zones/$ZONE ] ; then
  export EMACS_ZONEDIR=$HOME/lisp/Zones/$ZONE
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# -- admin setup --
# alter the path if not root (if root, /etc/profile does sbin)
if [ $DISTRO != Ubuntu -a $EUID -ne 0 ]; then
  PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
fi


# == apps ==
export MANPATH=`manpath`
export PYTHONPATH=$HOME/bin

# works as long as the use-agent option appears in ~/.gnupg/gpg.conf
## eval `gpg-agent -s --daemon`

export CVS_RSH=`which ssh`

# Midnight Commander needs this to run in color mode
export COLORTERM=1

# FreeBSD ls needs this to run in color mode
export CLICOLOR=y

# For GNU ls, see /usr/bin/dircolors test in .init/setup.d/bash.sh

export MOZ_PLUGIN_PATH=/usr/local/lib/browser-plugins

# -- cool grep options --
# check version number (e.g. GNU grep 2.5.3)
set_grep_vars()
{
  # v2.5+
  if [ $1 -gt 2 -o $1 = 2 -a $2 -ge 5 ] ; then
    # if the version is >= 2.5.3, use dir exclusions
    if [ $1 -gt 2 -o $1 = 2 -a $2 -gt 5 -o $1 = 2 -a $2 = 5 -a $3 -ge 3 ] ; then
      export GREP_OPTIONS="--exclude-dir=.svn --exclude-dir=.hg --exclude-dir=.git --exclude-dir=.pc"
    fi

    export GREP_OPTIONS="--color=auto --exclude=*~ --exclude=#*# --exclude=.*.sw? --exclude=*.bak $GREP_OPTIONS"
  fi
}
ver=`grep -V | sed -n -e 's/[-A-Za-z]*$//' -e '/GNU grep/ s/.* //p'`
if [ -n "$ver" ] ; then
  set_grep_vars $(ver_split $ver)
fi
unset ver
unset -f set_grep_vars

# -- X11 setup --
if [ -d "$HOME/.app-defaults" ] ; then
  export XUSERFILESEARCHPATH="$HOME/.app-defaults/%N%C:$HOME/.app-defaults/%N"
fi

