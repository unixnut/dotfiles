function time_t
{
  date --rfc-2822 --date=@$1
}
alias hexdump='od -tx1 '

# changes the name of a file without moving it to a different directory
function ren
{
  local destdir=${1%/*}
  mv "$1" "$destdir/$2"
}

function ovpn
{
  sudo openvpn --cd /etc/openvpn --config $1 --verb 5
}

alias .v="vim -i .viminfo"
# Note that environment variables make grep use colour by default for a terminal
function cgrep
{
  grep --color=yes "$@" | less -R
}

# == tcsh equivalents ==
alias ls-F='ls -F'
