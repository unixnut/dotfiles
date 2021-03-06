# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# Note that is file is not sourced when running a command with ssh
## ! shopt -q login_shell && [ SHLVL = 1 -a -n "$SSH_CONNECTION" ] ; then...
# (OpenSUSE runs /etc/profile from /etc/bash.bashrc in this case)

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Do stuff here that is needed early, because .gnomerc is sourced later
# XDG_SESSION_ID
# DESKTOP_SESSION=mate (gdm and lightdm only)
# XDG_CURRENT_DESKTOP=MATE
if [ "$PROGNAME" = Xsession -o -n "$XDG_CURRENT_DESKTOP" -o -n "$DESKTOP_SESSION" ] ; then
  export X_LOGIN=y
fi

. ~/.init/setup.sh

# if running bash, source stuff that will be skipped by a login shell
# (Skip this if being sourced by /etc/gdm/Xsession or /etc/X11/Xsession.)
if [ -n "$BASH_VERSION" -a "$X_LOGIN" != y ]; then
  # source /etc/bash.bashrc if necessary (/etc/profile doesn't source it
  # in releases prior to wheezy)
  if [ $DISTRO = Debian -a $DISTRO_RELEASE_MAJOR -le 6 ]; then
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  fi

  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
  fi
fi

# vim: set filetype=sh :
### Local Variables:
### mode: shell-script
### sh-shell: bash
### End:
