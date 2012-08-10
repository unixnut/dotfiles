if [ $OS = FreeBSD ] ; then
  # this is necessary because view is a hard link to vi (provided by 'vim-minimal')
  alias view='vim -R'
fi
