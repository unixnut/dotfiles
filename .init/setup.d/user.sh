# when running a remote terminal emulator, run "setup_user_vars" first
# (X_LOGIN is set in .gnomerc, etc. and is equivalent to '-n "$DISPLAY" -a -z "$TERM"')
if [ "$X_LOGIN" = y -o -n "$TERM" ] ; then
  setup_user_vars()
  {
    # -- general setup --
    # dash "type" doesn't support -p, so test exit code and throw away output
    if type vim > /dev/null 2>&1
    then
      export VISUAL=vim
    elif type vi > /dev/null 2>&1
    then
      export VISUAL=vi
    fi
    if [ -d ~/lisp/Zones/$ZONE ] ; then
      export EMACS_ZONEDIR=$HOME/lisp/Zones/$ZONE
    fi

    # Midnight Commander needs this to run in color mode
    if [ -z "$COLORTERM" ] ; then
      export COLORTERM=1
    fi

    # FreeBSD ls needs this to run in color mode
    export CLICOLOR=y

    # For GNU ls, see /usr/bin/dircolors test in .init/setup.d/bash.sh

    export MOZ_PLUGIN_PATH=/usr/local/lib/browser-plugins

    # == stuff from other .init/setup.d files
    setup_user_vars_less
  }

  # Only run it if not using non-interactive SSH
  # (Don't use "-t 0" because this might be running during X Windows session
  # initialisation.)
  if [ "$TERM" != dumb -o "$X_LOGIN" = y ] ; then
    setup_user_vars
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$HOME/bin/${BINARY_TYPE}:$PATH"
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

if [ $OS = Linux ] ; then
  export SED_ERE_OPT=--regexp-extended
else
  export SED_ERE_OPT=-E
fi

export COOKIECUTTER_CONFIG=/home/alastair/.config/cookiecutter.yaml

# -- cool grep options --
# check version number (e.g. GNU grep 2.5.3)
set_grep_vars()
{
  # v2.5+
  if [ $1 -gt 2 -o \
       $1 -eq 2 -a $2 -ge 5 ] ; then
    # if the version is >= 2.5.3, use dir exclusions
    # For FreeBSD grep, if the version is >= 2.5, use dir exclusions
    if [ $1 -gt 2 -o \
         $1 -eq 2 -a $2 -gt 5 -o \
         $1 -eq 2 -a $2 -eq 5 -a \( $3 -ge 3 -o "$4" = bsd \) ] ; then
      export GREP_OPTIONS="--exclude-dir=.svn --exclude-dir=.hg --exclude-dir=.git --exclude-dir=.pc"
    fi

    export GREP_OPTIONS="--color=auto --exclude=*~ --exclude=#*# --exclude=.sw? --exclude=.*.sw? --exclude=*.bak --exclude=*.o --exclude=*.so --exclude=*.class --exclude=*.pyc $GREP_OPTIONS"

    # $GREP_OPTIONS is deprecated as of v2.21, so use my own method instead
    if [ $1 -gt 2 -o \
         $1 -eq 2 -a $2 -ge 21 ] ; then
      export MY_GREP_OPTIONS=$GREP_OPTIONS
      unset GREP_OPTIONS
    fi
  fi
}
# Examples:
#   grep (BSD grep) 2.5.1-FreeBSD
#   GNU grep 2.6.3
ver=`grep -V | sed $SED_ERE_OPT -n -e 's/[-A-Za-z]*$//' -e '/(GNU|BSD) grep/ s/.* //p'`
if [ -n "$ver" ] ; then
  set_grep_vars $(ver_split $ver) $([ $OS != Linux ] && echo bsd)
fi
unset ver 
unset -f set_grep_vars

# default for GNU ls --time-style option
# (replaces ugly "Mar 31 01:52"/"Mar  3  2015" format with "2013-02-22 15:56")
export TIME_STYLE=long-iso

# -- X11 setup --
if [ -n "$DISPLAY" -a -d "$HOME/.app-defaults" ] ; then
  export XUSERFILESEARCHPATH="$HOME/.app-defaults/%N%C:$HOME/.app-defaults/%N"
fi

