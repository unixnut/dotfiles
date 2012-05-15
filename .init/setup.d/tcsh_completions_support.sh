## export SERVICES=`awk '/^[a-z]/ { print $1; if (NF > 2 && $3 != "#") print $3; }' /etc/services|sort|uniq`
make -f ~/.init/shellrc.d/Makefile ~/tmp/services.list
