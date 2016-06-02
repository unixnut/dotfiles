if [ -f /opt/todo.txt-cli/todo_completion ] ; then
  . /opt/todo.txt-cli/todo_completion

  # Already done in .init/shellrc.d/useful_aliases.sh
  ## alias t=todo.sh

  complete -F _todo t
fi
