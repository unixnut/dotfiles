export DISTRO_FLAVOUR=$DISTRO
export DISTRO_FLAVOUR_CODENAME=$DISTRO_CODENAME
export DISTRO_FLAVOUR_RELEASE=$DISTRO_RELEASE

DISTRO=Ubuntu
case $DISTRO_FLAVOUR_RELEASE in
  10) # Julia
     DISTRO_RELEASE=10.10  # Maverick Meerkat
     DISTRO_CODENAME=maverick
     ;;
  11) # Katya
     DISTRO_RELEASE=11.04 # Natty Narwhal 
     DISTRO_CODENAME=natty
     ;;
  12) # Lisa
     DISTRO_RELEASE=11.10 # Oneiric Ocelot 
     DISTRO_CODENAME=oneiric
     ;;
  13) # Maya
     DISTRO_RELEASE=12.04 # Precise Pangolin  LTS
     DISTRO_CODENAME=precise
     ;;
  14) # Nadia
     DISTRO_RELEASE=12.10 # Quantal Quetzal 
     DISTRO_CODENAME=quantal
     ;;
  15) # Olivia
     DISTRO_RELEASE=13.04 # Raring Ringtail 
     DISTRO_CODENAME=raring
     ;;
  16) # Petra
     DISTRO_RELEASE=13.10 # Saucy Salamander 
     DISTRO_CODENAME=saucy
     ;;
  17|17.*) # Qiana, Rebecca, Rafaela
     DISTRO_RELEASE=14.04 # Trusty Tahr  LTS
     DISTRO_CODENAME=trusty
     ;;
  18) # 
     DISTRO_RELEASE=16.04 # Xenial Xerus  LTS
     DISTRO_CODENAME=xenial
     ;;
esac
