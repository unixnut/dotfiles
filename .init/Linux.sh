for file in .init/setup.Linux.d/*.sh ; do
  . $file
done

case $DISTRO_BASE in
  Debian) . .init/debian.sh 
          # might need to handle Ubuntu stuff as well
          ;;
esac

