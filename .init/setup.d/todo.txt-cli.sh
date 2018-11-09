if [ -f /opt/todo.txt-cli ] ; then
  PATH="/opt/todo.txt-cli:$PATH"
elif [ $DISTRO = Debian -o $DISTRO_BASE = Debian ] ; then
  if dpkg-query -W todotxt-cli > /dev/null 2>&1
  then
    export TODOTXT_CMD=todo-txt
  fi
fi

