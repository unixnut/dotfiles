# The Linux console on Linux Mint doesn't set the locale stuff
if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
elif [ -r /etc/sysconfig/i18n ]; then
  . /etc/sysconfig/i18n
  export LANG LANGUAGE
fi

# now hack it to remove the UTF-8 suffix if on a Linux console
if [ $TERM = linux ] ; then
  export LANG=${LANG%.UTF-8}
fi
