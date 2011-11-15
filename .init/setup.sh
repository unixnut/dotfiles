export ZONE=`~/bin/zone`

# set OS, DISTRO, DISTRO_BASE and DISTRO_RELEASE
export OS=`uname`
if [ -x /usr/bin/lsb_release -o -x /bin/lsb_release -a -r /etc/lsb-release ] ; then
  export DISTRO=`lsb_release --id --short | sed 's/ LINUX//'`
  export DISTRO_RELEASE=`lsb_release --codename --short`
  if [ $DISTRO_RELEASE = n/a ] ; then
    export DISTRO_RELEASE=`lsb_release --release --short`
  fi
  if [ $DISTRO = Ubuntu ] ; then
    export DISTRO_BASE=Debian
  fi
else
  case $OS in
    Linux)
      if [ -f /etc/debian_version ] ; then
        export DISTRO=Debian
        export DISTRO_RELEASE=`sed 's@/.*@@' /etc/debian_version`  # everything prior to a slash
        case $DISTRO_RELEASE in
          3.1) DISTRO_RELEASE=sarge ;;
          4.0) DISTRO_RELEASE=etch ;;
          5.0*) DISTRO_RELEASE=lenny ;;
          6.0*) DISTRO_RELEASE=squeeze ;;
          7.0*) DISTRO_RELEASE=wheezy ;;
        esac
      elif [ -f /etc/redhat-release ] ; then
        export DISTRO=`awk 'NR==1 { if (/^Red Hat Enterprise Linux Server/) print "RHEL"; else print $1 }' /etc/redhat-release`
        export DISTRO_RELEASE=`awk 'NR==1 { if (/^Red Hat Enterprise Linux Server/) print $7; else print $3; }' /etc/redhat-release`
        if [ $DISTRO = CentOS -o $DISTRO = RHEL -o $DISTRO = Fedora ] ; then
          export DISTRO_BASE=RedHat
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
