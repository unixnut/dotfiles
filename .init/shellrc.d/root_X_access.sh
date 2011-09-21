     if [ $SUDO_USER ]; then
         sudo -H -u $SUDO_USER xauth extract - $DISPLAY | xauth merge -
     fi
# ... from http://qref.sourceforge.net/Debian/reference/ch-tune.en.html
