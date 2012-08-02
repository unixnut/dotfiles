# modified from http://unix.stackexchange.com/posts/10065/revisions 

# check if stdout is a terminal...
if [ -t 1 ]; then
    # see if it supports colors...
    ncolors=$(tput colors)

    if [ -n "$ncolors" -a $ncolors -ge 8 ] ; then
        # only some of these have terminfo capabilities to turn them off
        bold="$(tput bold)"
        underline="$(tput smul)"
        no_underline="$(tput rmul)"
        reverse="$(tput rev)"
        standout="$(tput smso)"
        no_standout="$(tput rmso)"
        ansi_normal="$(tput sgr0)"
        fg_black="$(tput setaf 0)"
        fg_red="$(tput setaf 1)"
        fg_green="$(tput setaf 2)"
        fg_yellow="$(tput setaf 3)"
        fg_blue="$(tput setaf 4)"
        fg_magenta="$(tput setaf 5)"
        fg_cyan="$(tput setaf 6)"
        fg_white="$(tput setaf 7)"
        fg_default="$(tput setaf 9)"
        bg_black="$(tput setab 0)"
        bg_red="$(tput setab 1)"
        bg_green="$(tput setab 2)"
        bg_yellow="$(tput setab 3)"
        bg_blue="$(tput setab 4)"
        bg_magenta="$(tput setab 5)"
        bg_cyan="$(tput setab 6)"
        bg_white="$(tput setab 7)"
        bg_default="$(tput setab 9)"
    fi
fi

