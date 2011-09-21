if [ $DISTRO_BASE = Debian ] ; then
  eval `SHELL=/bin/sh lesspipe`
else
  if [ -f /usr/bin/lesspipe.sh ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
  else
    export LESSOPEN="lessopen.sh %s"
    export LESSCLOSE="lessclose.sh %s %s"
  fi
fi
export LESS="--LONG-PROMPT --window=-2"

export PAGER=less
