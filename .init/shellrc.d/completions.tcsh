# completions.tcsh (tcsh include file) -- Definitions of command-line completions

# test for an interactive session
if ($?prompt) then
  if (-f /etc/complete.tcsh) then
    source /etc/complete.tcsh

    # *** Fixes for variables used by completions ***
    # /etc/complete.tcsh sets $hosts from ~/.ssh/known_hosts but doesn't trim
    # entries with commas, so replace the contents
    set hosts=(`sed -n 's/^Host \([^*][^ \t#]*\).*/\1/p' ~/.ssh/config`)
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
              'n/*/(add gencaches showpkg stats dump dumpavail unmet show \
              search depends pkgnames dotty policy rdepends)/'
    # override the one from /etc/complete.tcsh to add --no-install-recommends, etc.
    complete apt-get \
	        'c/--/(build config-file diff-only download-only \
		   fix-broken fix-missing force-yes help ignore-hold no-download \
		   no-upgrade option print-uris purge reinstall quiet simulate \
		   show-upgraded target-release tar-only version yes \
                   no-install-recommends ignore-missing dry-run no-act \
                   only-upgrade list-cleanup trivial-only no-remove auto-remove \
                   only-source arch-only)/' \
	    	'c/-/(b c= d f h m o= q qq s t x y )/' \
 		'n/{source,build-dep}/x:<pkgname>/' \
 		'n/{remove}/`dpkg -l|grep ^ii|awk \{print\ \$2\}`/' \
 		'n/{install}/`apt-cache pkgnames | sort`/' \
 		'C/*/(update upgrade dselect-upgrade source \
		   build-dep check clean autoclean install remove)/'

  complete aptitude \
              'n/{install,hold,markauto,unmarkauto,dist-upgrade,safe-upgrade,full-upgrade,download,show,changelog,why,why-not,upgrade,build-dep}/`apt-cache pkgnames | sort`/' \
              'n/*/(install hold markauto unmarkauto dist-upgrade safe-upgrade download show changelog purge remove reinstall forbid-version unhold autoclean clean forget-new search upgrade safe-upgrade full-upgrade update why why-not upgrade build-dep)/'
  ## purge|remove|reinstall|forbid-version|upgrade   installed
  ## unhold) COMPREPLY=( $( _comp_dpkg_hold_packages $cur ) )

  complete phpunit \
              'c/--/(log-junit log-tap log-json coverage-html coverage-clover coverage-source story-html story-text testdox-html testdox-text filter group exclude-group list-groups loader repeat story tap testdox colors stderr stop-on-failure verbose wait skeleton-class skeleton-test process-isolation no-globals-backup static-backup syntax-check bootstrap configuration no-configuration include-path help version)/'

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
  # override the one from /etc/complete.tcsh because the p,n,N items are annoying
  complete ln 'c/--/(backup directory force no-dereference interactive symbolic suffix verbose version-control help version)/' 'c/-/(b d F f i n S s V v -)/' 'n/{-S,--suffix}/x:<suffix>/' 'n/{-V,--version-control}/(t numbered nil existing never simple)/'
  # override the one from /etc/complete.tcsh because the filenames exclude source file extentions
  complete rm 'c/--/(directory force interactive verbose recursive help version)/' 'c/-/(d f i v r R -)/'
  set services=`cat ~/tmp/services.list`  # see .init/setup.d/tcsh_completions_support.sh
  complete getent n/passwd/u/ n/group/g/ "n/services/($services)/" 'n/*/(passwd group hosts services protocols networks ahosts ahostsv4 ahostsv6 aliases ethers netgroup rpc shadow)/'


  # == X apps ==
  complete xterm 'n/-e/c/'
  # fix existing one
  complete {gv,ghostview}	'n/*/f:*.{ps,eps,epsi,pdf}/'

  # == Debian-specific commands ==

  # == my commands ==
  complete rcon 'p/1/c/'  'n/-h/$host_list/' 'n/-*/c/'  'N/-h/c/'  # first n overrides second
endif
