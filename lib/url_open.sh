#! /bin/sh
# url_open.sh (Bourne shell script) -- show a URL then offer to open it

# No need to do this as urlview has announced which URL it's opening
## echo "$@"

echo 
echo -n "Open in browser? [y/N]: "
if read answer 
then
  if [ "$answer" = y ] ; then
    exec "$(dirname "$0")/url_handler.sh" "$@"
  fi
fi
