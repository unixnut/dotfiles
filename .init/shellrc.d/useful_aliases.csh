alias time_t date --rfc-2822 --date=@\!:1
alias hexdump od -t cx1 '\!:*' \| ${PAGER}
alias ren mv \!:1 \!:1:h/\!:2
alias ovpn sudo openvpn --cd /etc/openvpn --config \!:1 --verb 5
alias ,v vim -i .viminfo
# Note that environment variables make grep use colour by default for a terminal
# See also 'mygrep' script in github.com/unixnut/scripts
if ($?MY_GREP_OPTIONS) alias grep grep '$MY_GREP_OPTIONS:x' '\!:*'
# Note: :q substitution in alias history references doesn't work
alias cgrep grep -Rn --color=yes '\!:*' \| less -R

alias cls     ls -FC  --group-directories-first --color=always '\!:*' \| less -RS
alias clls    ls -lF  --group-directories-first --color=always '\!:*' \| less -RS
alias cllls   ls -lF  --group-directories-first --color=always --time-style=full-iso '\!:*' \| less -RS
alias cals    ls -FCA --group-directories-first --color=always '\!:*' \| less -RS
alias calls   ls -lFA --group-directories-first --color=always '\!:*' \| less -RS
alias callls  ls -lFA --group-directories-first --color=always --time-style=full-iso '\!:*' \| less -RS
alias csls    sudo ls -FC --group-directories-first --color=always '\!:*' \| less -RS
alias cslls   sudo ls -lF --group-directories-first --color=always '\!:*' \| less -RS
alias csllls  sudo ls -lF --group-directories-first --color=always --time-style=full-iso '\!:*' \| less -RS
alias csals   sudo ls -FCA --group-directories-first --color=always '\!:*' \| less -RS
alias csalls  sudo ls -lFA --group-directories-first --color=always '\!:*' \| less -RS
alias csallls sudo ls -lFA --group-directories-first --color=always --time-style=full-iso '\!:*' \| less -RS

alias plast last -f /var/log/wtmp.1

# parallel compression tar aliases
alias pgtar tar --use-compress-program=pigz
alias pbtar tar --use-compress-program=pbzip2
alias pxtar tar --use-compress-program=pixz

# Use the whole command line as a date description
# (For %d/%m/%y run "date +%x")
alias shortdate "date -d '\!:*' +%d/%m/%Y"

alias t todo.sh

alias mycal ncal -bM
alias qcal ncal -bM -3
# vertical display; includes week number
alias vcal ncal -wM

# avoid wrapping by removing text beyond the width of the screen
alias chop 'cut -c1-$COLUMNS'

alias binary "python -c 'import sys ; print "\""{0:08b}"\"".format(int(sys.argv[1]))'"
