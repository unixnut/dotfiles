if [ $OS = FreeBSD ] ; then
  # this is necessary because view is a hard link to nvi
  alias view='vim -R'
fi
