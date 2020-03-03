### Run as root
#! /bin/bash

sudo sh -c "
  apt update;
  apt upgrade -y;
  apt autoremove;
  apt autoclean;
  apt install		\
    facter		\
    libnotify-bin	\
    ntp			\
    python3		\
    safe-rm		\
    sl			\
    snapd		\
    speedtest-cli	\
    thefuck		\
    tldr		\
    lm-sensors -y"

ln -s ~/.bash_profile.d/bashrc ~/.bashrc

source ~/.bash_profile.d/bashrc
