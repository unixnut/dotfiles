# -*- mode: sh; sh-basic-offset: 2 -*-

# set -x
# set -u

_trac_userlist() {
  trac "$1" permission list | sed -n '/^-----/,/^$/p' | sed '1d;$d;s= \+.*==' | sort -u
}

_tracadmin() {
  local topic cmd topics
  topics="help initenv attachment changeset component config deploy hotcopy milestone
      permission priority repository resolution session severity ticket ticket_type
      upgrade version wiki"
  case $COMP_CWORD in
    1)
      compopt -o dirnames -o nospace
      return 0;;
    2)
      COMPREPLY=( $(compgen -W "$topics" -- "${COMP_WORDS[2]}") )
      return 0;;
  esac
  topic=${COMP_WORDS[2]}
  cmd=${COMP_WORDS[3]}
  case "$topic" in
    help)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "$topics" -- "$cmd") )
      return 0;;
    initenv)
      return 0;;
    attachment)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W  "add export list remove" -- "$cmd") )
      return 0 ;;
    changeset)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "added modified" -- "$cmd") )
      return 0 ;;
    component)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add chown list remove rename" -- "$cmd") )
      return 0 ;;
    config)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "get remove set" -- "$cmd") )
      return 0 ;;
    deploy)
      [[ $COMP_CWORD = 3 ]] || return 1
      return 0 ;;
    hotcopy)
      [[ $COMP_CWORD = 3 ]] || return 1
      return 0 ;;
    milestone)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add completed due list remove rename" -- "$cmd") )
      return 0 ;;
    permission)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add list remove" -- "$cmd") )
      return 0 ;;
    priority)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add change list order remove" -- "$cmd") )
      return 0 ;;
    repository)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add alias list remove resync set sync" -- "$cmd") )
      return 0 ;;
    resolution)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add change list order remove add" -- "$cmd") )
      return 0 ;;
    session)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "delete list purge set" -- "$cmd") )
      return 0 ;;
    severity)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add change list order remove" -- "$cmd") )
      return 0 ;;
    ticket)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "remove" -- "$cmd") )
      return 0 ;;
    ticket_type)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add change list order remove" -- "$cmd") )
      return 0 ;;
    upgrade)
      return 0 ;;
    version)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "add list remove rename time" -- "$cmd") )
      return 0 ;;
    wiki)
      [[ $COMP_CWORD = 3 ]] || return 1
      COMPREPLY=( $(compgen -W "dump export import list load remove rename replace upgrade" -- "$cmd") )
      return 0 ;;
  esac
  return 0
}
complete -F _tracadmin trac-admin trac-admin.py
