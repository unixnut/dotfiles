function time_t
{
  date --rfc-2822 --date=@$1
}


function hexdump
{
  od -t cx1 "$@" | ${PAGER:-less}
}


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


alias ,v="vim -i .viminfo"

# Note that environment variables make grep use colour by default for a terminal
function cgrep
{
  # When run, this will use the actual grep because alias parsing happens at
  # function defintion time
  grep -Rn --color=yes $MY_GREP_OPTIONS "$@" | less -R
}

if [ -n "$MY_GREP_OPTIONS" ] ; then
  alias grep='grep $MY_GREP_OPTIONS'
fi


function cls
{
  ls -FC --group-directories-first --color=always "$@" | less -RS
}


function clls
{
  ls -lF --group-directories-first --color=always "$@" | less -RS
}


function cllls
{
  ls -lF --group-directories-first --color=always --time-style=full-iso "$@" | less -RS
}


function cals
{
  ls -FCA --group-directories-first --color=always "$@" | less -RS
}



function calls
{
  ls -lFA --group-directories-first --color=always "$@" | less -RS
}



function callls
{
  ls -lFA --group-directories-first --color=always --time-style=full-iso "$@" | less -RS
}



function csls
{
  sudo ls -FC --group-directories-first --color=always "$@" | less -RS
}



function cslls
{
  sudo ls -lF --group-directories-first --color=always "$@" | less -RS
}



function csllls
{
  sudo ls -lF --group-directories-first --color=always --time-style=full-iso "$@" | less -RS
}



function csals
{
  sudo ls -FCA --group-directories-first --color=always "$@" | less -RS
}



function csalls
{
  sudo ls -lFA --group-directories-first --color=always "$@" | less -RS
}



function csallls
{
  sudo ls -lFA --group-directories-first --color=always --time-style=full-iso "$@" | less -RS
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

alias mycal='ncal -bM'
alias qcal='ncal -bM -3'
# vertical display; includes week number
alias vcal='ncal -wM'

alias t=todo.sh

# avoid wrapping by removing text beyond the width of the screen
alias chop='cut -c1-$COLUMNS'

# delete previous command, one before that, etc.
alias ,X='history -d $((HISTCMD - 1))'
alias ,XX='history -d $((HISTCMD - 2))'
alias ,XXX='history -d $((HISTCMD - 3))'

alias binary="python -c 'import sys ; print \"{0:08b}\".format(int(sys.argv[1]))'"

# == tcsh equivalents ==
alias ls-F='ls -F'
