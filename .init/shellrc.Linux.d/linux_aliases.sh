alias ,t='cat /proc/acpi/thermal_zone/*/temperature'
alias ,f='cat /proc/acpi/fan/*/state'
alias ,b='cat /sys/class/power_supply/BAT*/uevent'
alias ,i='netstat --interfaces --extend'
alias ,r='netstat --route --numeric'
alias ,a=
# TO-DO: change to ss
# use --numeric-hosts to avoid using libnss_mdns4 to reduntantly
# reverse-resolve global IPv4 addresses
alias ,s='netstat -l --tcp --numeric-hosts'
alias ,u='netstat -l --udp --numeric-hosts'
## --numeric
alias ,m='free -m'
alias ,p='cat /proc/partitions'
alias ,d='df -hT -x tmpfs -x devtmpfs'

# Special quoting required for !~ within double quotes
alias ,D="awk '\$2 != \"/proc/sys/fs/binfmt_misc\" && \$2 != \"/sys/fs/cgroup\" && \$3 "\!\~" /^(binfmt_misc|nfsd|rpc_pipefs|hugetlbfs|debugfs|mqueue|selinuxfs|configfs|cgroup|pstore|devpts|securityfs|devtmpfs|proc|fusectl)\$/ { gsub(/,data=ordered/, \"\", \$4); print \$1 \" \" \$2 \" \" \$3 \" \" \$4; }' /proc/mounts | column -t"

alias plast="last -f /var/log/wtmp.1"
