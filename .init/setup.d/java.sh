# General environment variables:
if [ -n "$CLASSPATH" ] ; then
  export CLASSPATH=.:$HOME/bin/Classes:$CLASSPATH
else
  export CLASSPATH=.:$HOME/bin/Classes
fi
