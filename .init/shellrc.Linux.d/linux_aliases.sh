alias ,t='cat /proc/acpi/thermal_zone/*/temperature'
alias ,f='cat /proc/acpi/fan/*/state'
alias ,b='cat /sys/class/power_supply/BAT*/uevent'
alias ,i='netstat --interfaces --extend'
alias ,r='netstat --route --numeric'
# use --numeric-hosts to avoid using libnss_mdns4 to reduntantly
# reverse-resolve global IPv4 addresses
alias ,s='netstat -l --tcp --numeric-hosts'
alias ,u='netstat -l --udp --numeric-hosts'
## --numeric
alias ,m='free -m'
alias ,p='cat /proc/partitions'
alias ,d='df -hT -x tmpfs -x devtmpfs'

alias plast="last -f /var/log/wtmp.1"
