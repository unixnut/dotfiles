export MOZ_PRINTER_NAME=hp
export PYTHONPATH=$HOME/lib:$PYTHONPATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Warpspace IT/bin" ] ; then
  PATH="$HOME/Warpspace IT/bin:$PATH"
fi
