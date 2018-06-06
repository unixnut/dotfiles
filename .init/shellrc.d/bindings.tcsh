if ($?prompt) then
  # begin with Emacs bindings & change
  # (Emacs bindings are the default. For some reason, this command 
  # removes ^[[3~, etc.)
  ## bindkey -e

  bindkey '^[^M' prefix-meta

  # == completion ==
  # don't change the normal binding like I used to
  ## bindkey ^I complete-word-fwd             # cycles through file list
  ## bindkey '^[^I' complete-word-back        # while ^[^I and ...
  ## bindkey '\211' complete-word-back        # ... M-C-i cycle backward

  # but do add some extras
  bindkey '^X^I' complete-word-fwd            # cycles through file list
  bindkey '\311' complete-word-fwd            # so does M-i...
  bindkey '\351' complete-word-fwd            # ...and M-I
  bindkey '^[[Z' complete-word-back           # shift-Tab cycles backwards
  bindkey '^[[18~' complete-word-fwd          # F7 cycles forwards
  bindkey '^[[17~' complete-word-back         # F6 cycles backwards

  # == region & line ==
  bindkey '^W' backward-delete-word         # ^W acts like sh & csh,
  bindkey '^[^W' kill-region                # while ^[^W and ...
  bindkey '\227' kill-region                # ... M-C-w kill the region

  bindkey '^[^U' backward-kill-line   # like ^U in sh
  bindkey '\225' backward-kill-line

  # == strings ==
  bindkey -s '\e[E' ·                       # The 5 key with numlock off

  # -- jobs --
  switch ($TERM)
    case linux:
      bindkey -s "\e[[A" "fg\n"                   # F1 goes to the current buffer
      bindkey -s "\e[25~" "%-\n"                # S-F1 goes to the previous buffer
      bindkey -s "\e[[B" "jobs\n"                 # F2 shows the jobs list
      breaksw

    case putty:
      bindkey -s "\e[11~" "fg\n"                   # F1 goes to the current buffer
      bindkey -s "\e[23~" "%-\n"                # S-F1 goes to the previous buffer
      bindkey -s "\e[12~" "jobs\n"                 # F2 shows the jobs list
      breaksw

    default:
      bindkey -s "\eOP" "fg\n"                   # F1 goes to the current buffer
      bindkey -s "\eO1;2P" "%-\n"                # S-F1 goes to the previous buffer
      bindkey -s "\eOQ" "jobs\n"                 # F2 shows the jobs list
  endsw

  bindkey -s "^x1" "%1\n"
  bindkey -s "^x2" "%2\n"
  bindkey -s "^x3" "%3\n"
  bindkey -s "^x4" "%4\n"
  bindkey -s "^x5" "%5\n"
  bindkey -s "^x6" "%6\n"
  bindkey -s "^x7" "%7\n"
  bindkey -s "^x8" "%8\n"
  bindkey -s "^x9" "%9\n"
  bindkey -s "^x0" "%10\n"

  # -- dirs --
  bindkey -s "\e[20~" "popd\n"       # F9
  bindkey -s "\e[20;5~" "pushd "     # C-F9
  bindkey -s "\e[20;2~" "dirs\n"     # S-F9
  bindkey -s "\e[20;6~" "pushd ~\n"  # C-S-F9

  # -- other --
  bindkey -s "\e[19~" "locate "     # F8
  bindkey -s "\e[24~" "sudo -v\n"  # F12

  # == history ==
  # -- search based on starting contents of line --
  # F3 searches backwards
  # F4 searches forwards
  switch ($TERM)
    case linux:
      bindkey "\e[[C" history-search-backward
      bindkey "\e[[D" history-search-forward
      breaksw

    case putty:
      bindkey "\e[14~" history-search-backward
      bindkey "\e[15~" history-search-forward
      breaksw

    default:
  # (for gterm)
      bindkey "\eOR" history-search-backward
      bindkey "\eOS" history-search-forward
  endsw

  # Ctrl-up/down bindings
  switch ($TERM)
    case putty:
      bindkey "\eOA" history-search-backward
      bindkey "\eOB" history-search-forward
      breaksw

    default:
      # (for gterm)
      bindkey "\e[5A"   history-search-backward
      bindkey "\e[1;5A" history-search-backward
      bindkey "\e[5B"   history-search-forward
      bindkey "\e[1;5B" history-search-forward
  endsw

endif
