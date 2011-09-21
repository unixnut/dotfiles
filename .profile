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

. .init/setup.sh

# source /etc/bash.bashrc if necessary (/etc/profile doesn't source it
# in releases prior to wheezy)
if [ -n "$BASH" -a $DISTRO = Debian -a \( $DISTRO_RELEASE = sarge -o $DISTRO_RELEASE = etch -o $DISTRO_RELEASE = lenny -o $DISTRO_RELEASE = squeeze \) ]; then
  if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
  fi
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
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
