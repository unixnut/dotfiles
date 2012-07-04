if [ -z "$GENERICUSER" ] ; then
  # this overrides DEBEMAIL so it isn't needed:
  ## export REPORTBUGEMAIL=alastair@plug.org.au

  export DEBEMAIL=alastair@plug.org.au
  export DEBFULLNAME="Alastair Irvine"
fi

export PATH=/usr/lib/ssl/misc/:$PATH
