README.txt: */*/*/.git/config
	awk '/github/ { print $$3 }' $^ > $@
	chmod a-w $@
