### Run as root
#! /bin/bash

### APT packages
sudo sh -c "
  apt update;
  apt upgrade -y;
  apt install		\
    facter		\
    libnotify-bin	\
    ntp			\
    python3		\
    python3-dev		\
    python3-pip		\
    safe-rm		\
    sl			\
    snapd		\
    speedtest-cli	\
    thefuck		\
    tldr		\
    lm-sensors -y"

### Pip3 packages
sudo pip3 install	\
  thefuck

if [ -d ~/bash_profile.d ]; then
  mv ~/bash_profile.d ~/.bash_profile.d
fi

if [ -f ~/.bashrc ];then
  mv ~/.bashrc ~/.bashrc.original
fi

if [ -f ~/.profile ];then
  mv ~/.profile ~/.profile.original
fi

ln -s ~/.bash_profile.d/bashrc ~/.bashrc

source ~/.profile
