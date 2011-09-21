export ZONE=`~/bin/zone`

# set OS, DISTRO, DISTRO_BASE and DISTRO_RELEASE
export OS=`uname`
if [ -x /usr/bin/lsb_release -o -x /bin/lsb_release ] ; then
  export DISTRO=`lsb_release --id --short`
  export DISTRO_RELEASE=`lsb_release --codename --short`
  if [ $DISTRO = Ubuntu ] ; then
    export DISTRO_BASE=Debian
  fi
else
  case $OS in
    Linux)
      if [ -f /etc/debian_version ] ; then
        export DISTRO=Debian
        export DISTRO_RELEASE=`sed 's@/.*@@' /etc/debian_version`  # everything prior to a slash
        if [ $DISTRO_RELEASE = 3.1 ]; then
          DISTRO_RELEASE=sarge
        fi
      elif [ -f /etc/redhat-release ] ; then
        export DISTRO=`awk 'NR==1 { print $1 }' /etc/redhat-release`
        export DISTRO_RELEASE=`awk 'NR==1 { if (/^Red Hat Enterprise Linux Server/) print "RHEL"; else print $3; }' /etc/redhat-release`
        if [ $DISTRO = CentOS ] ; then
          export DISTRO_BASE=RHEL
        fi
      else
        export DISTRO=unknown DISTRO_RELEASE=unknown
      fi
      ;;

    *)
      export DISTRO=non-linux DISTRO_RELEASE=unknown
  esac
fi

if [ -z $DISTRO_BASE ] ; then
  export DISTRO_BASE=$DISTRO
fi

# == other useful stuff ==
if [ -z "$EUID" -a -x /usr/bin/id ]; then
  export EUID=`id -u`
  export UID=`id -ru`
fi

# == platform-specific ==
## . .init/$OS.sh
case $DISTRO_BASE in
  Debian) . .init/debian.sh 
          # might need to handle Ubuntu stuff as well
          ;;
esac

# == other ==
for file in .init/setup.d/*.sh ; do
  . $file
done

if [ -r .init/Zones/$ZONE/setup.sh ]; then
  . .init/Zones/$ZONE/setup.sh
fi
