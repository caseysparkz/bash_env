#! /bin/bash
sudo sh -c "
  apt --purge remove	\
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
    lm-sensors -y;

  apt --purge autoremove -y;
  apt autoclean"


