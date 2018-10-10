if [ $DISTRO = Debian -o $DISTRO_BASE = Debian ] ; then
  # From 'todotxt-cli'
  alias t=todo-txt    

  complete -F _todo t
fi
