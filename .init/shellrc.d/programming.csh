alias compile 'gcc -O -Wuninitialized -Wimplicit -Wformat -Wcomment -Wswitch -Wwrite-strings -I$HOME/Projects/include -o ~/bin/$BINARY_TYPE/\!:1:t:r \!*; rehash'
alias ocompile 'gcc -c -O -Wuninitialized -Wimplicit -Wformat -Wcomment -Wswitch -Wwrite-strings -I$HOME/Projects/include -o ~/Projects/lib/$BINARY_TYPE/\!:1:t:r.o \!*'
alias pcompile 'gcc -O -Wuninitialized -Wimplicit -Wformat -Wcomment -Wswitch -Wwrite-strings -I\!^:h -I$HOME/Projects/include -o $HOME/bin/$BINARY_TYPE/\!:1:h:t \!*; rehash'
alias jcompile 'javac -deprecation -d ~/bin/Classes'

