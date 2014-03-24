# The following aliases are still needed when a command is run using the
# shell's -c option, AND they are still needed if there is no terminal defined.
# (Otherwise "ssh andromeda rm /tmp/q" would be dangerous.)
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
