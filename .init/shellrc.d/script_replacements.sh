if [ "$HOME_FS_NOEXEC" = y ] ; then
  alias s="bash ~/bin/smooth"
  for sh_script in dump-crontabs hostinfo userlist ; do
    alias $sh_script="sh ~/bin/$sh_script"
  done
  unset sh_script
  alias file-format="/usr/bin/awk -f ~/bin/file-format"
  alias fileinfo="/usr/bin/perl -- ~/bin/fileinfo"
fi
