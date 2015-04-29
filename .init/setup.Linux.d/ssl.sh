if [ $DISTRO_BASE = RedHat ] ; then
  export SSL_PATH=/etc/pki/tls
else
  export SSL_PATH=/etc/ssl
fi
