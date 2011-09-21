alias time_t perl -e \''print localtime($ARGV[0]) . "\n"'\'
alias hexdump od -tx1
alias ren mv \!:1 \!:1:h/\!:2
alias ovpn sudo openvpn --cd /etc/openvpn --config \!:1 --verb 5
