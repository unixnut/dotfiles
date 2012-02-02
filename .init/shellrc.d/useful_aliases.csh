alias time_t date --rfc-2822 --date=@\!:1
alias hexdump od -tx1
alias ren mv \!:1 \!:1:h/\!:2
alias ovpn sudo openvpn --cd /etc/openvpn --config \!:1 --verb 5
