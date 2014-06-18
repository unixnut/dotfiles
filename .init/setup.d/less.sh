# less will act like cat if there is no terminal, but it's only worth
# the setup delay if there is a terminal or might be one later
if [ -n "$DISPLAY" -o -t 0 ] ; then
  # use a replacement lesspipe (and lessfile) if I can supply a newer one
  lessver=$(less -V | awk '{ print $2 ; exit }')
  my_lesspipe_dir=$(ls -d ~/.init/contrib/less_*)
  my_lesspipe_ver=${my_lesspipe_dir##*_}

  less_setup()
  {
    eval `SHELL=/bin/sh $my_lesspipe_dir/lesspipe`
    # for sless
    export LESSOPEN_PROG=$my_lesspipe_dir/lessfile
    export LESSCLOSE_PROG=$my_lesspipe_dir/lessfile
  }

  if [ $my_lesspipe_ver -gt $lessver ] ; then
    less_setup
  else
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
      elif type -p lessopen.sh > /dev/null
      then
        export LESSOPEN="lessopen.sh '%s'"
        export LESSCLOSE="lessclose.sh '%s' '%s'"
        # for sless
        export LESSOPEN_PROG=lessopen.sh
        export LESSCLOSE_PROG=lessclose.sh
      else
        # fallback to the one I supplied
        less_setup
      fi
    fi
  fi
  export LESS="--LONG-PROMPT --window=-2"

  export PAGER=less
fi
