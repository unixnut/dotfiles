if [ -r ~/.mail_aliases ] ; then
  export MAIL_ALIASES=`sed -n 's/^alias *\([^\t ]*\).*/\1/p' ~/.mail_aliases`
fi
