alias time_t date --rfc-2822 --date=@\!:1
alias hexdump od -tx1
alias ren mv \!:1 \!:1:h/\!:2
alias ovpn sudo openvpn --cd /etc/openvpn --config \!:1 --verb 5
alias ,v vim -i .viminfo
# Note that environment variables make grep use colour by default for a terminal
# Note: :q substitution in alias history references doesn't work
alias cgrep grep -Rn --color=yes '\!:*' \| less -R
alias cls ls -lF --color=always '\!:*' \| less -RS
alias plast last -f /var/log/wtmp.1

# parallel compression tar aliases
alias pgtar tar --use-compress-program=pigz
alias pbtar tar --use-compress-program=pbzip2
alias pxtar tar --use-compress-program=pixz

# Use the whole command line as a date description
# (For %d/%m/%y run "date +%x")
alias shortdate "date -d '\!:*' +%d/%m/%Y"

# avoid wrapping by removing text beyond the width of the screen
alias chop 'cut -c1-$COLUMNS'
