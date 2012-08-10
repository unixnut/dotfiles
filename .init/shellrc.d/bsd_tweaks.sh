if [ $DISTRO_BASE = RedHat ] ; then
  # this is necessary because view is a hard link to nvi
  alias view='vim -R'
fi
