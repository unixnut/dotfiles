if [ -n "$BASH_VERSION" ] ; then
	shopt -s globstar dirspell histreedit no_empty_cmd_completion
	shopt -u force_fignore
	# Unsetting this breaks completion, e.g. `_filedir_xspec()`
	# in /usr/share/bash-completion/bash_completion
	## shopt -u extglob
fi
