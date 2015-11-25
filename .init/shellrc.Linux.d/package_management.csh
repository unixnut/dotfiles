if ($?prompt) then
  if ($?tcsh) then
    switch ($DISTRO_BASE)
      case Debian:
        bindkey -s "\ei" "sudo aptitude install "
        bindkey -s "\eI" "sudo aptitude install --without-recommends "

        # mnemonic: "eXpunge"
        bindkey -s "\ex" "sudo aptitude remove "
        bindkey -s "\eX" "sudo aptitude purge "

        bindkey -s "\es" "apt-cache search "
        bindkey -s "\eS" "apt-cache search -n "

        # mnemonic: "query"
        bindkey -s "\eq" "apt-cache show "
        bindkey -s "\eQ" "aptitude show "

        # mnemonic: "origin"
        bindkey -s "\eo"  "apt-cache policy "

        # mnemonic: "refresh"
        bindkey -s "\eR" "sudo apt-get update"

        bindkey -s "\eU" "sudo aptitude safe-upgrade"
        breaksw

      case RedHat:
        bindkey -s "\ei" "sudo yum install "

        # mnemonic: "eXpunge"
        bindkey -s "\ex" "sudo yum erase "

        bindkey -s "\es" "yum search "
        ## bindkey -s "\eS" "apt-cache search -n "

        # mnemonic: "query"
        bindkey -s "\eq" "yum info "

        # mnemonic: "origin"
        bindkey -s "\eo"  "yum list "

        bindkey -s "\eU" "sudo yum update"
        breaksw
    endsw
  endif
endif
