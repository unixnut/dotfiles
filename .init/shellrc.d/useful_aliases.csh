alias time_t date --rfc-2822 --date=@\!:1
alias hexdump od -tx1
alias ren mv \!:1 \!:1:h/\!:2
alias ovpn sudo openvpn --cd /etc/openvpn --config \!:1 --verb 5
alias ,v vim -i .viminfo
# Note that environment variables make grep use colour by default for a terminal
# Note: :q substitution in alias history references doesn't work
alias cgrep grep --color=yes '\!:*' \| less -R

# parallel compression tar aliases
alias pgtar tar --use-compress-program=pigz
alias pbtar tar --use-compress-program=pbzip2
alias pxtar tar --use-compress-program=pixz
