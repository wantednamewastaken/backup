# Need to seperate interactive logins from .bashrc or SCP will be unhappy

# neofetch


# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi
#
## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi
#
## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/.local/bin" ] ; then
#    PATH="$HOME/.local/bin:$PATH"
#fi
##echo $PATH

#PATH="$PATH:/home/ryan/.cargo/bin:/home/ryan/scripts:/usr/local/go/bin"
. "$HOME/.cargo/env"
