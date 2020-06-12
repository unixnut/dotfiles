if [ -n "$BASH_VERSION" ] ; then
	shopt -s globstar dirspell histreedit no_empty_cmd_completion
	shopt -u force_fignore
	shopt -u extglob
fi
