if ($?prompt) then
  # begin with Emacs bindings & change
  # (Emacs bindings are the default. For some reason, this command 
  # removes ^[[3~, etc.)
  ## bindkey -e

  bindkey '^[^M' prefix-meta

  # -- completion --
  # don't change the normal binding like I used to
  ## bindkey ^I complete-word-fwd             # cycles through file list
  ## bindkey '^[^I' complete-word-back        # while ^[^I and ...
  ## bindkey '\211' complete-word-back        # ... M-C-i cycle backward

  # but do add some extras
  bindkey '^X^I' complete-word-fwd            # cycles through file list
  bindkey '\311' complete-word-fwd            # so does M-i...
  bindkey '^[i' complete-word-fwd
  bindkey '\351' complete-word-fwd            # ...and M-I
  bindkey '^[I' complete-word-fwd
  bindkey '^[[Z' complete-word-back           # shift-Tab cycles backwards
  bindkey '^[[18~' complete-word-fwd          # F7 cycles forwards
  bindkey '^[[17~' complete-word-back         # F6 cycles backwards

  # -- region & line --
  bindkey '^W' backward-delete-word         # ^W acts like sh & csh,
  bindkey '^[^W' kill-region                # while ^[^W and ...
  bindkey '\227' kill-region                # ... M-C-w kill the region

  bindkey '^[^U' backward-kill-line   # like ^U in sh
  bindkey '\225' backward-kill-line

  # -- strings --
  bindkey -s '^[[E' ·                       # The 5 key with numlock off
endif
