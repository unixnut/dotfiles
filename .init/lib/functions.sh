# Splits the parameter, being a string of the form x.y or x.y.z into
# the component versions and prints them, e.g. "x y 0" or "x y z", respectively.
ver_split()
{
  local ver major minor pl

  # Chops characters off the end that don't match 0-9 or ".".
  ver=${1%%[!0-9.]*}

  major=${ver%%.*}
  pl=0

  # minor version and patchlevel
  case $ver in
    *.*.*) minor=$(echo "$ver" | sed 's/.*\.\([^.]*\)\..*/\1/') ; pl=${ver##*.} ;;
    *.*)   minor=${ver#*.} ;;
    *)     minor=0 ;;
  esac

  echo $major $minor $pl
}

