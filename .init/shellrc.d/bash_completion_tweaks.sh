_muttaliases()
{
	aliases=( $( sed -rn 's|^alias[[:space:]]+([^[:space:]]+).*$|\1|p' \
			~/.mail_aliases ) )
	COMPREPLY=( "${COMPREPLY[@]}" $( compgen -W "${aliases[*]}" -- $cur ) )

	return 0
}

