# Makefile (userconfig/shells) for installing C shell include files into ~

DEST=~/.csh

install: *.tcsh
	if ! grep -q "MARKER:cshrc.snippet" ~/.cshrc ; then cat cshrc.snippet >> ~/.cshrc ; fi
	install -d $(DEST)
	install --mode=644 --preserve-timestamps $^ $(DEST)
