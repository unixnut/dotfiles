## export SERVICES=`awk '/^[a-z]/ { print $1; if (NF > 2 && $3 != "#") print $3; }' /etc/services|sort|uniq`
if [ ! -f ~/tmp/services.list -o /etc/services -nt ~/tmp/services.list ] ; then
  awk '/^[a-z]/ { print $1; if (NF > 2 && $3 != "#") print $3; }' /etc/services |sort|uniq > ~/tmp/services.list
fi
