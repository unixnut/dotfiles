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
  grep $MY_GREP_OPTIONS -Rn --color=yes "$@" | less -R
}

function csgrep
{
  sudo grep $GREP_OPTIONS $MY_GREP_OPTIONS -Rn --color=yes "$@" | less -R
}

if [ -n "$MY_GREP_OPTIONS" ] ; then
  alias grep='grep $MY_GREP_OPTIONS'
fi


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

# avoid wrapping by removing text beyond the width of the screen
alias chop='cut -c1-$COLUMNS'

# delete previous command, one before that, etc.
alias ,X='history -d $((HISTCMD - 1))'
alias ,XX='history -d $((HISTCMD - 2))'
alias ,XXX='history -d $((HISTCMD - 3))'

alias binary="python -c 'import sys ; print \"{0:08b}\".format(int(sys.argv[1]))'"

alias rot13="tr n-za-mN-ZA-M a-zA-Z"

# -- network stuff --
# Columns, colours, pager, and don't show IPv6 link-local addrs
function ipaddr
{
  ip $IP_FORCE_COLOUR_OPT -br addr |
    sed 's/ \(\x1b[^a-z]*.\)\?fe80:[^[:space:]]*//'|
    less -R
}

function _iproute_filter
{
  sed -e '/ \(\x1b[^a-z]*.\)\?via/ !s/ \(\x1b[^a-z]*.\)\?dev /\t&/' \
      -e '/ \(\x1b[^a-z]*.\)\?proto/ !s/ \(\x1b[^a-z]*.\)\?scope /\t&/' \
      -e 's/ \(\x1b[^a-z]*.\)\?\(dev\|via\) /\t/g' \
      -e '/ \(\x1b[^a-z]*.\)\?metric/ !s/ \(\x1b[^a-z]*.\)\?linkdown /\t&/' \
      -e 's/[[:space:]]\(\x1b[^a-z]*.\)\?\(proto\|scope\|link\|src\|metric\)\>//g'
}

# Columns, colours, pager, headings
function iproute
{
  local WHITE=$(setterm -bold on)
  local NORMAL=$(setterm -default)

  { echo ${WHITE}Dest Via Dev Proto Src Metric Flags${NORMAL}
    ip $IP_FORCE_COLOUR_OPT route |
      sed -e '/ \(\x1b[^a-z]*.\)\?src/ !s/ \(\x1b[^a-z]*.\)\?metric /\t&/' |
      _iproute_filter
    echo
    echo ${WHITE}Dest Via Dev Proto Metric Flags${NORMAL}
    ip -6 $IP_FORCE_COLOUR_OPT route | _iproute_filter
  } | column -tn -e | less -R
}


# == tcsh equivalents ==
alias ls-F='ls -F'
