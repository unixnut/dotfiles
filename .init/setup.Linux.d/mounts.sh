
# If /home is a separate filesystem, check if it is mounted noexec.
# First interrogate inode number, then mount options.
# (The root of an ext* filesystem has inode #2, for xfs it's #128.)
if expr $(ls -lid /home | cut -d" " -f1) : '^\(2\|128\)$' > /dev/null &&
   expr $(awk '$2 == "/home" { print $4; }' /proc/mounts) : '.*\<noexec\>.*' > /dev/null
then
  export HOME_FS_NOEXEC=y
fi
