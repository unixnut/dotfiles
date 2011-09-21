# hist_bindings.tcsh (C shell include file) -- extra/additional bindings for history manipulation

# == key bindings ==
bindkey -b M-p i-search-back
bindkey ^\[p i-search-back
bindkey -b M-n i-search-fwd
bindkey ^\[n i-search-fwd

# Ctrl-up/down bindings (for gterm)
bindkey '^[[5A' history-search-backward
bindkey '^[[1;5A' history-search-backward
bindkey '^[[5B' history-search-forward
bindkey '^[[1;5B' history-search-forward
