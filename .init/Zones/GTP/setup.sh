export REPLYTO='Alastair Irvine <alastair@warpspace.net>'

# If /home is a separate filesystem, assume /home is moutned noexec
# TO-DO: check /var instead, or interrogate mount options
if [ $(ls -lid /home | cut -d" " -f1) = 2 ] ; then
  export HOME_FS_NOEXEC=y
fi
