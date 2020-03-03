#! /bin/bash

### Uninstall Pip3 packages
#pip3 uninstall		\
#  thefuck

### Uninstall APT packages
#sudo sh -c "
#  apt --purge remove	\
#    facter		\
#    libnotify-bin	\
#    ntp			\
#    python3		\
#    python3-dev		\
#    python3-pip		\
#    python3-venv	\
#    safe-rm		\
#    sl			\
#    snapd		\
#    speedtest-cli	\
#    thefuck		\
#    tldr		\
#    lm-sensors -y;
#
#  apt --purge autoremove -y;
#  apt autoclean;
#"

### Delete installed profile if it exists and replace with saved profile.
if [ $(head -n 1 ~/.profile)="###transnat" ]; then
  rm ~/.profile
  mv ~/.profile.original ~/.profile
fi

### Delete installed bashrc if it exists and replace with saved bashrc.
if [ $(head -n 1 ~/.bashrc)="###transnat" ]; then
  rm ~/.bashrc
  mv ~/.bashrc.original ~/.bashrc
fi

### Delete profile folder if it exists.
if [ -d ~/.bash_profile.d ]; then
  rm -rf ~/.bash_profile.d
fi

### Load old profile.
source ~/.profile
