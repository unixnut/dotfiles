if ($tty != "") then
  # The following aliases are still needed when a command is run using the
  # shell's -c option, but they are not needed if there is no terminal defined:
  alias rm rm -i
  alias mv mv -i
  alias cp cp -i
endif
