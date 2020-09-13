#!/bin/bash

# User defaults
export EDITOR=vim
export TERM=xterm-256color
export SCRIPTS="${HOME}/.env/scripts"
export FUNCTIONS="${HOME}/.env/functions"
export PATH="${PATH}:${SCRIPTS}"

# Yubikey+SSH variables for .bashrc
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

