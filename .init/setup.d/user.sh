# -- general setup --
export EMAIL=alastair@al.id.au
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

# -- X11 setup --
if [ -d "$HOME/.app-defaults" ] ; then
  export XUSERFILESEARCHPATH="$HOME/.app-defaults/%N%C:$HOME/.app-defaults/%N"
fi

