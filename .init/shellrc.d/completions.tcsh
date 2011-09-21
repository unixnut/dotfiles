# completions.tcsh (tcsh include file) -- Definitions of command-line completions

# test for an interactive session
if ($?prompt) then
  if (-f /etc/complete.tcsh) then
    source /etc/complete.tcsh

    # *** Fixes for variables used by completions ***
    # /etc/complete.tcsh sets $hosts from ~/.ssh/known_hosts but doesn't trim
    # entries with commas, so replace the contents
    set hosts=(`sed -n 's/Host //p' ~/.ssh/config`)
  endif


  # *** Completions for tcsh builtins ***
  # environment/shell variable builtins: 

  # other builtins:
  complete alias 'p/1/a/' 'p/2/c/'


  # *** Completions for apps ***
  # override the one from /etc/complete.tcsh to add a completion for -C
  complete make \
      'n/-f/f/' \
      'c/*=/f/' \
      'n/-C/d/' \
      'n@*@`cat -s GNUmakefile Makefile makefile |& sed -n -e "/No such file/d" -e "/^[^     #].*:/s/:.*//p"`@'

  # The Java Compiler takes any of the listed options, followed by 1+ .java files:
  complete javac 'c/-/(verbose g O debug depend nowarn classpath nowrite d)/' 'n/-classpath/d/' 'n/-d/d/' 'p/1-/f:*.java/'

  # The Java Virtual Machine, javap and rmic:
  complete '{rmic,java{,p}}' 'p%1%`( cd ~/bin/Classes ; echo *.class ) | sed -e s/\.class//g`%'
  ## # The class must also contain a main method, so source files are
  ## # searched and then name-transformed to get the completion list:
  ## complete java 'p%1-%`egrep -l "^main[ 	]*\(|[^a-zA-Z_]main[ 	]*\(" *.java | sed "s/\.java//g"`%'

  # == mutt ==
  if ($?MAIL_ALIASES) then
    set malias_list = ($MAIL_ALIASES)
    complete mutt c@=@F:$HOME/Mail/@ n/-f/f/ 'n/-[afFHi]/f/' 'p/*/$malias_list/'
    complete xcompose 'n/-[afFHi]/f/' 'p/*/$malias_list/'
    complete xmuttf c@=@F:$HOME/Mail/@
  endif

  # == common Unix commands ==
  ## complete '[rs]sh' 'c/*@/$host_list/' 'p/1/$host_list/' 'n/-*/$host_list/' p/2/c/ 'N/-[obfiecmpLRD]/$host_list/' 'N/-*/c/' n/-l/u/ N/-l/c/
  ## complete '*ftp' 'p/1/$host_list/' 'n/-*/$host_list/'
  ## complete finger 'p/*/u/'
  complete groups 'p/*/u/'
  ## complete dd 'c/[io]f=/f/'      # Allows completions of pathnames given after if= and of=
  complete su p/1/u/ 'n/-*/u/' 'n/-c/c/'
  complete sudo p/1/c/
  complete last 'p/1/u/'
  # override the one from /etc/complete.tcsh as the p,n,N items are annoying
  complete ln 'c/--/(backup directory force no-dereference interactive symbolic suffix verbose version-control help version)/' 'c/-/(b d F f i n S s V v -)/' 'n/{-S,--suffix}/x:<suffix>/' 'n/{-V,--version-control}/(t numbered nil existing never simple)/'

  # == X apps ==
  complete xterm 'n/-e/c/'
  # fix existing one
  complete {gv,ghostview}	'n/*/f:*.{ps,eps,epsi,pdf}/'

  # == Debian-specific commands ==

  # == my commands ==
  complete rcon 'p/1/c/'  'n/-h/$host_list/' 'n/-*/c/'  'N/-h/c/'  # first n overrides second
endif
