# Splits the parameter, being a string of the form x.y or x.y.z into
# the component versions and prints them, e.g. "x y 0" or "x y z", respectively.
ver_split()
{
  local spl major minor pl

  export major=${1%%.*}
  # minor version and patchlevel
  spl=${1#*.}
  export minor=${spl%%.*}
  # If there's no patch level, the remaining string will be the same as the
  # extracted minor version only. 
  if [ $spl = $minor ] ; then
    export pl=0
  else
    export pl=${spl#*.}
  fi

  echo $major $minor $pl
}

