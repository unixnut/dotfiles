# setting_fix.tcsh (C shell include file) -- fixes for various default tcsh settings

unset autologout
set listlinks
# like Bash
set autolist=ambiguous

# Make "popd +x" act in a sane manner
set dextract

# Stop pushd from running "dirs" automatically
# (the default is usually good though)
## set pushdsilent
