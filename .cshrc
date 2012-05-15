# .cshrc (csh auto-parse script) -- parsed by csh or tcsh on startup
# NOTE: /etc/csh.cshrc is parsed first

if ($tty != "") then
  set implicitcd = verbose

  # -- command history --
  # avoid re-entering the previous command to the history
  set histdup = prev
  ## set savehist = (150 merge)

  # -- directory stack --
  ## set savedirs

  # == terminal & interactive tests ==
  if ($?TERM) then
    # enable color support of ls and also add handy aliases
    if ("$TERM" != "dumb") then
      alias ls 'ls --color=auto'
      set color      # do the same for ls-F
    endif

    # test for an interactive session
    if ($?prompt) then
      set fignore = ( \~ .o .class .pyc .bak )
    endif
  endif
endif

# -- run additional commands in include files --
foreach inc_file (~/.init/shellrc.d/*.csh)
  source $inc_file
end

if ($?tcsh && "`find ~/.init/shellrc.d -follow -maxdepth 1 -name \*.tcsh`" != "") then
  foreach inc_file (~/.init/shellrc.d/*.tcsh)
    source $inc_file
  end
endif
