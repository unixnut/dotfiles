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
  grep -Rn --color=yes "$@" | less -R
}

function cls
{
  ls -lF --color=always "$@" | less -RS
}

# Shows sar output for a given day; default yesterday
function psar
{
  local day=${1-$(date +%d -d yesterday)}
  if [ $DISTRO_BASE = RedHat ] ; then
    sar -f /var/log/sa/sa$day | less
  else
    sar -f /var/log/sysstat/sa$day | less
  fi
}

alias plast='last -f /var/log/wtmp.1'

# parallel compression tar aliases
alias pgtar='tar --use-compress-program=pigz'
alias pbtar='tar --use-compress-program=pbzip2'
alias pxtar='tar --use-compress-program=pixz'

# Use the whole command line as a date description
# (For %d/%m/%y run "date +%x")
shortdate()
{
  date -d "$*" +%d/%m/%Y
}


# == tcsh equivalents ==
alias ls-F='ls -F'
