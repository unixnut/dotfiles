# misc_bindings.tcsh (C shell include file) -- assorted useful command-line bindings

if ($?prompt) then
  switch ($TERM)
    case xterm*:
      # Ctrl-left/right bindings (for gterm)
      bindkey '^[[5C' forward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^[[5D' backward-word
      bindkey '^[[1;5D' backward-word
      breaksw

    case vt*:
      bindkey '\217A' up-history
      bindkey '\217B' down-history
      bindkey '\217D' backward-char
      bindkey '\217C' forward-char
      breaksw
  endsw
endif
