if [ -f /opt/todo.txt-cli/todo_completion ] ; then
  . /opt/todo.txt-cli/todo_completion

  complete -F _todo t
elif [ $DISTRO = Debian -o $DISTRO_BASE = Debian ] ; then
  # Force-load this (it's normally autoloaded first time it's needed, but in
  # this case an alias is being used) so the complete command works
  . /usr/share/bash-completion/completions/todo-txt

  complete -F _todo t
fi

alias t=${TODOTXT_CMD-todo.sh}
