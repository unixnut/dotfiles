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

  # override the one from /etc/complete.tcsh to add a completion for rdepends
  complete apt-cache \
              'c/--/(all-versions config-file generate full help important \
              names-only option pkg-cache quiet recurse src-cache version )/' \
              'c/-/(c= h i o= p= q s= v)/' \
              'n/{search}/x:<regex>/' \
              'n/{pkgnames,policy,show,showpkg,depends,dotty,rdepends}/`apt-cache pkgnames | sort`/' \
              'C/*/(add gencaches showpkg stats dump dumpavail unmet show \
              search depends pkgnames dotty policy rdepends)/'

  ##   complete aptitude \
  ## install|hold|markauto|unmarkauto|dist-upgrade|download|show|changelog)) COMPREPLY=( $( apt-cache pkgnames $cur 2> /dev/null ) )
  ## purge|remove|reinstall|forbid-version   installed
  ## unhold) COMPREPLY=( $( _comp_dpkg_hold_packages $cur ) )
  ## autoclean|clean|forget-new|search|upgrade|update

  # -- from http://notes.depad.fr/2011/05/28/mon-tcshrc.html --
  complete git p/1/"(add am apply archive bisect branch config checkout clone commit  \
        count-objects describe diff fetch fsck gc grep init ls-files log merge mv pull push \
        prune rebase repack reset revert rm remote show show-branch status tag version)"/
  complete cvs 'c/--/(help help-commands help-synonyms)/' \
        'p/1/(add admin annotate checkout commit diff \
        edit editors export history import init log login \
        logout rdiff release remove rtag status tag unedit \
        update watch watchers)/' 'n/-a/(edit unedit commit \
        all none)/' 'n/watch/(on off add remove)/'
  complete svn 'C@file:///@`'"${HOME}/etc/tcsh/complete.d/svn"'`@@' \
               'n@ls@(file:/// svn+ssh:// svn://)@@' \
               'n@help@(add blame cat checkout \
               cleanup commit copy delete diff export help \
               import info list ls lock log merge mkdir \
               move propdel propedit propget proplist \
               propset resolved revert status switch unlock \
               update)@' 'p@1@(add blame cat checkout \
               cleanup commit copy delete diff export help \
               import info list ls lock log merge mkdir \
               move propdel propedit propget proplist \
               propset resolved revert status switch unlock \
               update)@'

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
