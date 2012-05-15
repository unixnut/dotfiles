# -- general setup --
export VISUAL=vim
if [ -d ~/lisp/Zones/$ZONE ] ; then
  export EMACS_ZONEDIR=$HOME/lisp/Zones/$ZONE
fi

#
# Many programs using readline library for line editing
# should know about this (e.g. bash)
#
if test -z "$INPUTRC" ; then
  if [ -s $HOME/.inputrc ]; then
    INPUTRC=$HOME/.inputrc
  else
    INPUTRC=/etc/inputrc
  fi
  export INPUTRC
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

export MOZ_PLUGIN_PATH=/usr/local/lib/browser-plugins

# -- cool grep options --
export GREP_OPTIONS="--color=auto --exclude=*~ --exclude=#*# --exclude=.*.sw? --exclude=.*.bak"
# check version number (e.g. GNU grep 2.5.3)
ver=`grep -V | sed -n '/^GNU/ s/GNU grep //p'`
if [ $ver ] ; then
  # if the version is >= 2.5.3, use dir exclusions
  if echo $ver | grep -q -e '^2.5.[3-9]' -e '^2.[6-9]' -e '^[3-9]' ; then
    GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=.svn --exclude-dir=.hg --exclude-dir=.git --exclude-dir=.pc"
  fi
fi

# -- X11 setup --
if [ -d "$HOME/.app-defaults" ] ; then
  export XUSERFILESEARCHPATH="$HOME/.app-defaults/%N%C:$HOME/.app-defaults/%N"
fi

