if [ -n "$PS1" ] ; then
  if [ -f /opt/todo.txt-cli/todo_completion ] ; then
    . /opt/todo.txt-cli/todo_completion

    complete -F _todo t
  elif [ -f /usr/share/bash-completion/completions/todo-txt ] ; then
    # Force-load this (it's normally autoloaded first time it's needed, but in
    # this case an alias is being used) so the complete command works
    . /usr/share/bash-completion/completions/todo-txt

    complete -F _todo t
  fi
fi

alias t=${TODOTXT_CMD-todo.sh}
