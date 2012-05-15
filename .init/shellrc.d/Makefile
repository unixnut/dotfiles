# Makefile 

~/tmp/services.list: /etc/services
	awk '/^[a-z]/ { print $$1; if (NF > 2 && $$3 != "#") print $$3; }' $^ |sort|uniq > $@
