### Run as root
#! /bin/bash

### Install APT packages
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
    python3-venv	\
    safe-rm		\
    sl			\
    snapd		\
    speedtest-cli	\
    thefuck		\
    tldr		\
    lm-sensors -y
"

### Install Pip3 packages
pip3 install		\
  thefuck

### Hide bash_profile.d.
if [ -d ~/bash_profile.d ]; then
  mv ~/bash_profile.d ~/.bash_profile.d
fi

### Save existing profile.
if [ -f ~/.profile ];then
  mv ~/.profile ~/.profile.original
  ln -s ~/.bash_profile.d/profile ~/.profile
fi

### Save existing bashrc.
if [ -f ~/.bashrc ];then
  mv ~/.bashrc ~/.bashrc.original
  ln -s ~/.bash_profile.d/bashrc ~/.bashrc
fi

### Load new profile
source ~/.profile
