if [ $DISTRO_BASE = Debian ] ; then
  eval `SHELL=/bin/sh lesspipe`
  # for sless
  export LESSOPEN_PROG=/usr/bin/lessfile
  export LESSCLOSE_PROG=/usr/bin/lessfile
else
  if [ -f /usr/bin/lesspipe.sh ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh '%s'"
    # unfortunately, no lessfile equivalent exists so use a homebrew one
    export LESSOPEN_PROG=$HOME/.init/lib/my_lessopen_pipe
    export LESSCLOSE_PROG=$HOME/.init/lib/my_lessopen_rm
  else
    export LESSOPEN="lessopen.sh '%s'"
    export LESSCLOSE="lessclose.sh '%s' '%s'"
    # for sless
    export LESSOPEN_PROG=lessopen.sh
    export LESSCLOSE_PROG=lessclose.sh
  fi
fi
export LESS="--LONG-PROMPT --window=-2"

export PAGER=less
