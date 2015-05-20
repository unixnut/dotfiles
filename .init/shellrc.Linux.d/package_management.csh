if ($?prompt) then
  if ($?tcsh) then
    switch ($DISTRO_BASE)
      case Debian:
        bindkey -s "\ei" "sudo aptitude install "
        bindkey -s "\eI" "sudo aptitude install --without-recommends "
        bindkey -s "\ex" "sudo aptitude remove "
        bindkey -s "\eX" "sudo aptitude purge "
        bindkey -s "\es" "apt-cache search "
        bindkey -s "\eS" "apt-cache search -n "
        bindkey -s "\eq" "apt-cache show "
        bindkey -s "\eQ" "aptitude show "
        bindkey -s "\eR" "sudo apt-get update"
        bindkey -s "\eU" "sudo aptitude safe-upgrade"
        breaksw

      case RedHat:
        bindkey -s "\ei" "sudo yum install "
        bindkey -s "\ex" "sudo yum erase "
        bindkey -s "\es" "yum search "
        ## bindkey -s "\eS" "apt-cache search -n "
        bindkey -s "\eq" "yum info "
        bindkey -s "\eU" "sudo yum update"
        breaksw
    endsw
  endif
endif
