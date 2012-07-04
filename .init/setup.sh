export ZONE=`~/bin/zone`

# set OS, DISTRO, DISTRO_BASE and DISTRO_RELEASE{,_MAJOR,_MINOR,_PL}
# also set DISTRO_CODENAME (only useful for Debian/Ubuntu)
export OS=`uname`
if [ \( -x /usr/bin/lsb_release -o -x /bin/lsb_release \) -a -r /etc/lsb-release ] ; then
  export DISTRO=`lsb_release --id --short | sed 's/ LINUX//'`
  export DISTRO_CODENAME=`lsb_release --codename --short`
  export DISTRO_RELEASE=`lsb_release --release --short`
else
  case $OS in
    Linux)
      if [ -f /etc/debian_version ] ; then
        export DISTRO=Debian
        export DISTRO_RELEASE=`sed 's@/.*@@' /etc/debian_version`  # everything prior to a slash
        case $DISTRO_RELEASE in
          3.1)  export DISTRO_CODENAME=sarge ;;
          4.0)  export DISTRO_CODENAME=etch ;;
          5.0*) export DISTRO_CODENAME=lenny ;;
          6.0*) export DISTRO_CODENAME=squeeze ;;
          7.0*) export DISTRO_CODENAME=wheezy ;;
          *)  # anything else is assumed to be a codename
              # (e.g. /etc/debian_version contents is "blah/sid")
              export DISTRO_CODENAME=$DISTRO_RELEASE
              export DISTRO_RELEASE=8.0.beta 
              ;;
        esac
      elif [ -f /etc/redhat-release ] ; then
        export DISTRO=`awk 'NR==1 { if (/^Red Hat Enterprise Linux Server/) print "RHEL"; else print $1 }' /etc/redhat-release`
        export DISTRO_RELEASE=`awk 'NR==1 { if (/^Red Hat Enterprise Linux Server/) print $7; else print $3; }' /etc/redhat-release`
      else
        export DISTRO=unknown DISTRO_RELEASE=unknown
      fi
      ;;

    *)
      export DISTRO=non-linux DISTRO_RELEASE=unknown
  esac
fi

# -- DISTRO_BASE --
if [ $DISTRO = CentOS -o $DISTRO = RHEL -o $DISTRO = Fedora ] ; then
  export DISTRO_BASE=RedHat
  export DISTRO_CODENAME=unknown
elif [ $DISTRO = Ubuntu ] ; then
  export DISTRO_BASE=Debian
else
  export DISTRO_BASE=$DISTRO
fi

if [ -z "$DISTRO_CODENAME" ] ; then
  export DISTRO_CODENAME=unknown
fi

# -- DISTRO_RELEASE_{MAJOR,MINOR,PL} --
export DISTRO_RELEASE_MAJOR=${DISTRO_RELEASE%%.*}
# minor version and patchlevel
spl=${DISTRO_RELEASE#*.}
export DISTRO_RELEASE_MINOR=${spl%%.*}
# If there's no patch level, the remaining string will be the same as the
# extracted minor version only. 
if [ $spl = $DISTRO_RELEASE_MINOR ] ; then
  export DISTRO_RELEASE_PL=0
else
  export DISTRO_RELEASE_PL=${spl#*.}
fi
unset spl

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
