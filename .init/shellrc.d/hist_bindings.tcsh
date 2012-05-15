# hist_bindings.tcsh (C shell include file) -- extra/additional bindings for history manipulation

# == key bindings ==
bindkey "\e[15~"   i-search-back     # F5 searches backwards
bindkey "\e[15;2~" i-search-fwd      # S-F5 searches forwards

# -- bash compatibility --
bindkey -b M-p i-search-back
bindkey '^[p' i-search-back
bindkey -b M-n i-search-fwd
bindkey '^[n' i-search-fwd

# -- search based on starting contents of line --
bindkey "\eOR" history-search-backward        # F3 searches backwards
bindkey "\eOS" history-search-forward         # F4 searches forwards

# Ctrl-up/down bindings (for gterm)
bindkey '^[[5A' history-search-backward
bindkey '^[[1;5A' history-search-backward
bindkey '^[[5B' history-search-forward
bindkey '^[[1;5B' history-search-forward
