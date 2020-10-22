# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc" >> /dev/null
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes snap if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="/var/lib/snapd/snap/bin:$PATH"
fi

# set PATH so it includes script directory if it exists
if [ -d "$HOME/.env/scripts" ] ; then
    PATH="$HOME/.env/scripts:$PATH"
fi
