function time_t
{
  date --rfc-2822 --date=@$1
}
alias hexdump='od -tx1 '
alias ls-F='ls -F'
function ovpn
{
  sudo openvpn --cd /etc/openvpn --config $1 --verb 5
}
