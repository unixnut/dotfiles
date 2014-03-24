if [ -n "$PS1" ] ; then
  _muttaliases()
  {
          aliases=( $( sed -rn 's|^alias[[:space:]]+([^[:space:]]+).*$|\1|p' \
                          ~/.mail_aliases ) )
          COMPREPLY=( "${COMPREPLY[@]}" $( compgen -W "${aliases[*]}" -- $cur ) )

          return 0
  }
fi
