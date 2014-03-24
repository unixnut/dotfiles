if [ -t 0 ] ; then
  alias sless="LESSOPEN='my_lessopen \"%s\"' LESSCLOSE='$LESSCLOSE_PROG \"%s\" \"%s\"' less"
fi
